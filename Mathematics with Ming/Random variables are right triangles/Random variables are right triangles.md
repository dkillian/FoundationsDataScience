# Activity












# Reference

## Video transcript: [Random Variables are Right Triangles](https://www.youtube.com/watch?v=h4QF-2YiM88&list=PL1dqPc_qxc0cl0vc7FWux68cvIlYjdo-a&index=7)

Introduction: misconceptions about random variables
0:00
Three years ago, I taught this course
0:02
and I asked people to write down
0:05
definition of what a random variable
0:06
was. And almost no one really had any
0:10
idea of what it was. They said it was
0:12
something that had a probability density
0:15
or something that had a probability mass
0:16
function uh or something that had a had
0:20
a distribution function or something
0:22
like that. uh what it is if you want to
0:27
get a definition which fits in with the
0:29
axioms the only thing we know from the
0:31
axioms is there's a sample space there
0:35
are events and there are probabilities
0:37
so a random variable what it really is
0:40
is it's a function
0:42
do you also find the notion of random
0:43
variables a bit vague and mysterious
0:46
and what other concepts do you find
0:48
confusing in probability and statistics
0:51
write in the comment in this video we
0:53
We'll see how we can visualize random
0:55
variables as the size of certain right
0:58
triangles. Not in the usual uklidian
1:01
spaces of course but in a special kind
1:03
of abstract vector spaces known as
1:06
pillbert spaces where much of the
1:09
geometric intuition in the familiar
1:11
uklidian geometry can be retained in the
1:14
same spirit of how we visualize the
1:16
sample mean and sample variance as well
1:18
as linear regression. It's all about
1:21
geometry of vectors and their
1:23
projections.
Motivation: the method of least squares
1:24
So let's go. Our whole motivation of
1:27
introducing geometry into the study of
1:30
random variables is the following simple
1:32
proposition.
1:33
And we denote mu equals to the expected
1:35
value of x. And the proposition says mu
1:39
is the unique number that minimizes the
1:41
function g of c defined as the expected
1:45
value of x - c^ squ. So we can think of
1:49
the function G of C as a mean square
1:52
error and the proof is very basic. So we
1:55
can first expand the expression for G of
1:58
C using the linearity of the expectation
2:00
operator which is just a quadratic
2:02
function in C. So to minimize G, you
2:05
don't even need calculus. You just need
2:07
middle school algebra. But here we use
2:09
calculus anyway. We first differentiate
2:11
G and G prime of C is min - 2 EX + 2 C.
2:17
Using the first order condition for
2:18
extremum, we get C equals to EX. This
2:22
proposition might look rather
2:24
unremarkable. But if you've been
2:26
watching this channel, this looks
2:28
uncanny similar to the method of le
2:31
squares. This is our visualization for
2:33
obtaining the sample average in a
2:35
discrete setup. That is for a sample.
2:38
The red vector is our data vector. To
2:41
get the sample mean is to project onto
2:43
the line spanned by the vector 111. So
2:46
the purple vector has coordinates xar
2:48
xar xar
2:51
and the yellow vector that is the
2:53
difference between the sample vector and
2:55
the mean vector is the residual vector
2:58
and the residual vector is perpendicular
3:00
to the green line. So going back to our
3:03
random variable setup, we wish to
3:06
interpret the function g of c as some
3:09
sort of squared distance first order
3:11
condition that is g prime equals to zero
3:13
as some sort of orthogonality condition.
3:16
So this is our analogy for the random
Analogies: the geometry of bias-variance relations
3:18
variable case. Denote h the set of
3:21
random variables whose precise
3:24
definition will be given later. A random
3:26
variable X in H can be visualized as an
3:29
vector and this is a subspace the span
3:31
of one. So these are nothing but
3:33
constant value random variables a aka
3:36
degenerate random variables. This is a
3:38
subspace of H. We wish to pick a
3:40
constant which is a point on the span of
3:42
one that minimizes the distance between
3:45
itself and the tip of X. To do that we
3:48
use a projection and as per our
3:51
calculation that number should be E of X
3:54
and the minimum distance that is the
3:56
length of the residual vector is the
3:59
variance of X. So once again these are
4:01
all analogies we have not yet defined
4:03
what X is what does distance or
4:06
perpendicularity means in this vector
4:09
space which we yet have defined and we
4:11
don't just do this for fun because this
4:13
visualization immediately leads to
4:15
powerful consequences. What we're about
4:17
to show is a bias variance relation in
4:19
machine learning.
4:21
Suppose we wish to estimate a constant
4:24
theta, an unknown constant. But
4:26
regardless of its value, it is just a
4:29
constant and therefore it is a point on
4:31
the vector space span of one. An
4:34
estimator is a random variable. As per
4:36
our previous analogy, it is also a
4:38
vector. And here it is. Theta hat is a
4:41
vector in the space h. Again we project
4:45
the vector theta hat onto the line span
4:47
of one and the minimum distance is
4:50
exactly the square root of the variance
4:51
of theta hat exactly as earlier the
4:55
projection vector that is the vector
4:56
from the origin to the foot of
4:58
perpendicular is the mean of theta hat.
5:02
But recall that bias is defined as the
5:05
mean of theta hat minus the true value
5:07
of theta. This measures the systematic
5:09
error in your estimation. The expected
5:11
value of theta hat minus theta. That is
5:15
to say the directed line segment
5:17
starting from the tip of theta to the
5:20
foot of perpendicular is exactly the
5:22
bias of theta hat. And then and lastly
5:25
the distance between theta hat and theta
5:28
which is the expected value of theta hat
5:30
minus theta squared is the MSE is the
5:32
mean square error of theta hat. So the
5:35
blue right triangle shows exactly the
5:38
famous bias variance relation.
5:41
The MSE is equal to the variance plus
5:45
bias squared at Pythagorean theorem. In
5:49
practical machine learning, the famous
5:51
bias variance trade-off says that we can
5:53
tune the model complexity to a sweet
5:56
spot so that the MSSE is minimized. But
5:59
nowadays this is not really an
6:01
inevitable trade-off because for methods
6:04
such as the ensemble learner it is
6:07
possible to reduce the bias and variance
6:10
simultaneously. So from this application
6:13
the bias variance relation we can
6:15
clearly see the payoff of geometric
6:18
reasoning but at this point this is
6:20
still analogies. We need to introduce
6:23
the proper mathematical machinery to
6:25
make our discussions precise mathematics
6:28
and it all starts from defining what a
Hilbert space of random variables
6:31
random variable is. And to make this
6:33
analogy work as actual mathematics, we
6:36
would have to recast the random variable
6:38
X as a vector and introduce an inner
6:41
product because without an inner
6:42
product, we cannot talk about
6:44
orthogonality. And this is what
6:46
professor Gallagher was talking about in
6:48
the beginning. The random variables are
6:50
one of the most commonly misunderstood
6:52
concepts in probability theory. It is
6:55
nothing but a function from the sample
6:58
space to the real line. So in
7:00
probability theory, the primitive notion
7:02
is a sample space. Before time began,
7:04
there is a sample space and random
7:07
variables and distributions and all of
7:09
that. These are derived notions. Recall
7:11
that the sample space is just a
7:13
collection of so-called outcomes uh
7:15
which we interpret as the outcomes of
7:18
some experiments. You can think of
7:20
random variable as a measurement device.
7:23
It measures certain attributes that
7:25
we're interested about a certain outcome
7:28
and returns a real value. And notice we
7:30
never talked about the distribution
7:32
function of X or X is discreet or
7:35
continuous. It's all irrelevant. And
7:37
here's a quick example. Suppose our
7:39
experiment is tossing two coins and then
7:42
we have our sample space big omega. It
7:45
consists of four elements head tail tail
7:49
head and tail tail. And then we define
7:52
the random variable x that records or
7:54
counts the number of heads in our
7:56
experiment. So for each outcome little
7:59
omega corresponding x omega is
8:03
completely determined. If omega is head
8:05
head then x of omega is two. If omega is
8:09
head tail x of omega is one and so on.
8:13
So random variable is a bit of a
8:15
misnomer. It is not random not a
8:18
variable either. It's a completely
8:20
deterministic function. The set of real
8:23
value functions on omega is a real
8:25
vector space. They add like vectors and
8:27
they scale like vectors. Here we're
8:29
looking at linear algebra done right by
8:32
Sheldon Axel section 1B. The definition
8:34
of vector space
8:37
and the definition says a vector space
8:39
is a set V along with an addition on V
8:42
and a scale of multiplication on V such
8:44
that the following properties hold
8:46
commutativity of addition, associativity
8:49
of addition, the existence of additive
8:52
identity aka the zero vector. existence
8:55
of an additive inverse, existence of
8:58
multiplicative identity and the
9:00
distributive properties. So here we're
9:02
looking at the set of real value
9:04
functions and we just use the usual
9:06
definition for adding two functions and
9:08
multiplying a function by a constant as
9:11
the two vector space operations. So
9:13
obviously the set of real valued
9:15
functions on omega forms a real vector
9:18
space. Random variables are functions
9:20
from omega the sample space to real.
9:23
Therefore, random variables are vectors.
9:26
I know a lot of my viewers are highly
9:28
advanced. I can already hear their
9:30
complaints through the screen. Yes,
9:32
there is a subtlety called measurability
9:34
in that claim. Only so-called measurable
9:37
functions are random variables. So,
9:40
claiming that random variables are
9:41
vectors is actually saying the set of
9:46
measurable functions on omega forms a
9:49
vector space. And the proof requires
9:51
measures theory which is technical.
9:53
Please forgive me for hand waving
9:55
through this. So for our video we
9:57
restrict our attention to square
9:59
integraable random variables because we
10:01
want to calculate mean and variance and
10:04
the set is denoted as the scripted H. H
10:08
stands for Hilbert which is abbreviation
10:10
of H of L2 omega P and L2 stands for the
10:15
random variable X has finite second
10:18
moment that is the expected value of X
10:20
squ is finite omega stands for the
10:23
sample space and P stands for
10:26
probability measure. Um so the
10:28
probability measure gives us probability
10:30
for events and this accounts for the
10:32
vast majority of random variables
10:34
encountered in practical work and it can
10:36
be shown that h is also a vector space
10:40
and it is on this vector space where we
10:42
build our geometry. Here comes the inner
10:45
product and this is equivalent to the
10:47
dotproduct in Rn.
10:50
For two random variables x and y in h we
10:53
define their inner product. We use this
10:56
bracket notation for inner product and
10:58
we define its value as the expected
11:00
value of x times y and we can easily
11:04
show that our definition of inner
11:05
product satisfy the inner product axioms
11:08
given by axler. Now with one little
11:10
subtlety that is the definitess part um
11:13
if a random variable x satisfies
11:16
e x^2 equals to zero that is the inner
11:19
product with itself equals to zero. We
11:21
can't quite conclude that x is
11:23
identically zero. We can only say x is
11:25
equal to zero almost everywhere. To
11:27
rigorously discuss these notions
11:28
requires measure theory.
11:31
With an inner product in our hand, we
11:33
can immediately define length or norm.
11:37
The length of a random variable x is
11:40
defined as a square root of the inner
11:43
product of x with itself.
11:46
That is to say the square root of e x^2.
11:51
That's the length function. We also have
11:53
a distance function. The distance
11:56
between random variables X and Y is the
11:59
norm of X minus Y which is the same as
12:03
the square root of the expected value of
12:06
X - Y squared. So now we have all the
12:10
ingredients we need. These notions
12:12
allows us to do geometry between random
12:14
variables very similar to the familiar
14:10 The usual proofs in the light of geometry.
12:18
uklidian spaces. And here's the usual
12:20
proof of the variance and bias
12:22
relationship which looks rather messy
12:25
but if we understand the geometric
12:26
meaning it's actually pretty clear. So
12:30
here the first line is just the
12:32
definition of the MSE. If we don't know
12:34
the geometry the second step looks
12:36
completely arbitrary. Why do we minus
12:39
the mean and plus the mean again? Well
12:42
this is exactly an orthogonal
12:44
decomposition indeed. If we expand it
12:46
out, the cross term turns out to be
12:49
zero. And this is completely expected
12:52
because the expected value of theta hat
12:55
minus theta lies in the subspace the
12:58
span of one. Now we just show that in
13:01
the picture.
13:03
And theta hat minus the expected value
13:05
of theta hat. That's the residual
13:07
vector. The residual vector is always
13:09
perpendicular to the span of one. So
13:11
these two are orthogonal. Therefore, it
13:13
cancels out. So therefore the cross term
13:15
cancels out and we end up having the
13:18
variance term and the bias square term.
13:20
And this is exactly the same as proving
13:22
the pyagorean theorem in inner product
13:25
spaces.
13:27
If we have u and v as vectors in some
13:30
inner product space and u and v are
13:33
orthogonal meaning their inner product
13:36
is zero.
13:38
The left hand side u + v norm squared
13:42
can be written as the inner product of u
13:44
plus v and u plus v. And we just use the
13:46
bilinearity of the inner product to
13:49
expand it out. To expand it out the
13:52
cross terms disappear due to
13:54
orthogonality and we end up having the
13:56
pythagorean theorem.
13:58
So that's it for today and I have to
14:01
mention this is by no means the only
14:03
application of this point of view.
14:05
Expect more to come. Thank you very much
14:07
for watching and I'll see you next time.