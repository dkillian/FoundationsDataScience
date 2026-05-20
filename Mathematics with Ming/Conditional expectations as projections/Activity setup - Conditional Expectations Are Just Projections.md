# Activity: Conditional Expectations as Projections
















# Reference

## Video transcript

[Conditional Expectations Are Just Projections](https://www.youtube.com/watch?v=q5D7w_i2JPg)

Introduction
0:00
Hello. In this video, we're going to
0:01
discuss conditional expectations in
0:04
probability theory from a geometric
0:07
perspective. The central thesis is as
0:10
follows. Conditional expectations for
0:13
square integraable random variables,
0:15
also known as L2 random variables, can
0:18
be seen as orthogonal projections. And
0:21
that idea pretty much drives all the
0:23
rules that we use conditional
0:25
expectations in practice. The rules
0:27
includes the law of total expectation
0:30
also known as the Adams law or tower
0:33
property, the take out what's given rule
0:37
and finally the conditional variance
0:39
formula which also goes by the name of
0:41
the law of total variance, Eve's law or
0:45
ANOVA identity. And we shall demonstrate
0:47
that these are all orthogonality
0:49
statements and in particular the last
0:52
one the conditional variance formula is
0:54
a Pythagorean theorem.
0:57
So, if this is your first exposure to
1:00
conditional expectation or you've seen
1:02
it before but a little bit rusty, I
1:05
recommend going to the appendix of this
1:07
video to see how these formulas work.
1:10
The main focus of this video is
1:12
conceptual understanding rather than
1:15
specific applications.
1:17
Before we begin, I would like to
1:18
apologize for the upload delay. I've
1:21
been having some personal struggles
1:22
recently, but hopefully normal services
1:25
are now resumed. And by the way, thank
1:28
you very much for 10,000 subscribers. I
1:31
plan to do a Q&A video once I gathered
1:34
enough questions about math, about me,
1:37
about life or anything. So without
1:40
further ado, let's get into the main
1:42
topic. This video follows one of the
1:44
previous video called Random Variables
1:46
Are Triangles. The link is in the
1:48
description and is also in the
1:50
mathematical statistics playlist of this
1:52
channel. But I will do a quick recap of
1:55
what we did in that video. Geometry in
Geometry of L2 (a recap)
1:58
L2.
2:00
First we define a inner product space
2:03
called H. And this is in fact a Hbert
2:05
space. Uh but we won't get into the nook
2:07
and crannies of analysis in this video.
2:10
The emphasis is on geometric intuition.
2:12
So h consists of random variables whose
2:16
second moment e x^2 is finite.
2:20
Remember a random variable x is a
2:23
deterministic function from the sample
2:26
space to real. So h consists of the
2:29
so-called L2 random variables.
2:32
Among these random variables we can
2:34
define an operation called an inner
2:36
product.
2:38
The inner product between two random
2:40
variables X and Y is defined as the
2:42
expected value of X * Y. With the help
2:46
of an inner product, we can recover much
2:48
of the uklidian geometry that we're
2:50
familiar in 2D and 3D space. Even though
2:53
this is an abstract vector space,
2:55
infinite dimensional in fact for
2:58
example, if the inner product is zero,
3:01
we say the two vectors, in this case,
3:03
the two random variables are orthogonal.
3:06
And that's going to play a huge role.
3:08
With an inner product, we can define the
3:10
length or norm of a vector. With now a
3:14
norm in our hands, we can define a
3:17
distance or a metric between vectors in
3:20
H. For example, this viewpoint leads to
3:23
the mean variance right triangle.
3:26
For a random variable X, its mean E ex
3:30
is the projection of X onto the vector
3:34
subspace of constant random variables or
3:38
the span of one. Or equivalently, ex is
3:42
the constant that minimizes the distance
3:46
in the L2 sense between itself and the
3:50
vector X. We also discussed an
3:52
application in estimation theory, the
3:55
bias variance identity. So how do we
Animations of E[X|Y]
3:58
define the conditional expectation of X
4:01
given Y geometrically
4:04
where X and Y are L2 random variables?
4:07
As we know the unconditional expectation
4:11
is just a constant. Here we're
4:13
discussing conditional expectation. So
4:15
whatever that is condition is treated as
4:18
a constant. The conditional expectation
4:20
E of X given Y should be a function in
4:23
Y. And the random variables that are
4:26
functions of Y only is a vector subspace
4:30
of the original space L2. And it is
4:33
precisely because of this linear
4:35
algebraic perspective that allows us to
4:38
define conditional expectations
4:40
geometrically. So consider the universal
4:43
set the ambient space to be H. the space
4:48
of L2 random variables. The subspace HY
4:52
is the set of random variables that
4:55
depends on Y only. Remember Y is what's
4:58
given. If Y is given, then any function
5:03
purely in terms of Y is also given. And
5:06
here we're considering a random variable
5:08
X. Of course, this X vector may not lie
5:13
in the space HY.
5:15
We are going to define the conditional
5:18
expectation of x given y as the vector
5:22
that lies in hy that minimizes the
5:25
distance between itself and x.
5:29
As it turns out this is equivalent of
5:32
projecting the vector x onto the space
5:36
hy.
5:37
Um next we consider the vector subspace
5:40
one of constant random variables and it
5:44
is also a subspace of hy because
5:47
constant random variables are well
5:50
constant functions of y. So they can be
5:52
treated as functions in y as well. So
5:55
therefore one is a subspace of hy. But
5:58
as we just recalled projecting onto one
6:03
is the same as finding the unconditional
6:05
mean. So here we have a second
6:08
projection of X onto the line one. And
6:11
of course the projection is E of X the
6:14
unconditional mean. The length of the
6:17
perpendicular component of X relative to
6:20
the subspace Y is the square root of the
6:23
variance of X. And we can also project
6:27
the conditional expectation vector E of
6:29
X given Y onto the line one the subspace
6:33
one. And as it turns out this projection
6:36
is also E of X. Remember E of X given Y
6:39
is just another random variable purely
6:42
in terms of Y. And its perpendicular
6:44
component relative to the space one is a
6:48
square root of its own variance.
6:51
And finally we have this red right
6:53
triangle. The Pythagorean theorem in
6:56
this right triangle is exactly the
6:59
conditional variance formula. And by the
7:02
way, if you seen one of my previous
7:04
video called linear regression done,
7:06
right? This diagram that we just seen
7:09
for the conditional expectation
7:11
is visually identical to the one we've
7:15
seen in that video. Uh so this shows
7:17
that this geometric view of statistics
7:20
is not just a visual aid for
7:23
understanding certain data analytics
7:25
techniques but in fact steeps into the
7:28
foundation of probability theory itself.
7:31
It's very powerful and now it's time to
7:33
back up this diagram with some algebra
7:36
and the proofs are going to be very
7:38
natural in the light of the geometric
7:40
viewpoint.
Definition and Proofs
7:42
A formal treatment of conditional
7:44
expectation should start from a precise
7:46
definition.
7:48
And to do that, we take inspiration from
7:50
this simple proposition in the
7:52
prerequisite video.
7:55
That is the unconditional expectation
7:59
is the least square estimator. It
8:02
minimizes the square distance between x
8:05
and an arbitrary constant. And so we can
8:08
flip this proposition around and take
8:11
that as the definition of the mean. The
8:14
mean is simply the constant that
8:16
minimizes the square distance. Based on
8:19
that, we come up with this definition of
8:22
the conditional expectation. So consider
8:25
X and Y to be L2 random variables and we
8:28
define H of Y the set of G of Y such
8:31
that G is in L2. So H of Y is a subspace
8:35
of H. And we define the conditional
8:38
expectation of x given y as the function
8:42
g of y in hy
8:46
that minimizes the mean square error the
8:49
expected value of x minus g of y
8:52
squared. So that's our definition for
8:54
the conditional expectation. It is a
8:56
function in y only that minimizes the
8:59
square distance between x and itself.
9:02
And we're going to deduce all the rules
9:04
for the conditional expectations from
9:06
this definition. But that being said,
9:09
there is a subtlety here. Minimizing
9:11
distance over an infinite dimensional
9:14
subspace is not always achievable. Now,
9:17
this is a very subtle point. And to
9:20
resolve that would require functional
9:22
analysis. From functional analysis, we
9:26
have the following result. If the
9:28
subspace over which we're minimizing the
9:31
square distance is closed
9:34
then the minimizer exists and in fact
9:37
here h of y is a closed subspace so
9:40
everything works out. Okay. Um so the
9:43
lesson here is we need to be very
9:45
careful when we import finite
9:47
dimensional intuitions into infinite
9:50
dimensional vector spaces. Things may
9:52
not always be as straightforward as we
9:55
would imagine. But it just happens that
9:57
here everything is fine. So using this
9:59
definition, we'll prove the next
10:01
proposition. The conditional expectation
10:04
of x given y is function g of y if and
10:08
only if for any h of y in hy
10:12
perpendicular or orthogonal to h of y.
10:16
So geometrically this proposition says
10:18
this vertical vector is perpendicular or
10:22
orthogonal to everything in the space
10:24
hy. Once again, this is highly
10:26
intuitive. We're going to show that this
10:28
follows from our definition. And the
10:30
proof is almost identical to our
10:32
motivating proposition for the
10:34
unconditional mean. So let's consider
10:36
the function ph of t which is defined as
10:39
the expected value of x - g of y minus t
10:43
* h of y^ 2. And by the definition of
10:47
the conditional expectation,
10:49
the function ph is minimized when t is
10:52
equal to zero. Five of t should satisfy
10:56
the first order condition at t = to z.
10:59
And this is just simple calculus. We can
11:01
expand five of t and get a quadratic
11:04
function in t. The condition reads the
11:07
expected value of x - g of y * h of y is
11:11
equal to zero. And this is precisely an
11:13
orthogonality statement. So the
11:15
statement is proved. And at this point
11:17
and on, we're going to write the
11:19
conditional expectation in its usual
11:21
notation, the vertical bar notation. So
11:24
with this proposition in our hand, we
11:26
have two immediate corlaries. The first
11:29
one is the law of total expectation aka
11:32
the tower property. How do we do that?
11:34
Well, we simply take h of y to be one.
11:38
So therefore using the new notation of
11:41
the conditional expectation we have the
11:43
expected value of x minus its
11:45
conditional expectation given y* 1
11:48
equals to zero and then expand the outer
11:51
expectation using linearity. We get the
11:54
tower property. That's it. And we can
11:57
also easily obtain the take out what's
12:00
given rule which says the conditional
12:03
expectation of h of y * x given y is
12:08
equal to h of y times the conditional
12:11
expectation of x given y. So to prove
12:14
that we can once again use
12:16
orthogonality.
12:17
All we need to check is that for any g
12:20
in h of y the difference between hy
12:25
times e of x given y and h of y * x.
12:31
This difference is perpendicular to any
12:33
g of y. And how do we check
12:35
orthogonality? Well, we take the inner
12:38
product. We take the inner product of
12:40
the two and we can factor out the h of
12:43
y. So after factoring out h of y we have
12:46
the inner product between e of x given y
12:51
minus x quantity
12:53
and h of y * g of y is equal to zero.
12:58
Why? Because h * g is just another
13:01
vector another function another random
13:04
variable whatever you call it in the
13:06
subspace h of y. It only depends on y.
13:09
And as we just shown in the proposition,
13:12
X minus its own conditional expectation
13:16
given Y is perpendicular to any L2
13:18
random variable depend on Y.
13:21
And here that random variable is H of Y
13:24
* G of Y. So that's an orthogonality
13:27
statement which verifies this correlary.
13:31
So that whatever is already given can be
13:33
taken out of the expectation. And
13:35
lastly, we have the conditional variance
13:37
formula. We first define the conditional
13:39
variance. The expected value of X minus
13:42
the conditional expectation of X given Y
13:44
quantity squared given Y. Following that
13:46
definition, we can show that the
13:48
variance of X that is the unconditional
13:51
variance is equal to the expected value
13:54
of the conditional variance plus the
13:57
variance of the conditional expectation.
13:59
So there's a nice symmetry going on in
14:02
this formula. And that's also the reason
14:04
why it's called the EE law. E V. Let's
14:08
take a look at the proof. Following the
14:10
L2 geometry, we have orthogonal
14:13
decomposition X equals to the
14:16
conditional expectation of X given Y
14:19
plus X minus the conditional expectation
14:23
where X minus the conditional
14:25
expectation is perpendicular to H of Y.
14:28
Let's look at the animation again. This
14:30
is X projecting onto HY. get the
14:33
conditional expectation and we have two
14:35
orthogonal components. Let's center
14:37
everything by subtracting E of X on both
14:41
sides. So we have X - E ex equals to X
14:46
minus the conditional expectation plus
14:49
the conditional expectation minus the
14:51
unconditional expectation.
14:54
So the first term is what we call the
14:56
residual, the part that is perpendicular
14:59
to h of Y.
15:01
And the second term is what we call the
15:03
explained part borrowing language from
15:06
regression. And we wish to check that
15:08
the residual is perpendicular to the
15:10
explained part. And this is rather
15:13
simple because the explained part is a
15:17
function of y minus a constant which is
15:19
in turn a function of y. So the
15:21
explained part lives in hy. So therefore
15:25
the residual is perpendicular to the
15:27
explained part. And now that the two
15:30
terms on the right hand side are
15:31
orthogonal, we can apply the Pythagorean
15:34
identity by Pythagorean theorem in L2.
15:38
On the left hand side, we have the
15:41
square norm of X minus EX. On the right
15:45
hand side, we have the square norm of X
15:48
minus the conditional expectation
15:51
plus the square norm of the conditional
15:53
expectation minus the unconditional
15:56
expectation. At this point it remains to
15:59
interpret these square norm terms. The
16:02
left hand side is very easy is simply
16:05
the variance of x. The second term is
16:08
the expected value of x minus the
16:11
conditional expectation squared. But
16:13
what does that represent? Well, we can
16:15
use the tower property. It is equal to
16:19
the expectation of the conditional
16:21
expectation
16:23
of X minus E of X given Y quantity
16:26
squared.
16:27
But look at what's inside. That's
16:30
precisely the definition of the
16:31
conditional variance. So therefore we
16:33
have the expected value of the
16:35
conditional variance E of the variance
16:37
of X given Y. So that's the second term
16:42
or the first term on the right hand
16:43
side. And the third term, the square
16:46
norm of the conditional expectation of X
16:49
given Y minus EX is by definition the
16:53
expectation of E of X given Y minus EX
16:57
quantity squared. But we know that once
16:59
again from the tower property E of X is
17:02
just the mean of the conditional
17:04
expectation. So what we have is the
17:07
expectation of a random variable minus
17:09
its own mean quantity squared. And
17:12
that's exactly the definition of the
17:13
variance. So here we have the variance
17:15
of the conditional expectation E of X
17:18
given Y. So now we recovered all three
17:20
terms in the conditional variance
17:22
identity and we conclude that the
17:24
variance of X is the expected value of
17:27
the conditional variance plus the
17:29
variance of the conditional expectation.
17:31
And here let's finish watching the
17:33
animation one more time.
Appendix. An Example
17:38
As promised, let's look at an example of
17:41
how to work with conditional
17:42
expectations and conditional variances.
17:45
Let big n be a non-gative integer valued
17:48
random variable and x1, x2 all the way
17:52
be iid random variables. Let's suppose
17:55
that n and x i are independent for each
17:58
i. A random sum is an expression in
18:02
which both the number of terms and each
18:05
term are random. So we define s to be
18:07
the sum of x i where i ranges from one
18:10
to big n. And this is a definition for s
18:13
when n is greater or equal to one. If
18:16
there's no term that is when n is equal
18:18
to zero, we simply define s to be zero.
18:21
Our goal is to calculate the mean and
18:22
variance of s. And this is a problem
18:24
that is useful in actual real
18:27
mathematics. For example, a natural
18:29
approach is to condition on big n as
18:32
follows. So first let's calculate the
18:34
conditional expectation of s given big
18:37
n. This is big n * mux. Uh we can now
18:41
use the tower property is the expected
18:43
value of the conditional expectation.
18:46
But we just calculated that the
18:48
conditional expectation is n * mux and
18:51
we get mu n * mux. And this makes
18:55
intuitive sense. The random sum has an
18:58
average that is equal to the average
19:02
number of terms times the average of
19:04
each term.
19:06
Very intuitive. And now let's work out
19:09
the variance. Now let's first look at
19:11
the conditional variance. The first
19:12
term. The number of terms in the
19:14
summation is now temporarily fixed. And
19:17
since x i are independent, the variance
19:20
of a sum is simply the sum of variances
19:23
of each term, which is n * sigma x^2. So
19:27
that's the conditional variance. This is
19:29
a function in n just like the
19:32
conditional expectation is also a
19:34
function in n. And now it's time for the
19:36
final step. Plug everything into the
19:38
conditional variance formula. And that's
19:40
a simple example of how to work with
19:42
conditional expectations and conditional
19:44
variances. Thank you very much for
19:46
watching and I'll see you next time.