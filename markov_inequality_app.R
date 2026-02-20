library(shiny)
library(bslib)
library(ggplot2)

ui <- page_sidebar(
  title = "Markov's Inequality Explorer",
  sidebar = sidebar(
    selectInput("dist_type",
                "Distribution:",
                choices = c("Discrete (custom)" = "discrete",
                           "Normal" = "normal",
                           "Uniform" = "uniform", 
                           "Exponential" = "exponential",
                           "Poisson" = "poisson",
                           "Gamma" = "gamma")),
    sliderInput("a_threshold", 
                "Threshold (a):", 
                min = 0, 
                max = 20, 
                value = 5, 
                step = 0.5),
    hr(),
    uiOutput("dist_info")
  ),
  card(
    card_header("Distribution Visualization"),
    plotOutput("distPlot", height = "400px")
  ),
  card(
    card_header("Markov's Inequality Check"),
    tableOutput("markovTable")
  )
)

server <- function(input, output, session) {
  
  # Dynamic distribution info
  output$dist_info <- renderUI({
    switch(input$dist_type,
           "discrete" = div(
             h5("Custom Discrete"),
             p("X = {1, 2, 4, 8, 16}"),
             p("P = {0.4, 0.2, 0.2, 0.1, 0.1}"),
             p(strong("E[X] = 4"))
           ),
           "normal" = div(
             h5("Normal Distribution"),
             p("μ = 5, σ = 2"),
             p(strong("E[X] = 5"))
           ),
           "uniform" = div(
             h5("Uniform Distribution"),
             p("Range: [0, 10]"),
             p(strong("E[X] = 5"))
           ),
           "exponential" = div(
             h5("Exponential Distribution"),
             p("λ = 0.2"),
             p(strong("E[X] = 5"))
           ),
           "poisson" = div(
             h5("Poisson Distribution"),
             p("λ = 5"),
             p(strong("E[X] = 5"))
           ),
           "gamma" = div(
             h5("Gamma Distribution"),
             p("shape = 2, rate = 0.4"),
             p(strong("E[X] = 5"))
           )
    )
  })
  
  # Get distribution parameters
  get_params <- reactive({
    list(
      EX = switch(input$dist_type,
                  "discrete" = 4,
                  5),  # All continuous have mean 5
      max_x = switch(input$dist_type,
                     "discrete" = 20,
                     "poisson" = 20,
                     "normal" = 15,
                     "uniform" = 12,
                     "exponential" = 20,
                     "gamma" = 20)
    )
  })
  
  # Calculate actual probability
  calc_prob <- reactive({
    a <- input$a_threshold
    
    switch(input$dist_type,
           "discrete" = {
             x <- c(1, 2, 4, 8, 16)
             p <- c(0.4, 0.2, 0.2, 0.1, 0.1)
             sum(p[x >= a])
           },
           "normal" = pnorm(a, mean = 5, sd = 2, lower.tail = FALSE),
           "uniform" = punif(a, min = 0, max = 10, lower.tail = FALSE),
           "exponential" = pexp(a, rate = 0.2, lower.tail = FALSE),
           "poisson" = ppois(a - 1, lambda = 5, lower.tail = FALSE),
           "gamma" = pgamma(a, shape = 2, rate = 0.4, lower.tail = FALSE)
    )
  })
  
  # Main plot
  output$distPlot <- renderPlot({
    a <- input$a_threshold
    params <- get_params()
    actual_prob <- calc_prob()
    
    if (input$dist_type == "discrete") {
      # Discrete distribution
      x <- c(1, 2, 4, 8, 16)
      p <- c(0.4, 0.2, 0.2, 0.1, 0.1)
      
      plot_data <- data.frame(x = x, p = p)
      plot_data$highlight <- ifelse(x >= a, "≥ a", "< a")
      
      markov_bound <- params$EX / a
      
      ggplot(plot_data, aes(x = factor(x), y = p, fill = highlight)) +
        geom_col(width = 0.4) +
        geom_vline(xintercept = which(x == floor(a)), 
                   linetype = "dashed", color = "red", linewidth = 1) +
        scale_fill_manual(values = c("≥ a" = "#0067B9", "< a" = "lightgray")) +
        labs(x = "X", y = "Probability", fill = NULL,
             title = sprintf("P(X ≥ %.1f) = %.3f  |  Markov Bound = %.3f", 
                           a, actual_prob, markov_bound)) +
        theme_minimal(base_size = 14) +
        theme(legend.position = "bottom")
      
    } else if (input$dist_type == "poisson") {
      # Poisson (discrete but treated differently)
      x_vals <- 0:20
      probs <- dpois(x_vals, lambda = 5)
      
      plot_data <- data.frame(x = x_vals, p = probs)
      plot_data$highlight <- ifelse(x_vals >= a, "≥ a", "< a")
      
      markov_bound <- params$EX / a
      
      ggplot(plot_data, aes(x = factor(x), y = p, fill = highlight)) +
        geom_col(width = 0.4) +
        scale_fill_manual(values = c("≥ a" = "#0067B9", "< a" = "lightgray")) +
        labs(x = "X", y = "Probability", fill = NULL,
             title = sprintf("P(X ≥ %.1f) = %.3f  |  Markov Bound = %.3f", 
                           a, actual_prob, markov_bound)) +
        theme_minimal(base_size = 14) +
        theme(legend.position = "bottom",
              axis.text.x = element_text(size = 8))
      
    } else {
      # Continuous distributions
      x_range <- seq(0, params$max_x, length.out = 500)
      
      density_data <- data.frame(
        x = x_range,
        y = switch(input$dist_type,
                   "normal" = dnorm(x_range, mean = 5, sd = 2),
                   "uniform" = dunif(x_range, min = 0, max = 10),
                   "exponential" = dexp(x_range, rate = 0.2),
                   "gamma" = dgamma(x_range, shape = 2, rate = 0.4))
      )
      
      markov_bound <- params$EX / a
      
      ggplot(density_data, aes(x = x, y = y)) +
        geom_line(linewidth = 1) +
        geom_area(fill = "lightblue", alpha = 0.3) +
        geom_vline(xintercept = a, linetype = "dashed", 
                   color = "red", linewidth = 1.2) +
        geom_area(data = subset(density_data, x >= a),
                  fill = "#0067B9", alpha = 0.5) +
        annotate("text", x = a, y = max(density_data$y) * 0.9,
                 label = sprintf("a = %.1f\nP(X ≥ a) = %.3f\nMarkov Bound = %.3f", 
                               a, actual_prob, markov_bound),
                 hjust = -0.1, size = 4.5) +
        labs(x = "X", y = "Density") +
        theme_minimal(base_size = 14)
    }
  })
  
  # Markov table
  output$markovTable <- renderTable({
    a <- input$a_threshold
    params <- get_params()
    actual_prob <- calc_prob()
    markov_bound <- params$EX / a
    
    data.frame(
      Measure = c("Distribution Mean E[X]",
                  "Threshold (a)", 
                  "Markov Bound (E[X] / a)", 
                  "Actual P(X ≥ a)", 
                  "Inequality holds?"),
      Value = c(sprintf("%.2f", params$EX),
                sprintf("%.2f", a),
                sprintf("%.3f", markov_bound),
                sprintf("%.3f", actual_prob),
                ifelse(actual_prob <= markov_bound, "✓ Yes", "✗ No"))
    )
  }, bordered = TRUE, spacing = "s", width = "100%")
}

shinyApp(ui = ui, server = server)
