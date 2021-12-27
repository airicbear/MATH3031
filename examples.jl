### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ e0a3cd53-1743-4747-b107-ff337745a5b7
begin
	using PlutoUI
	using Plots
	using LinearAlgebra
	
	md"# Grinstead and Snell Examples"
end

# ╔═╡ 0569c756-0510-11ec-3297-9beeebde92c0
md"""
### Example 1.6

A die is rolled once.
We let $X$ denote the outcome of this experiment.
Then the sample space for this experiment is the 6-element set

$\Omega = \{1,2,3,4,5,6\}$

where each outcome $i$, for $i = 1, \ldots, 6$, corresponds to the number of dots on the face which turns up.
The event

$E = \{2, 4, 6\}$

corresponds to the statement that the result of the roll is an even number.
The event $E$ can also be described by saying that $X$ is even.
Unless there is reason to believe the die is loaded, the natural assumption is that every outcome is equally likely.
Adopting this convention means that we assign a probability of 1/6 to each of the six outcomes, i.e., $m(i) = 1/6$, for $1 \leq i \leq 6$.
"""

# ╔═╡ b2b81453-edff-4eaa-9741-235cc11e63f9
md"""
### Example 1.7
Consider an experiment in which a coin is tossed twice.
Let $X$ be the random variable which corresponds to this experiment.
We note that there are several ways to record the outcomes of this experiment.
We could, for example, record the two tosses, in the order which they occurred.
In this case, we have $\Omega = \{\text{HH}, \text{HT}, \text{TH}, \text{TT}\}$.
We could also record the outcomes by simply noting the number of heads that appeared.
In this case, we have $\Omega = \{0,1,2\}$.
Finally, we could record the two outcomes, without regard to the order in which they occurred.
In this case, we have $\Omega = \{\text{HH}, \text{HT}, \text{TT}\}$.

We will use, for the moment, the first of the sample spaces given above.
We will assume that all four outcomes are equally likely, and define the distribution function $m(\omega)$ by

$m(\text{HH}) = m(\text{HT}) = m(\text{TH}) = m(\text{TT}) = \frac{1}{4}.$

Let $E = \{\text{HH}, \text{HT}, \text{TH}\}$ be the event that at least one head comes up.
Then the probability of $E$ can be calculated as follows:

$\begin{align*}
P(E) &= m(\text{HH}) + m(\text{HT}) + m(\text{TH}) \\
&= \frac{1}{4} + \frac{1}{4} + \frac{1}{4} \\
&= \frac{3}{4}
\end{align*}$

Similarly, if $F = \{\text{HH}, \text{HT}\}$ is the event that heads comes up on the first toss, then we have

$\begin{align*}
P(F) &= m(\text{HH}) + m(\text{HT}) \\
&= \frac{1}{4} + \frac{1}{4} \\
&= \frac{1}{2}
\end{align*}$
"""

# ╔═╡ 0c832053-7b09-480a-8439-a08ca9c81487
md"""
### Example 1.8

(Example 1.6 continued) The sample space for the experiment in which the die is rolled is the 6-element set $\Omega = \{1,2,3,4,5,6\}$.
We assumed that the die was fair, and we chose the distribution function defined by

$m(i) = \frac{1}{6}, \qquad \text{for } i = 1, \ldots, 6.$

If $E$ is the event that the result of the roll is an even number, then $E = \{2,4,6\}$ and

$\begin{align*}
P(E) &= m(2) + m(4) + m(6) \\
&= \frac{1}{6} + \frac{1}{6} + \frac{1}{6} \\
&= \frac{1}{2}.
\end{align*}$

Notice that it is an immediate consequence of the above definitions that, for every $\omega \in \Omega$,

$P(\{\omega\}) = m(\omega).$

That is, the probability of the elementary event $\{\omega\}$, consisting of a single outcome $\omega$, is equal to the value $m(\omega)$ assigned to the outcome $\omega$ by the distribution function.
"""

# ╔═╡ c5634e59-e89e-459c-aaa3-fa23cf4925a5
md"""
### Example 1.9

Three people, A, B, and C, are running for the same office, and we assume that one and only one of them wins.
The sample space may be taken as the 3-element set $\Omega = \{\text{A}, \text{B}, \text{C}\}$ where each element corresponds to the outcome of that candidate's winning.
Suppose that A and B have the same chance of winning, but that C has only 1/2 the chance of A or B.
Then we assign

$m(\text{A}) = m(\text{B}) = 2m(\text{C})$

Since

$m(\text{A}) + m(\text{B}) + m(\text{C}) = 1,$

we see that

$2m(\text{C}) + 2m(\text{C}) + m(\text{C}) = 1,$

which implies that $5m(\text{C}) = 1$. Hence,

$m(\text{A}) = \frac{2}{5}, \quad m(\text{B}) = \frac{2}{5}, \quad m(\text{C}) = \frac{1}{5}.$

Let $E$ be the event that either A or C wins.
Then $E = \{\text{A}, \text{C}\}$, and

$P(E) = m(\text{A}) + m(\text{C}) = \frac{2}{5} + \frac{1}{5} = \frac{3}{5}.$
"""

# ╔═╡ a30414bc-ebab-4794-a21b-b45039e658be
md"""
### Example 2.6

A chord of a circle is a line segment both of whose endpoints lie on the circle.
Suppose that a chord is drawn *at random* in a unit circle.
What is the probability that its length exceeds $\sqrt{3}$?

Our answer will depend on what we mean by *random*, which will depend, in turn on what we choose for coordinates.
The sample space $\Omega$ is the set of all possible chords in the circle.
To find coordinates for these chords, we first introduce a rectangular coordinate system with origin at the center of the circle (see Figure 2.9).
We note that a chord of a circle is perpendicular to the radial line containing the midpoint of the chord.
We can describe each chord by giving:

1. The rectangular coordinates $(x,y)$ of the midpoint $M$, or

2. The polar coordinates $(r, \theta)$ of the midpoint $M$, or

3. The polar coordinates $(1, \alpha)$ and $(1, \beta)$ of the endpoints $A$ and $B$.

In each case we shall interpret *at random* to mean: choose these coordinates at random.

We can easily estimate this probability by computer simulation.
In programming this simulation, it is convenient to include certain simplifications, which we describe in turn:

1. To simulate this case, we choose values for $x$ and $y$ from $[-1,1]$ at random.
   Then we check whether $x^2 + y^2 \leq 1$.
   If not, the point $M = (x,y)$ lies outside the circle and cannot be the midpoint of any chord, and we ignore it.
   Otherwise, $M$ lies inside the circle and is the midpoint of a unique chord, whose length $L$ is given by the formula:

   $L = 2 \sqrt{1 - (x^2 + y^2)} \;.$

2. To simulate this case, we take account of the fact that any rotation of the circle does not change the length of the chord, so we might as well assume in advance that the chord is horizontal.
   Then we choose $r$ from $[0,1]$ at random, and compute the length of the resulting chord with midpoint $(r, \pi/2)$ by the formula:

   $L = 2 \sqrt{1 - r^2} \;.$

3. To simulate this case, we assume that one endpoint, say $B$, lies at $(1,0)$ (i.e., that $\beta = 0$).
   Then we choose a value for $\alpha$ from $[0, 2\pi]$ at random and compute the length of the resulting chord, using the Law of Cosines, by the formula:

   $L = \sqrt{2 - 2\cos{\alpha}} \;.$

The program **BertrandsParadox** carries out this simulation.
Running this program produces the results shown in Figure 2.10.
In the first circle in this figure, a smaller circle has been drawn.
Those chords which intersect this smaller circle have length of at least $\sqrt{3}$.
In the second circle in the figure, the vertical line intersects all chords of length at least $\sqrt{3}$.
In the third circle, again the vertical line intersects all chords of length at least $\sqrt{3}$.

In each case we run the experiment a large number of times and record the fraction of these lengths that exceed $\sqrt{3}$.
We have printed the results of every 100th trial up to 10,000 trials.

It is interesting to observe that these fractions are *not* the same in the three cases; they depend on our choice of coordinates.
This phenomenon was first observed by Bertrand, and is now known as *Bertrand's paradox*.
It is actually not a paradox at all; it is merely a reflection of the fact that different choices of coordinates will lead to different assignments of probabilities.
Which assignment is "correct" depends on what application or interpretation of the model one has in mind.

One can imagine a real experiment involving throwing long straws at a circle drawn on a card table.
A "correct" assignment of coordinates should not depend on where the circle lies on the card table, or where the card table sits in the room.
Jaynes has shown that the only assignment which meets this requirement is (2).
In this sense, the assignment (2) is the natural, or "correct" one (see Exercise 11).

We can easily see in each case what the true probabilities are if we note that $\sqrt{3}$ is the length of the side of an inscribed equilateral triangle.
Hence, a chord has length $L > \sqrt{3}$ if its midpoint has distance $d < 1/2$ from the origin (see Figure 2.9).
The following calculations determine the probability that $L > \sqrt{3}$ in each of the cases.

1. ``L > \sqrt{3}`` if $(x,y)$ lies inside a circle of radius 1/2, which occurs with probability

   $p = \frac{\pi (1/2)^2}{\pi (1)^2} = \frac{1}{4} \;.$

2. ``L > \sqrt{3}`` if $|r| < 1/2$, which occurs with probability

   $\frac{1/2 - (-1/2)}{1 - (-1)} = \frac{1}{2} \;.$

3. ``L > \sqrt{3}`` if $2\pi / 3 < \alpha < 4\pi / 3$, which occurs with probability

   $\frac{4\pi/3 - 2\pi/3}{2\pi - 0} = \frac{1}{3} \;.$

We see that our simulations agree quite well with these theoretical values.
"""

# ╔═╡ 75c57158-dc2e-453d-aec9-cc61db50edf7
# Simulation using rectangular coordinates x and y from [-1,1]
let
	L(x, y) = 2 * √(1 - (x^2 + y^2))
	N = 10000
	count = 0
	i = 0
	
	while i < N
		x, y = rand(-1:0.0001:1, 2)

		if x^2 + y^2 ≤ 1
			if L(x, y) > √3
				count += 1
			end
			
			i += 1
		end
	end
	
	count / N
end

# ╔═╡ e153ab4e-935a-46db-a60a-6df97b90c9fc
# Simulation using radius r from (0,0)
let
	L(r) = 2*√(1 - r^2)
	N = 10000
	count = 0
	
	for i ∈ 1:N
		r = rand(0:0.0001:1)
		
		if L(r) > √3
			count += 1
		end
	end
	
	count / N
end

# ╔═╡ 5b997321-5ab2-4b4f-b25d-f8ef05ff82a5
# Simulation using endpoint α from (1,0)
let
	L(α) = √(2 - 2cos(α))
	N = 10000
	count = 0
	
	for i ∈ 1:N
		α = rand(0:0.0001:2π)
		
		if L(α) > √3
			count += 1
		end
	end
	
	count / N
end

# ╔═╡ 28a2c5c8-c76d-4c20-9300-e41062a12290
md"""
### Example 2.7

The spinner experiment described in Example 2.1 has the interval $[0,1)$ as the set of possible outcomes.
We would like to construct a probability model in which each outcome is equally likely to occur.
We saw that in such a model, it is necessary to assign the probability 0 to each outcome.
This does not at all mean that the probability of *every* event must be zero.
On the contrary, if we let the random variable $X$ denote the outcome, then the probability

$P(0 ≤ X ≤ 1)$

that the head of the spinner comes to rest *somewhere* in the circle, should be equal to 1.
Also the probability that it comes to rest in the upper half of the circle should be the same as for the lower half, so that

$P\left(0 ≤ X < \frac{1}{2}\right) = P\left(\frac{1}{2} \leq X < 1\right) = \frac{1}{2}.$

More generally, in our model, we would like the equation

$P(c ≤ X < d) = d - c$

to be true for every choice of $c$ and $d$.

If we let $E = [c,d]$, then we can write the above formula in the form

$P(E) = ∫_E f(x) \;dx,$

where $f(x)$ is the. constant function with value 1.
This should remind the reader of the corresponding formula in the discrete case for the probability of an event:

$P(E) = \sum_{ω ∈ E} m(ω).$

The difference is that in the continuous case, the quantity being integrated, $f(x)$, is not the probability of the outcome $x$.
(However, if one uses infinitesimals, one can consider $f(x) \;dx$ as the probability of the outcome $x$.)

In the continuous case, we will use the following convention.
If the set of outcomes is a set of real numbers, then the individual outcomes will be referred to by small Roman letters such as $x$.
If the set of outcomes is a subset of $R^2$, then the individual outcomes will be denoted by $(x,y)$.
In either case, it may be more convenient to refer to an individual outcome by using $\omega$, as in Chapter 1.
"""

# ╔═╡ d660bb35-f913-410b-ba35-5df8336ba1c9
let
	f(x) = 1
	
	histogram(rand(1000), normed = true, color = :grey72, lw=2)
	plot!(f, xlims=[0,1], ylims=[0,1.2], lw=2, legend = false, color = :black, xticks = 0:0.2:1, yticks = 0:0.2:1, title = "Figure 2.11: Spinner experiment")
end

# ╔═╡ ede6660b-b119-44fa-b99c-bc97114dbefc
md"""
Figure 2.11 shows the results of 1000 spins of the spinner.
The function $f(x)$ is also shown in the figure.
The reader will note that the area under $f(x)$ and above a given interval is approximately equal to the fraction of outcomes that fell in that interval.
The function $f(x)$ is called the *density function* of the random variable $X$.
The fact that the area under $f(x)$ and above an interval corresponds to a probability is the defining property of density functions.
A precise definition of density functions will be given shortly.
"""

# ╔═╡ bf7ed529-487a-4f55-9057-e082a3a1abac
md"""
### Example 2.9

In the dart game considered above, suppose that, instead of observing where the dart lands, we observe how far it lands from the center of the target.

In this case, we take as our sample space the set $\Omega$ of all circles with centers at the center of the target.
It is convenient to describe these circles by their radii, so that each circle is identified by its raadius, $r$, $0 ≤ r ≤ 1$.
In this way, we may regard $\Omega$ as the subset $[0,1]$ of the real line.

What probabilities should we assign the events $E$ of $Ω$? If

$E = \{r : 0 ≤ r ≤ a\},$

then $E$ occurs if the dart lands within a distance $a$ of the center, that is, within the circle of radius $a$, and we saw in the previous example that under our assumptions the probability of this event is given by

$P([0,a]) = a^2.$

More generally, if

$E = \{r : a ≤ r ≤ b\},$

then by our basic assumptions,

$\begin{align*}
P(E) = P([a,b]) &= P([0,b]) - P([0,a]) \\
&= b^2 - a^2 \\
&= (b - a)(b + a) \\
&= 2(b - a) \frac{(b + a)}{2}.
\end{align*}$
"""

# ╔═╡ 2bf5f9ce-bf7a-45e0-b934-38b0125f5f81
md"""
### Example 2.10

(Example 2.7 continued) In the spinner experiment, we choose for our set of outcomes the interval $0 ≤ x < 1$, and for our density function

$f(x) = \begin{cases}
1, &\text{if } 0 \leq x < 1, \\
0, &\text{otherwise.}
\end{cases}$

If $E$ is the event that the head of the spinner falls in the upper half of the circle, then $E = \{x : 0 ≤ x ≤ 1/2\}$, and so

$P(E) = ∫_0^{1/2} 1 \;dx = \frac{1}{2}.$

More generally, if $E$ is the event that the head falls in the interval $[a,b]$, then

$P(E) = ∫_a^b 1 \;dx = b - a.$
"""

# ╔═╡ 47e8c44a-cb22-4b14-b355-2321a882748a
md"""
### Example 2.11

(Example 2.8 continued) In the first dart game experiment, we choose for our sample space a disc of unit radius in the plane and for our density function the function

$f(x,y) = \begin{cases}
1/\pi, &\text{if } x^2 + y^2 ≤ 1, \\
0, &\text{otherwise.}
\end{cases}$

The probability that the dart lands inside the subset $E$ is then given by

$\begin{align*}
P(E) &= ∬_E \frac{1}{\pi} \;dx \;dy \\
&= \frac{1}{\pi} ⋅ (\text{area of } E).
\end{align*}$

In these two examples, the density function is constant and does not depend on the particular outcome.
It is often the case that experiments in which the coordinates are chosen *at random* can be described by *constant* density functions, and, as in Section 1.2, we call such density functions *uniform* or *equiprobable*.
Not all experiments are of this type, however.
"""

# ╔═╡ 539be1c2-61ce-4e72-ba3a-eefb848f0486
md"""
### Example 2.12

(Example 2.9 continued)
In the second dart game experiment, we choose for our sample space the unit interval on the real line and for our density the function

$f(r) = \begin{cases}
2r, &\text{if } 0 < r < 1, \\
0, &\text{otherwise.}
\end{cases}$

Then the probability that the dart lands at distance $r$, $a \leq r \leq b$, from the center of the target is given by

$\begin{align*}
P([a,b]) &= \int_a^b 2r \;dr \\
&= b^2 - a^2.
\end{align*}$

Here again, since the density is small when $r$ is near 0 and large when $r$ is near 1, we see that in this experiment the dart is more likely to land near the rim of the target than near the center.
In terms of the bar graph of Example 2.9, the heights of the bars approximate the density function, while the areas of the bars approximate the probabilities of the subintervals (see Figure 2.12).

We can see in this example that, unlike the case of discrete sample spaces, the value $f(x)$ of the density function for the outcome $x$ is *not* the probability of $x$ occurring (we have seen that this probability is always 0) and in general $f(x)$ is *not a probability at all*.
In this example, if we take $\lambda = 2$ then $f(3/4) = 3/2$, which being bigger than 1, cannot be a probability.

Nevertheless, the density function $f$ does contain all the probability information about the experiment, since the probabilities of all events can be derived from it.
In particular, the probability that the outcome of the experiment falls in an interval $[a,b]$ is given by

$P([a,b]) = ∫_a^b f(x) \;dx,$

that is, by the *area* under the graph of the density function in the interval $[a,b]$.
Thus, there is a close connection here between probabilities and areas.
We have been guided by this close connection in making up our bar graphs; each bar is chosen so that its *area*, and not its height, represents the relative frequency of occurrence, and hence estimates the probability of the outcome faling in the associated interval.

In the language of the calculus, we can say that the probability of occurrence of an event of the form $[x, x + dx]$, where $dx$ is small, is approximately given by

$P([x, x + dx]) \approx f(x) \;dx,$

that is, by the area of the rectangle under the graph of $f$.
Note that as $dx \to 0$, this probability $\to 0$, so that the probability $P(\{x\})$ of a single point is again 0, as in Example 2.7.

A glance at the graph of a density function tells us immediately which events of an experiment are more likely.
Roughly speaking, we can say that where the density is large the events are more likely, and where it is small the events are less likely.
In Example 2.4 the density function is largest at 1.
Thus, given the two intervals $[0,a]$ and $[1,1 + a]$, where $a$ is a small positive real number, we see that $X$ is more likely to take on a value in the second interval than in the first.
"""

# ╔═╡ 2d1e03b7-e919-48b3-bf45-61016727207e
md"""
### Example 2.13

A real number is chosen at random from $[0,1]$ with uniform probability, and then this number is squared.
Let $X$ represent the result.
What is the cumulative distribution function of $X$?
What is the density of $X$?

We begin by letting $U$ represent the chosen real number.
Then $X = U^2$.
If $0 ≤ x ≤ 1$, then we have

$\begin{align*}
F_X(x) &= P(X ≤ x) \\
&= P(U^2 ≤ x) \\
&= P\left(U ≤ \sqrt{x}\right) \\
&= \sqrt{x}.
\end{align*}$

It is clear that $X$ always takes on a value between 0 and 1, so the cumulative distribution function of $X$ is given by

$F_X(x) = \begin{cases}
0, &\text{if } x \leq 0, \\
\sqrt{x}, &\text{if } 0 ≤ x ≤ 1, \\
1, &\text{if } x ≥ 1.
\end{cases}$

From this we easily calculate that the density function of $X$ is

$f_X(x) = \begin{cases}
0, &\text{if } x ≤ 0, \\
1/(2\sqrt{x}), &\text{if } 0 ≤ x ≤ 1, \\
0, &\text{if } x > 1.
\end{cases}$

Note that $F_X(x)$ is continuous, but $f_X(x)$ is not. (See Figure 2.13.)

When referring to a continuous random variable $X$ (say with a uniform density function), it is customary to say that "$X$ is uniformly *distributed* on the interval $[a,b]$."
It is also customary to refer to the cumulative distribution function of $X$ as the distribution function of $X$.
Thus, the word "distribution" is being used in several different ways in the subject of probability.
(Recall that it also has a meaning when discussing discrete random variables.)
When referring to the cumulative distribution function of a continuous random variable $X$, we will always use the world "cumulative" as a modifier, unless the use of another modifier, such as "normal" or "exponential," makes it clear.
Since the phrase "uniformly densitied on the interval $[a,b]$" is not acceptable English, we will have to say "uniformly distributed" instead.
"""

# ╔═╡ 7dd0b2be-006f-4ccd-bf51-064ba9d66187
md"""
### Example 2.14

In Example 2.4, we considered a random variable, defined to be the sum of two random real numbers chosen uniformly from $[0,1]$.
Let the random variables $X$ and $Y$ denote the two chosen real numbers.
Define $Z = X + Y$.
We will now derive expressions for the cumulative distribution function and the density function of $Z$.

Here we take for our sample space $\Omega$ the unit square in $𝐑^2$ with uniform density.
A point $ω ∈ Ω$ then consists of a pair $(x,y)$ of numbers chosen at random.
Then $0 ≤ Z ≤ 2$.
Let $E_z$ denote the event that $Z ≤ z$.
In Figure 2.14, we show the set $E_{.8}$.
The event $E_z$, for any $z$ between 0 and 1, looks very similar to the shaded set in the figure.
"""

# ╔═╡ 9621d536-8534-4805-9129-480b22ebe769
md"""
### Example 3.1

You are eating at Émile's restaurant and the waiter informs you that you have (a) two choices for appetizers: soup or juice; (b) three for the main course: a meat, fish or vegetable dish; and (c) two for dessert: ice cream or cake.
How many possible choices do you have for your complete meal?
We illustrate the possible meals by a tree diagram shown in Figure 3.1.
Your menu is decided in three stages—at each stage the number of possible choices does not depend on what is chosen in the previous stages: two choices at the first stage, three at the second, and two at the third.
From the tree diagram we see that the total number of choices is the product of the number of choices at each stage.
In this example we have $2 ⋅ 3 ⋅ 2 = 12$ possible menus.
Our menu example is an example of the following general counting technique.
"""

# ╔═╡ 9b1df226-e689-4985-a602-ac6dbd5b259c
md"""
### Example 3.2

We can show that there are at least two people in Columbus, Ohio, who have the same initials.
Assuming that each person has three initials, there are 26 possibilities for a person's first initial, 26 for the second, and 26 for the third.
Therefore, there are $26^3 = 17,576$ possible sets of initials.
This number is smaller than the number of people living in Columbus, Ohio; hence, there must be at least two people with the same three initials.
"""

# ╔═╡ fca1d663-062a-4f9d-be21-03faf2ada3e1
md"""
### Example 3.3

How many people do we need to have in a room to make it a favorable bet (probability of success greater than 1/2) that two people in the room will have the same birthday?

Since there are 365 possible birthdays, it is tempting to guess that we would need about 1/2 this number, or 183.
You would surely win this bet.
In fact, the number required for a favorable bet is only 23.
To show this, we find the probability $p_r$ that, in a room with $r$ people, there is no duplication of birthdays; we will have a favorable bet if this probability is less than one half.

Assume that there are 365 possible birthdays for each person (we ignore leap years).
Order the people from 1 to $r$.
For a sample point $ω$, we choose a possible sequence of length $r$ of birthdays each chosen as one of the 365 possible dates.
There are 365 possibilities for the first element of the sequence, and for each of these choices there are 365 for the second, and so forth, making $365^r$ possible sequences of birthdays.
For such a sequence, we can choose any of the 365 days for the first element, then any of the remaining 364 for the second, 363 for the third, and so forth until we make $r$ choices.
For the $r$th choice, there will be $365 - r + 1$ possibilities.
Hence, the total number of sequences with no duplications is

$365 ⋅ 364 ⋅ 363 ⋅ … ⋅ (365 - r + 1) \;.$

Thus, assuming that each sequence is equally likely,

$p_r = \frac{365 ⋅ 364 ⋅ 363 ⋅ … ⋅ (365 - r + 1)}{365^r} \;.$

We denote the product

$(n)(n - 1) ⋯ (n - r + 1)$

by $(n)_r$ (read "$n$ down $r$," or "$n$ lower $r$"). Thus,

$p_r = \frac{(365)_r}{(365)^r} \;.$

The program **Birthday** carries out this computation and prints the probabilities for $r = 20$ to 25.
Running this program, we get the results shown in Table 3.1.
As we asserted above, the probability for no duplication changes from greater than one half to less than one half as we move from 22 to 23 people.
To see how unlikely it is that we would lose our bet for larger numbers of people, we have run the program again, printing out values from $r = 10$ to $r = 100$ in steps of 10.
We see that in a room of 40 peopel the odds already heavily favor a duplication, and in a room of 100 the odds are overwhelmingly in favor of a duplication.
We have assumed that birthdays are equally likely to fall on any particular day.
Statistical evidence suggests that this is not true.
However, it is intuitively clear (but not easy to prove) that this makes it even more likely to have a duplication with a group of 23 people.
(See Exercise 19 to find out what happens on planets with more or fewer than 365 days per year.)
"""

# ╔═╡ 964307fd-6a01-4bf0-a62d-dfa8733a5998
md"""
### Example 3.5

Let $U = \{a,b,c\}$.
The subsets of $U$ are

$\phi, \; \{a\}, \; \{b\}, \; \{c\}, \; \{a,b\}, \; \{a,c\}, \; \{b,c\}, \; \{a,b,c\} \;.$
"""

# ╔═╡ 4781c7ca-7e0e-4187-bc95-f1df36ada88f
md"""
### Example 3.7

The following are Bernoulli trials processes:

1. A coin is tossed ten times.
   The two possible outcomes are heads and tails.
   The probability of heads on any one toss is 1/2.

2. An opinion poll is carried out by asking 1000 people, randomly chosen from the population, if they favor the Equal Rights Amendment---the two outcomes being yes and no.
   The probability $p$ of a yes answer (i.e., a success) indicates the proportion of people in the entire population that favor this amendment.

3. A gambler makes a sequence of 1-dollar bets, betting each time on black at roulette at Las Vegas.
   Here a success is winning 1 dollar and a failure is losing 1 dollar.
   Since in American roulette the gambler wins if the ball stops on one of 18 out of 38 positions and loses otherwise, the probability of winning is $p = 18/38 = .474$.
"""

# ╔═╡ 08899841-355e-4ff6-a8ac-02a14fd2ed22
md"""
### Example 3.8

A fair coin is tossed six times.
What is the probability that exactly three heads turn up?
The answer is

$b(6,.5,3) = \begin{pmatrix} 6 \\ 3 \end{pmatrix} \left(\frac{1}{2}\right)^3 \left(\frac{1}{2}\right)^3 = \frac{6!}{3! 3!} ⋅ \frac{1}{8} ⋅ \frac{1}{8} = \frac{20}{64} = 0.3125$
"""

# ╔═╡ 1028f79d-6a2e-4b8f-a527-54fd36f99cbe
binomial(6,3) * (0.5)^3 * (0.5)^3

# ╔═╡ c8b1a8ec-f6b6-459a-a562-5081871e5799
md"""
### Example 3.9

A die is rolled four times.
What is the probability that we obtain exactly one 6?
We treat this as Bernoulli trials with *success* = "rolling a 6" and *failure* = "rolling some number other than a 6."
Then $p = 1/6$, and the probability of exactly one success in four trials is

$b(4, 1/6, 1) = \begin{pmatrix} 4 \\ 1 \end{pmatrix} \left(\frac{1}{6}\right)^1 \left(\frac{5}{6}\right)^3 = .386$
"""

# ╔═╡ 98a95a0c-c33e-4e5f-88bd-f7646bda6bbf
md"""
### Example 4.1

An experiment consists of rolling a die once.
Let $X$ be the outcome.
Let $F$ be the event $\{X = 6\}$, and let $E$ be the event $\{X > 4\}$.
We assign the distribution function $m(\omega) = 1/6$ for $\omega = 1,2,…6$.
Now suppose that the die is rolled and we are told that the event $E$ has occurred.
This leaves only two possible outcomes: 5 and 6.
In the absence of any other information, we would still regard these outcomes to be equally likely, so the probability of $F$ becomes 1/2, making $P(F|E) = 1/2$.
"""

# ╔═╡ 47eda31f-adb7-4b5e-a7f9-4fd97178de71
md"""
### Example 4.2

In the Life Table (see Appendix C), one finds that in a population of 100,000 females, 89.835% can expect to live to age 60, while 57.062% can expect to live to age 80.
Given that a woman is 60, what is the probability that she lives to age 80?

This is an example of a conditional probability.
In this case, the original sample space can be thought of as a set of 100,000 females.
The events $E$ and $F$ are the subsets of the sample space consists of all women who live at least 60 years, and at least 80 years, respectively.
We consider $E$ to be the new sample space, and note that $F$ is a subset of $E$.
Thus, the size of $E$ is 89,835, and the size of $F$ is 57,062.
So, the probability in question equals 57,062/89,835 = .6352.
Thus, a woman who is 60 has a 63.52% chance of living to age 80.
"""

# ╔═╡ 306809ae-6828-4fea-829a-80d4ed2776b3
md"""
### Example 4.6

We consider now a problem called the *Monty Hall* problem.
This has long been a favorite problem but was revived by a letter from Craig Whitaker to Marilyn vos Savant for consideration in her column in *Parade Magazine*.
Craig wrote:

> Suppose you're on Monty Hall's *Let's Make a Deal!*
> You are given the choice of three doors, behind one door is car, the others, goats.
> You pick a door, say 1, Monty opens another door, say 3, which has a goat.
> Monty says to you "Do you want to pick door 2?"
> Is it to your advantage to switch your choice of doors?
"""

# ╔═╡ 48a863ba-1512-4322-8e07-0b0897c76d3b
md"""
### Example 4.7

Suppose that we have a coin which comes up heads with probability $p$, and tails with probability $q$.
Now suppose that this coin is tossed twice.
Using a frequency interpretation of probability, it is reasonable to assign to the outcome $(H, H)$ the probability $p^2$, to the outcome $(H,T)$ the probability $pq$, and so on.
Let $E$ be the event that heads turns up on the first toss and $F$ the event that tails turns up on the second toss.
We will now check that with the above probability assignments, these two events are independent, as expected.
We have $P(E) = p^2 + pq = p$, $P(F) = pq + q^2 = q$.
Finally $P(E ∩ F) = pq$, so $P(E ∩ F) = P(E) P(F)$.
"""

# ╔═╡ c79b2c68-68e0-44c0-a71b-7c11b9383438
md"""
### Example 4.8

It is often, but not always, intuitively clear when two events are independent.
In Example 4.7, let $A$ be the event "the first toss is a head" and $B$ the event "the two outcomes are the same." Then

$P(B∣A) = \frac{P(B ∩ A)}{P(A)} = \frac{P\{\text{HH}\}}{P\{\text{HH,HT}\}} = \frac{1/4}{1/2} = \frac{1}{2} = P(B).$

Therefore, $A$ and $B$ are independent, but the result was not so obvious.
"""

# ╔═╡ 0253ce68-3aca-4fe9-a299-42cb7f690d8a
md"""
### Example 4.9

Finally, let us give an example of two events that are not independent.
In Example 4.7, let $I$ be the event "heads on the first toss" and $J$ the event "two heads turn up."
Then $P(I) = 1/2$ and $P(J) = 1/4$.
The event $I ∩ J$ is the event "heads on both tosses" and has probability 1/4.
Thus, $I$ and $J$ are not independent since $P(I) P(J) = 1/8 \neq P(I ∩ J)$.
"""

# ╔═╡ 05122f37-b15d-412b-abda-3f62ba289614
md"""
### Example 4.17

A doctor gives a patient a test for a particular cancer.
Before the results of the test, the only evidence the doctor has to go on is that 1 woman in 1000 has this cancer.
Experience has shown that, in 99 percent of the cases in which cancer is present, the test is positive; and in 95 of the cases in which it is not present, it is negative.
If the test turns out to be positive, what probability should the doctor assign to the event that the cancer is present?
An alternative form of this question is to ask for the relative frequencies of false positives and cancers.

We are given that prior(cancer) = .001 and prior(not cancer) = .999.
We know also that P(+∣cancer) = .99, P(-∣cancer) = .01, P(+∣not cancer) = .05, and P(-∣not cancer) = .95.
Using this data gives the result shown in Figure 4.5.

We see now that the probability of cancer given a positive test has only increased from .001 to .019.
While this is nearly a twenty-fold increase, the probability that the patient has the cancer is still small.
Stated in another way, among the positive results, 98.1 percent are false positives, and 1.9 percent are cancers.
When a group of second-year medical students was asked this question, over half of the students incorrectly guessed the probability to be greater than .5.
"""

# ╔═╡ 7976928b-a82b-46eb-bc27-b84e8b6a429b
md"""
### Example 4.18

In the spinner experiment (cf. Example 2.1) suppose we know that the spinner has stopped with head in the upper half of the circle, $0 ≤ x ≤ 1/2$.
What is the probability that $1/6 ≤ x ≤ 1/3$?

Here $E = [0, 1/2]$, $F = [1/6, 1/3]$, and $F ∩ E = F$.
Hence

$\begin{align*}
P(F ∣ E) &= \frac{P(F ∩ E)}{P(E)} \\
&= \frac{1/6}{1/2} \\
&= \frac{1}{3}
\end{align*}$

which is reasonable, since $F$ is 1/3 the size of $E$.
The conditional density function here is given by

$f(x ∣ E) = \begin{cases}
2, &\text{if }\; 0 ≤ x < 1/2, \\
0, &\text{if }\; 1/2 ≤ x < 1.
\end{cases}$

Thus the conditional density function is nonzero only on $[0, 1/2]$, and is uniform there.
"""

# ╔═╡ 55d83b0f-534b-4fe6-8231-1eb2e4e33c2e
md""""
### Example 4.19

In the dart game (cf. Example 2.8), suppose we know that the dart lands in the upper half of the target.
What is the probability that its distance from the center is less than 1/2?

Here $E = \{(x,y) : y ≥ 0\}$, and $F = \{(x,y) : x^2 + y^2 < (1/2)^2\}$. Hence,

$P(F ∣ E) = \frac{P(F ∩ E)}{P(E)} = \frac{(1/\pi)[(1/2)(\pi/4)]}{(1/\pi)(\pi/2)} = 1/4 \;.$

Here again, the size of $F ∩ E$ is 1/4 the size of $E$.
The conditional density function is

$f((x,y) ∣ E) = \begin{cases}
f(x,y) / P(E) = 2/\pi, &\text{if } (x,y) ∈ E, \\
0, &\text{if } (x,y) ∉ E.
\end{cases}$
"""

# ╔═╡ e93d43ea-0373-4e57-8b22-989aa95d1e78
md"""
### Example 4.22

In this example, we define three random variables, $X_1$, $X_2$, and $X_3$.
We will show that $X_1$ and $X_2$ are independent, and that $X_1$ and $X_3$ are not independent.
Choose a point $\omega = (\omega_1, \omega_2)$ at random from the unit square.
Set $X_1 = {\omega_1}^2$, $X_2 = {\omega_2}^2$, and $X_3 = \omega_1 + \omega_2$.
Find the joint distributions $F_{12}(r_1, r_2)$ and $F_{23}(r_2,r_3)$.

We have already seen (see Example 2.13) that

$\begin{align*}
F_1(r_1) &= P(-∞ < X_1 ≤ r_1) \\
&= \sqrt{r_1}, \qquad \text{if } 0 ≤ r_1 ≤ 1\;,
\end{align*}$

and similarly,

$F_2(r_2) = \sqrt{r_2}\;,$

if $0 ≤ r_2 ≤ 1$. Now we have (see Figure 4.7)

$\begin{align*}
F_{12}(r_1, r_2) &= P(X_1 ≤ r_1 \text{ and } X_2 ≤ r_2) \\
&= P(\omega_1 ≤ \sqrt{r_1} \text{ and } \omega_2 ≤ \sqrt{r_2}) \\
&= \text{Area }(E_1) \\
&= \sqrt{r_1} \sqrt{r_2} \\
&= F_1(r_1) F_2(r_2) \;.
\end{align*}$

In this case $F_{12}(r_1, r_2) = F_1(r_1) F_2(r_2)$ so that $X_1$ and $X_2$ are independent.
On the other hand, if $r_1 = 1/4$ and $r_3 = 1$, then (see Figure 4.8)

$\begin{align*}
F_{13} &= P(X_1 ≤ 1/4, X_3 ≤ 1) \\
&= P(\omega_1 ≤ 1/2, \omega_1 + \omega_2 ≤ 1) \\
&= \text{Area }(E_2) \\
&= \frac{1}{2} - \frac{1}{8} = \frac{3}{8}\;.
\end{align*}$

Now recalling that

$F_3(r_3) = \begin{cases}
0, &\text{if } r_3 < 0, \\
(1/2){r_3}^2, &\text{if } 0 ≤ r_3 ≤ 1, \\
1 - (1/2)(2 - r_3)^2, &\text{if } 1 ≤ r_3 ≤ 2, \\
1, &\text{if } 2 < r_3,
\end{cases}$

(see Example 2.14), we have $F_1(1/4) F_3(1) = (1/2)(1/2) = 1/4$.
Hence, $X_1$ and $X_3$ are not independent random variables.
A similar calculation shows that $X_2$ and $X_3$ are not independent either.
"""

# ╔═╡ e8c89424-427b-426a-af17-8403527a89d7
md"""
### Example 5.5

Suppose that in a certain fixed amount $A$ of blood, the average human has 40 white blood cells.
Let $X$ be the random variable which gives the number of white blood cells in a random sample of size $A$ from a random individual.
We can think of $X$ as binomially distributed with each white blood cell in the body representing a trial.
If a given white blood cell turns up in the sample, then the trial corresponding to that blood cell was a success.
Then $p$ should be taken as the ratio of $A$ to the total amount of blood in the individual, and $n$ will be the number of white blood cells in the individual.
Of course, in practice, neither of these parameters is very easy to measure accurately, but presumably the number 40 is easy to measure.
But for the average human, we thenh ave $40 = np$, so we can think of $X$ as being Poission distributed, with parameter $\lambda = 40$.
In this case, it is easier to model the situation using the Poisson distribution than the binomial distribution.

To simulate a Poisson random variable on a computer, a good way is to take advante of the relationship between the Poisson distribution and the exponential density.
This relationship and the resulting simulation algorithm will be described in the next section.
"""

# ╔═╡ 6c89a3c0-9687-4262-be52-c5d6823d7bc3
md"""
### Example 5.7

(Queues)
Suppose that customers arrive at random times at a service station with one server, and suppose that each customer is served immediately if no one is ahead of him, but must wait his turn in line otherwise.
How long should each customer expect to wait?
(We define the waiting time of a customer to be the length of time between the time that he arrives and the time that he begins to be served.)

Let us assume that the interarrival times between successive customers are given by random variables $X_1$, $X_2$, …, $X_n$ that are mutually independent and identically distributed with an exponential cumulative distribution function given by

$F_X(t) = 1 - e^{-\lambda t}\;.$

Let us assume, too, that the service times for successive customers are given by random variables $Y_1$, $Y_2$, …, $Y_n$ that again are mutually independent and identically distributed with another exponential cumulative distribution function given by

$F_Y(t) = 1 - e^{-\mu t}\;.$

The parameters $\lambda$ and $\mu$ represent, respectively, the reciprocals of the average time between arrivals of customers and the average service time of the customers.
Thus, for example, the larger the value of $\lambda$, the smaller the average time between arrivals of customers.
We can guess that the length of time a customer will spend in the queue depends on the relative sizes of the average interarrival time and average service time.

It is easy to verify this conjecture by simulation.
The program **Queue** simulates this queueing process.
Let $N(t)$ be the number of customers in the queue at the time $t$.
Then we plot $N(t)$ as a function of $t$ for different choices of the parameters $\lambda$ and $\mu$ (see Figure 5.7).

We note that $\lambda < \mu$, then $1 / \lambda > 1 / \mu$, so the average interarrival time is greater than the average service time, i.e., customers are served more quickly, on average, than new ones arrive.
Thus, in this case, it is reasonable to expect that $N(t)$ remains small.
However, if $\lambda > \mu$ then customers arrive more quickly than they are served, and, as expected, $N(t)$ appears to grow without limit.

We can now ask: How long will a customer have to wait in the queue for service?
To examine this question, we let $W_i$ be the length of time that the $i$th customer has to remain in the system (waiting in line and being served).
Then we can present these data in a bar graph, using the program **Queue**, to give some idea of how the $W_i$ are distributed (see Figure 5.8).
(Here $\lambda = 1$ and $\mu = 1.1$.)

We see that these waiting times appear to be distributed exponentially.
This is always the case when $\lambda < \mu$.
The proof of this fact is too complicated to give here, but we can verify it by simulation for different choices of $\lambda$ and $\mu$, as above.
"""

# ╔═╡ 2b4107ba-8d16-40cb-a7c2-471a1eb7ff4f
md"""
### Example 5.8

Suppose that $X$ is a normally distributed random variable with parameters $\mu = 10$ and $\sigma = 3$.
Find the probability that $X$ is between 4 and 16.

To solve this problem, we note that $Z = (X - 10) / 3$ is the standardized version of $X$.
So, we have

$\begin{align*}
P(4 ≤ X ≤ 16) &= P(X ≤ 16) - P(X ≤ 4) \\
&= F_X(16) - F_X(4) \\
&= F_Z \left(\frac{16 - 10}{3}\right) - F_Z \left(\frac{4 - 10}{3}\right) \\
&= F_Z(2) - F_Z(-2)\;.
\end{align*}$

This last expression can be evaluated by using tabulated values of the standard normal distribution function (see 12.3); when we use this table, we find that $F_Z(2) = .9772$ and $F_Z(-2) = .0228$.
Thus, the answer is .9544.

In Chapter 6, we will see that the parameter $\mu$ is the mean, or average value, of the random variable $X$.
The parameter $\sigma$ is a measure of the spread of the random variable, and is called the standard deviation.
Thus, the question asked in this example is of a typical type, namely, what is the probability that a random variable has value within two standard deviations of its average value.
"""

# ╔═╡ 1d6365fb-15d7-4c3f-87df-6d8cb1226bec
md"""
### Example 6.1

Let an experiment consist of tossing a fair coin three times.
Let $X$ denote the number of heads which appear.
Then the possible values of $X$ are 0, 1, 2, and 3.
The corresponding probabilities are 1/8, 3/8, 3/8, and 1/8.
Thus, the expected value of $X$ equals

$0 \left(\frac{1}{8}\right) + 1 \left(\frac{3}{8}\right) + 2 \left(\frac{3}{8}\right) + 3 \left(\frac{1}{8}\right) = \frac{3}{2}\;.$

Later in this section we shall see a quicker way to compute this expected value, based on the fact that $X$ can be written as a sum of simpler random variables.
"""

# ╔═╡ a4a546d6-0377-4720-a4ac-5c073001c70a
md"""
### Example 6.2

Suppose that we toss a fair coin until a head first comes up, and let $X$ represent the number of tosses which were made.
Then the possible values of $X$ are 1,2,..., and the distribution function of $X$ is defined by

$m(i) = \frac{1}{2^i}\;.$

(This is just the geometric distribution with parameter 1/2.)
Thus, we have

$\begin{align*}
E(X) &= \sum_{i = 1}^{∞} i \frac{1}{2^i} \\
&= \sum_{i = 1}^{∞} \frac{1}{2^i} + \sum_{i = 2}^{∞} \frac{1}{2^i} + ⋯ \\
&= 1 + \frac{1}{2} + \frac{1}{2^2} + ⋯ \\
&= 2 \;.
\end{align*}$
"""

# ╔═╡ ff909678-e060-4465-beea-1b1f41ff8b15
md"""
### Example 6.3

(Example 6.2 continued)
Suppose that we flip a coin until a head first appears, and if the number of tosses equals $n$, then we are paid $2^n$ dollars.
What is the expected value of the payment?

We let $Y$ represent the payment.
Then,

$P(Y = 2^n) = \frac{1}{2^n} \;,$

for $n ≥ 1$.
Thus,

$E(Y) = \sum_{n = 1}^{∞} 2^n \frac{1}{2^n}\;,$

which is a divergent sum.
Thus, $Y$ has no expectation.
This example is called the *St. Petersburg Paradox*.
The fact that the above sum is infinite suggests that a player should be willing to pay any fixed amount per game for the privilege of playing this game.
The reader is asked to consider how much he or she would be willing to pay for this privilege.
It is unlikely that the reader's answer is more than 10 dollars; therein lies the paradox.
"""

# ╔═╡ 1c9dd3d5-2f51-4033-ae3f-454b196a1ca2
md"""
### Example 6.4

Let $T$ be the time for the first success in a Bernoulli trials process.
Then we take as sample space $Ω$ the integers 1, 2, ... and assign the geometric distribution

$m(j) = P(T = j) = q^{j - 1} p\;.$

Thus,

$\begin{align*}
E(T) &= 1 ⋅ p + 2qp + 3q^2 p + ⋯ \\
	 &= p(1 + 2q + 3q^2 + ⋯)\;.
\end{align*}$

Now if $|x| < 1$, then

$1 + x + x^2 + x^3 + ⋯ = \frac{1}{1 - x}\;.$

Differentiating this formula, we get

$1 + 2x + 3x^2 + ⋯ = \frac{1}{(1 - x)^2}\;,$

so

$E(T) = \frac{p}{(1 - q)^2} = \frac{p}{p^2} = \frac{1}{p}\;.$

In particular, we see that if we toss a fair coin a sequence of times, the expected time until the first heads is $1 / (1/2) = 2$.
If we roll a die a sequence of times, the expected number of rolls until the first six is $1 / (1/6) = 6$.
"""

# ╔═╡ 33d5b583-632d-4585-a71c-f397f219c875
md"""
### Example 6.7

We flip a coin and let $X$ have the value 1 if the coin comes up heads and 0 if the coin comes up tails.
Then, we roll a die and let $Y$ denote the face that comes up.
What does $X + Y$ mean, and what is its distribution?
This question is easily answered in this case, by considering, as we did in Chapter 4, the joint random variable $Z = (X,Y)$, whose outcomes are ordered pairs of the form $(x,y)$, where $0 ≤ x ≤ 1$ and $1 ≤ y ≤ 6$.
The description of the experiment makes it reasonable to assume that $X$ and $Y$ are independent, so the distribution function of $Z$ is uniform, with $1/12$ assigned to each outcome.
Now it is an easy matter to find the set of outcomes $X + Y$, and its distribution function.

In Example 6.1, the random variable $X$ denoted the number of heads which occur when a fair coin is tossed three times.
It is natural to think of $X$ as the sum of the random variables $X_1$, $X_2$, $X_3$, where $X_i$ is defined to be 1 if the $i$th toss comes up heads, and 0 if the $i$th toss comes up tails.
The expected values of the $X_i$'s are extremely easy to compute.
It turns out that the expected value of $X$ can be obtained by simply adding the expected values of the $X_i$'s.
This fact is stated in the following theorem.
"""

# ╔═╡ e89cec32-829b-4411-a895-3366a4d9893f
md"""
### Example 6.9

A coin is tossed twice.
$X_i = 1$ if the $i$th toss is heads and 0 otherwise.
We know that $X_1$ and $X_2$ are independent.
They each have expected value 1/2.
Thus $E(X_1 ⋅ X_2) = E(X_1) E(X_2) = (1/2)(1/2) = 1/4$.
"""

# ╔═╡ 6236a06f-dc02-4e59-84ed-de4f6f434e9e
md"""
### Example 6.10

Consider a single toss of a coin.
We define the random variable $X$ to be 1 if heads turns up and 0 if tails turns up, and we set $Y = 1 - X$.
Then $E(X) = E(Y) = 1/2$.
But $X ⋅ Y = 0$ for either outcome.
Hence, $E(X ⋅ Y) = 0 ≠ E(X) E(Y)$.
"""

# ╔═╡ 3fe8366d-14fa-49c3-87ce-68a007e9ce1c
md"""
### Example 6.17

Consider one roll of a die.
Let $X$ be the number that turns up.
To find $V(X)$, we must first find the expected value of $X$.
This is

$\mu = E(X) = 1 \left(\frac{1}{6}\right) + 2 \left(\frac{1}{6}\right) + 3 \left(\frac{1}{6}\right) + 4 \left(\frac{1}{6}\right) + 5 \left(\frac{1}{6}\right) + 6 \left(\frac{1}{6}\right) = \frac{7}{2}$

To find the variance of $X$, we form the new random variable $(X - \mu)^2$ and compute its expectation.
We can easily do this using the following table.

| $x$ | $m(x)$ | $(x - 7/2)^2$ |
|-----|--------|---------------|
| $1$ | $1/6$  | $25/4$        |
| $2$ | $1/6$  | $9/4$         |
| $3$ | $1/6$  | $1/4$         |
| $4$ | $1/6$  | $1/4$         |
| $5$ | $1/6$  | $9/4$         |
| $6$ | $1/6$  | $25/4$        |

From this table we find $E((X - \mu)^2)$ is

$V(X) = \frac{1}{6} \left(\frac{25}{4} + \frac{9}{4} + \frac{1}{4} + \frac{1}{4} + \frac{9}{4} + \frac{25}{4}\right) = \frac{35}{12}\;,$

and the standard deviation $D(X) = \sqrt{35/12} ≈ 1.707$.
"""

# ╔═╡ e68d391b-457e-4917-9f12-3edba928ee32
md"""
### Example 6.20

Let $X$ be uniformly distributed on the interval $[0, 1]$.
Then

$E(X) = ∫_0^1 x \;dx = 1/2\;.$

It follows that if we choose a large number $N$ of random numbers from $[0, 1]$ and take the average, then we can expect that this average should be close to the expected value of 1/2.
"""

# ╔═╡ 518b6487-c90a-4518-bb1b-7b3ee5df7eab
md"""
### Example 6.21

Let $Z = (x, y)$ denote a point chosen uniformly and randomly from the unit disk, as in the dart game in Example 2.8 and let $X = (x^2 + y^2)^{1/2}$ be the distance from $Z$ to the center of the disk.
The density function of $X$ can be easily shown to equal $f(x) = 2x$, so by the definition of expected value,

$\begin{align*}
E(X) &= ∫_0^1 x f(x) \;dx \\
&= ∫_0^1 x (2x) \;dx \\
&= \frac{2}{3} \;.
\end{align*}$
"""

# ╔═╡ c8b6a35f-98cc-475f-a613-a140321e0fcb
md"""
### Example 6.26

Let $X$ be an exponentially distributed random variable with parameter $\lambda$.
Then the density function of $X$ is

$f_X(x) = \lambda e^{-\lambda x}\;.$

From the definition of expectation and integration by parts, we have

$\begin{align*}
E(X) &= ∫_0^∞ x f_X(x) \;dx \\
&= \lambda ∫_0^∞ xe^{-\lambda x} \;dx \\
&= -xe^{-\lambda} \Big|_0^∞ + ∫_0^∞ e^{-\lambda x} \;dx \\
&= 0 + \left.\frac{e^{-\lambda x}}{-\lambda}\right|_0^∞ \\
&= \frac{1}{\lambda}
\end{align*}$

Similarly, using Theorems 6.11 and 6.15, we have

$\begin{align*}
V(X) &= ∫_0^∞ x^2 f_X(x) \;dx - \frac{1}{\lambda^2} \\
&= \lambda ∫_0^∞ x^2 e^{-\lambda x} \;dx - \frac{1}{\lambda^2} \\
&= -xe^{-\lambda x} \Big|_0^∞ + 2∫_0^∞ xe^{-\lambda x} \;dx - \frac{1}{\lambda^2} \\
&= -x^2 e^{-\lambda x} \Big|_0^∞ - \left.\frac{2xe^{-\lambda x}}{\lambda} \right|_0^∞ - \left.\frac{2}{\lambda^2} e^{-\lambda x}\right|_0^∞ - \frac{1}{\lambda^2} \\
&= \frac{2}{\lambda^2} - \frac{1}{\lambda^2} \\
&= \frac{1}{\lambda^2}
\end{align*}$

In this case, both $E(X)$ and $V(X)$ are finite if $\lambda > 0$.
"""

# ╔═╡ ea150028-a631-473b-86f7-e882ad24d0d8
md"""
### Example 7.3

Suppose we choose independently two numbers at random from the interval $[0,1]$ with uniform probability density.
What is the density of their sum?

Let $X$ and $Y$ be random variables describing our choices and $Z = X + Y$ their sum.
Then we have

$f_X(x) = f_Y(x) = \begin{cases}
1 &\text{if } 0 ≤ x ≤ 1, \\
0 &\text{otherwise};
\end{cases}$

and the density function for the sum is given by

$f_Z(z) = ∫_{-∞}^{+∞} f_X(z - y) f_Y(y) \;dy \;.$

Since $f_Y(y) = 1$ if $0 ≤ y ≤ 1$ and 0 otherwise, this becomes

$f_Z(z) = ∫_0^1 f_X(z - y) \;dy\;.$

Now the integrand is 0 unless $0 ≤ z - y ≤ 1$ (i.e., unless $z - 1 ≤ y ≤ z$) and then it is 1.
So if $0 ≤ z ≤ 1$, we have

$f_Z(z) = ∫_0^z dy = z\;,$

while if $1 < z ≤ 2$, we have

$f_Z(z) = ∫_{z - 1}^1 dy = 2 - z\;,$

and if $z < 0$ or $z > 2$ we have $f_Z(z) = 0$ (see Figure 7.2).
Hence,

$f_Z(z) = \begin{cases}
z, &\text{if } 0 ≤ z ≤ 1, \\
2 - z, &\text{if } 1 < z ≤ 2, \\
0, &\text{otherwise.}
\end{cases}$

Note that this result agrees with that of Example 2.4.
"""

# ╔═╡ 26bc3206-4b04-48bf-89d8-a37c6a3d3a07
let
	function fZ(z)
		if 0 ≤ z ≤ 1
			z
		elseif 1 < z ≤ 2
			2 - z
		else
			0
		end
	end
	plot(z -> fZ(z), xlims=[-0.1,2.1], ylims=[0,1.25], legend=false, lw=2)
end

# ╔═╡ be788e47-34df-41ea-a83b-f69ba7cbda40
md"""
### Example 7.4

Suppose we choose two numbers at random from the interval $[0, ∞)$ with an *exponential* density with parameter $\lambda$.
What is the density of their sum?

Let $X,Y$, and $Z = X + Y$ denote the relevant random variables, and $f_X$, $f_Y$, and $f_Z$ their densities.
Then

$f_X(x) = f_Y(y) = \begin{cases}
\lambda e^{-\lambda x}, &\text{if } x ≥ 0, \\
0, &\text{otherwise};
\end{cases}$

and so, if $z > 0$,

$\begin{align*}
f_Z(z) &= ∫_{-∞}^{+∞} f_X(z - y) f_Y(y) \;dy \\
&= ∫_0^z \lambda e^{-\lambda(x - y)} \lambda e^{-\lambda y} \;dy \\
&= ∫_0^x \lambda^2 e^{-\lambda x} \;dy \\
&= \lambda^2 ze^{-\lambda x},
\end{align*}$

while if $z < 0$, $f_Z(z) = 0$ (see Figure 7.3). Hence,

$f_Z(z) = \begin{cases}
\lambda^2 ze^{-\lambda x}, &\text{if } z ≥ 0, \\
0, &\text{otherwise.}
\end{cases}$
"""

# ╔═╡ eb5519b1-7cac-494e-b96b-0297b4fba54a
let
	function fZ(z, λ=1)
		if z ≥ 0
			λ^2 * z*exp(-λ*z)
		else
			0
		end
	end
	
	plot(z -> fZ(z), xlims=[0,6], ylims=[0,0.4], legend=false)
end

# ╔═╡ c1011fa0-2144-4674-853b-f0e6234d0574
md"""
### Example 7.5

It is an interesting and important fact that the convolution of two normal densities with means $\mu_1$ and $\mu_2$ and variances $\sigma_1$ and $\sigma_2$ is again a normal density, with mean $\mu_1 + \mu_2$ and variance ${\sigma_1}^2 + {\sigma_2}^2$.
We will show this in the special case that both random variables are standard normal.
The general case can be done in the same way, but the calculation is messier.
Another way to show the general result is given in Example 10.17.

Suppose $X$ and $Y$ are two independent random variables, each with the standard *normal* density (see Example 5.8).
We have

$f_X(x) = f_Y(y) = \frac{1}{\sqrt{2\pi}} e^{-x^2 / 2}\;,$

and so

$\begin{align*}
f_Z(z) &= f_X ∗ f_Y(z) \\
&= \frac{1}{2\pi} ∫_{-∞}^{+∞} ∫_{-∞}^{+∞} e^{-(z - y)^2 / 2} e^{-y^2 / 2} \;dy \\
&= \frac{1}{2\pi} e^{-z^2 / 4} ∫_{-∞}^{+∞} e^{-(y - z / 2)^2} \;dy \\
&= \frac{1}{2\pi} e^{-x^2 / 4} \sqrt{\pi} \left[\frac{1}{\sqrt{\pi}} ∫_{-∞}^{∞} e^{-(y - x) / 2)^2} \;dy\right].
\end{align*}$

The expression in the brackets equals 1, since it is the integral of the normal density function with $\mu = 0$ and $\sigma = \sqrt{2}$.
So, we have

$f_Z(z) = \frac{1}{\sqrt{4\pi}} e^{-x^2 / 4}\;.$
"""

# ╔═╡ fd63d842-8561-431e-bc64-393085f3b995
md"""
### Example 8.1

Let $X$ be any random variable with $E(X) = \mu$ and $V(X) = \sigma^2$.
Then, if $\epsilon = k\sigma$, Chebyshev's Inequality states that

$P(|X - \mu| ≥ k\sigma) ≤ \frac{\sigma^2}{k^2 \sigma^2} = \frac{1}{k^2}\;.$

Thus, for any random variable, the probability of a deviation from the mean of more than $k$ standard deviations is $≤ 1/k^2$.
If, for example, $k = 5$, $1/k^2 = .04$.
"""

# ╔═╡ 67db64f7-562b-444e-9c10-6f441cedb87b
md"""
### Example 8.4

Let $X$ be any continous random variable with $E(X) = \mu$ and $V(X) = \sigma^2$.
Then, if $\epsilon = k\sigma = k$ standard deviations for some integer $k$, then

$P(|X - \mu| ≥ k\sigma) ≤ \frac{\sigma^2}{k^2 \sigma^2} = \frac{1}{k^2}\;,$

just as in the discrete case.
"""

# ╔═╡ 2c92d351-c567-46f3-9ed0-211d47d587d8
md"""
### Example 8.5

Suppose we choose at random $n$ numbers from the interval $[0, 1]$ with uniform distribution.
Then if $X_i$ describes the $i$th choice, we have

$\begin{align*}
\mu = E(X_i) &= ∫_0^1 x \;dx = \frac{1}{2} \;, \\
\sigma^2 = V(X_i) &= ∫_0^1 x^2 \;dx - \mu^2 = \frac{1}{3} - \frac{1}{4} = \frac{1}{12} \;.
\end{align*}$

Hence,

$\begin{align*}
E\left(\frac{S_n}{n}\right) &= \frac{1}{2} \;, \\
V\left(\frac{S_n}{n}\right) &= \frac{1}{12n} \;,
\end{align*}$

and for any $\epsilon > 0$,

$P\left(\left|\frac{S_n}{n} - \frac{1}{2}\right| ≥ \epsilon\right) ≤ \frac{1}{12n\epsilon^2}\;.$

This says that if we choose $n$ numbers at random from $[0,1]$, then the chances are better than $\displaystyle 1 - \frac{1}{12n\epsilon^2}$ that the difference $\displaystyle \left|\frac{S_n}{n} - \frac{1}{2}\right|$ is less than $0.1$ are better than $\displaystyle 1 - \frac{100}{12n}$.
For $n = 100$, this is about $.92$, but if $n = 1000$, this is better than $.99$ and if $n = 10,000$, this is better than $.999$.

We can illustrate what the Law of Large Numbers says for this example graphically.
The density for $\displaystyle A_n = \frac{S_n}{n}$ is determined by

$f_{A_n}(x) = nf_{S_n}(nx)\;.$

We have seen in Section 7.2, that we can compute the density $f_{S_n}(x)$ for the sum of $n$ uniform random variables.
In Figure 8.2 we have used this to plot the density for $A_n$ for various values of $n$.
We have shaded in the area for which $A_n$ would lie between $.45$ and $.55$.
We see that as we increase $n$, we obtain more and more of the total area inside the shaded region.
The Law of Large Numbers tells us that we can obtain as much of the total area as we please inside the shaded region by choosing $n$ large enough (see also Figure 8.1).
"""

# ╔═╡ d689d056-8883-45bb-8ca1-bfd1d5305f35
md"""
### Example 8.6

Suppose we choose $n$ real numbers at random, using a normal distribution with mean 0 and variance 1.
Then

$\begin{align*}
\mu = E(X_i) &= 0 \;, \\
\sigma^2 = V(X_i) &= 1 \;.
\end{align*}$

Hence,

$\begin{align*}
E\left(\frac{S_n}{n}\right) &= 0 \, \\
V\left(\frac{S_n}{n}\right) &= \frac{1}{n} \;,
\end{align*}$

and, for any $\epsilon > 0$,

$P\left(\left|\frac{S_n}{n} - 0\right| ≥ \epsilon\right) ≤ \frac{1}{n\epsilon^2}\;.$

In this case it is possible to compare the Chebyshev estimate for $\displaystyle P\left(\left|\frac{S_n}{n} - \mu\right| ≥ \epsilon\right)$ in the Law of Large Numbers with exact values, since we know the density function for $\displaystyle \frac{S_n}{n}$ exactly (see Example 7.9).
The comparison is shown in Table 8.1, for $\epsilon = .1$.
The data in this table was produced by the program **LawContinuous**.
We see here that the Chebyshev estimates are in general *not* very accurate.
"""

# ╔═╡ a9af5bd1-a780-4b64-a5f4-f68f08e06d83
md"""
### Example 8.7

Let $g(x)$ be a continuous function defined for $x ∈ [0,1]$ with values in $[0,1]$.
In Section 2.1, we showed how to estimate the area of the region under the graph of $g(x)$ by the Monte Carlo method, that is, by choosing a large number of random values for $x$ and $y$ with uniform distribution and seeing what fraction of the points $P(x,y)$ fell inside the region under the graph (see Example 2.2).

Here is a better way to estimate the same area (see Figure 8.3).
Let us choose a large number of independent values $X_n$ at random from $[0,1]$ with uniform density, set $Y_n = g(X_n)$, and find the average value of the $Y_n$.
Then this average is our estimate for the area.
To see this, note that if the density function for $X_n$ is uniform,

$\begin{align*}
\mu &= E(Y_n) = ∫_0^1 g(x) f(x) \;dx \\
&= ∫_0^1 g(x) \;dx \\
&= \text{ average value of } g(x)
\end{align*}$

while the variance is

$\sigma^2 = E((Y_n - \mu)^2) = ∫_0^1 (g(x) - \mu)^2 \;dx < 1\;,$

since for all $x$ in $[0,1]$, $g(x)$ is in $[0,1]$, hence $\mu$ is in $[0,1]$, and so $|g(x) - \mu| ≤ $.
Now let $A_n = (1 / n)(Y_1 + Y_2 + ⋯ + Y_n)$.
Then by Chebyshev's Inequality, we have

$P(|A_n - \mu| ≥ \epsilon) ≤ \frac{\sigma^2}{n\epsilon^2} < \frac{1}{n\epsilon^2}\;.$

This says that to get within $\epsilon$ of the true value for $\displaystyle \mu = ∫_0^1 g(x) \;dx$ with probability at least $p$, we should choose $n$ so that $\frac{1}{n\epsilon^2} ≤ 1 - p$ (i.e., so that $n ≥ 1 / \epsilon^2 (1 - p)$).
Note that this method tells us how large to take $n$ to get a desired accuracy.
"""

# ╔═╡ f29a09ed-ccc8-42b1-b08b-a69937358ec1
md"""
### Example 9.1

Let us estimate the probability of exactly 55 heads in 100 tosses of a coin.
For this case $np = 100 ⋅ 1/2 = 50$ and $\sqrt{npq} = \sqrt{100 ⋅ 1/2 ⋅ 1/2} = 5$.
Thus $x_{55} = (55 - 50)/5 = 1$ and

$P(S_{100} = 55) ∼ \frac{\phi(1)}{5} = \frac{1}{5} \left(\frac{1}{\sqrt{2\pi}} e^{-1/2}\right) = .0484\;.$

To four decimal places, the actual value is .0485, and so the approximation is very good.

The program **CLTBernoulliLocal** illustrates this approximation for any choice of $n$, $p$, and $j$.
We have run this program for two examples.
The first is the probability of exactly 50 heads in 100 tosses of a coin; the estimate is .0798, while the actual value, to four decimal places, is .0796.
The second example is the probability of exactly eight sixes in 36 rolls of a die; here the estimate is .1093, while the actual value, to four decimal places, is .1196.

The individual binomial probabilities tend to 0 as $n$ tends to infinity.
In most applications we are not interested in the probability that a specific outcome occurs, but rather in the probability that the outcome lies in a given interval, say the interval $[a,b]$.
In order to find this probability, we add the heights of the spike graphs for values of $j$ between $a$ and $b$.
This is the same as asking for the probability that the standardized sum $S_n^*$ lies between $a^*$ and $b^*$, where $a^*$ and $b^*$ are the standardized values of $a$ and $b$.
But as $n$ tends to infinity the sum of these areas could be expected to approach the area of the standard normal density between $a^*$ and $b^*$.
The *Central Limit Theorem* states that this does indeed happen.
"""

# ╔═╡ 9a918d90-d77d-4d98-886e-4a59da7342a3
md"""
### Example 9.2

A coin is tossed 100 times.
Estimate the probability that the number of heads lies between 40 and 60 (the word "between" in mathematics means inclusive of the endpoints).
The expected number of heads is $100 ⋅ 1/2 = 50$, and the standard deviation for the number of heads is $\sqrt{100 ⋅ 1/2 ⋅ 1/2} = 5$.
Thus, since $n = 100$ is reasonably large, we have

$\begin{align*}
P(40 ≤ S_n ≤ 60) &≈ P\left(\frac{39.5 - 50}{5} ≤ S_n^* ≤ \frac{60.5 - 50}{5}\right) \\
&= P(-2.1 ≤ S_n^* ≤ 2.1) \\
&≈ \text{NA}(-2.1, 2.1) \\
&= 2\text{NA}(0, 2.1) \\
&≈ .9642\;.
\end{align*}$

The actual value is .96480, to five decimal places.

Note that in this case we are asking for the probability that the outcome will not deviate by more than two standard deviations from the expected value.
Had we asked for the probability that the number of successes is between 35 and 65, this would have represented three standard deviations from the mean, and, using our 1/2 correction, our estimate would be the area under the standard normal curve between -3.1 and 3.1, or 2NA(0,3.1) = .9980.
The actual answer in this case, to five places, is .99821.
"""

# ╔═╡ e2c24e5e-58af-42ff-906d-3ebb304e2df6
md"""
### Example 9.5

A die is rolled 420 times.
What is the probability that the sum of the rolls lies between 1400 and 1550?

The sum is a random variable

$S_{420} = X_1 + X_2 + ⋯ + X_{420}\;,$

where each $X_j$ has distribution

$m_X = \begin{pmatrix} 1 & 2 & 3 & 4 & 5 & 6 \\ 1/6 & 1/6 & 1/6 & 1/6 & 1/6 & 1/6 \end{pmatrix}$

We have seen that $\mu = E(X) = 7/2$ and $\sigma^2 = V(X) = 35/12$.
Thus, $E(S_{420}) = 420 ⋅ 7/2 = 1470$, $\sigma^2(S_{420}) = 420 ⋅ 35/12 = 1225$, and $\sigma(S_{420}) = 35$.
Therefore,

$\begin{align*}
P(1400 ≤ S_{420} ≤ 1550) &≈ P\left(\frac{1399.5 - 1470}{35} ≤ S_{420}^* ≤ \frac{1550.5 - 1470}{35}\right) \\
&= P(-2.01 ≤ S_{420}^* ≤ 2.30) \\
&≈ \text{NA}(-2.01, 2.30) = .9670.
\end{align*}$

We note that the program **CLTIndTrialsGlobal** could be used to calculate these probabilities.
"""

# ╔═╡ 838cdf3d-0d4c-4951-acd3-5ad916cce509
md"""
### Example 9.9

Suppose a surveyor wants to measure a known distance, say of 1 mile, using a transit and some method of triangulation.
He knows that because of possible motion of the transit, atmospheric distortions, and human error, any one measurement is apt to be slightly in error.
He plans to make several measurements and take an average.
He assumes that his measurements are independent random variables with a common distribution of mean $\mu = 1$ and standard deviation $\sigma = .0002$ (so, if the errors are approximately normally distributed, then his measurements are within 1 foot of the correct distance about 65% of the time).
What can he say about the average?

He can say that if $n$ is large, the average $S_n / n$ has a density function that is approximately normal, with mean $\mu = 1$ mile, and standard deviation $\sigma = .0002 / \sqrt{n}$ miles.

How many measurements should he make to be reasonably sure that his average lies within .0001 of the true value?
The Chebyshev inequality says

$P\left(\left|\frac{S_n}{n} - \mu\right| ≥ .0001\right) ≤ \frac{(.0002)^2}{n(10^{-8})} = \frac{4}{n}\;,$

so that we must have $n ≥ 80$ before the probability that his error is less than .0001 exceeds .95.

We have already noticed that the estimate in the Chebyshev inequality is not always a good one, and here is a case in point.
If we assume that $n$ is large enough so that the density for $S_n$ is approximately normal, then we have

$\begin{align*}
P\left(\left|\frac{S_n}{n} - \mu\right| < .0001\right) &= P(-.5\sqrt{n} < S_n^* < +.5\sqrt{n}) \\
&≈ \frac{1}{\sqrt{2\pi}} ∫_{-.5\sqrt{n}}^{+.5\sqrt{n}} e^{-x^2 / 2} \;dx\;,
\end{align*}$

and this last expression is greater than $.95$ if $.5\sqrt{n} ≥ 2$.
This says that it suffices to take $n = 16$ measurements for the same results.
This second calculation is stronger, but depends on the assumption that $n = 16$ is large enough to establish the normal density as a good approximation to $S_n^*$, and hence to $S_n$.
The Central Limit Theorem here says nothing about how large $n$ has to be.
In most cases involving sums of independent random variables, a good rule of thumb is that for $n ≥ 30$, the approximation is a good one.
In the present case, if we assume that the errors are approximately normally distributed, then the approximation is probably fairly good even for $n = 16$.
"""

# ╔═╡ 3650aa73-d18d-4660-bb98-fa8237252a9a
(.0002 - 1) / 1

# ╔═╡ b854dc22-6812-4ef6-a3a3-2a3ffe55ab33
md"""
### Example 9.10
(Continuation of Example 9.9)
Now suppose our surveyor is measuring an unknown distance with the same instruments under the same conditions.
He takes 36 measurements and averages them.
How sure can he be that his measurement lies within .0002 of the true value?

Again using the normal approximation, we get

$\begin{align*}
P\left(\left|\frac{S_n}{n} - \mu\right| < .0002\right) &= P(|S_n^*| < .5 \sqrt{n}) \\
&≈ \frac{2}{\sqrt{2\pi}} ∫_{-3}^3 e^{-x^2/2} \;dx \\
&≈ .997\;.
\end{align*}$

This means that thte surveyor can be 99.7 percent sure that his average is within .0002 of the true value.
To improve his confidence, he can take more measurements, or require less accuracy, or improve the quality of his measurements (i.e., reduce the variance $\sigma^2$).
In each case, the Central Limit Theorem gives quantitative information about the confidence of a measurement process, assuming always that the normal approximation is valid.

Now suppose the surveyor does not know the mean or standard deviation of his measurements, but assumes that they are independent.
How should he proceed?

Again, he makes several measurements of a known distance and averages them.
As before, the average error is approximately normally distributed, but now with unknown mean and variance.
"""

# ╔═╡ 93a44711-90cf-4280-acf7-97590afb47e1
md"""
### Example 10.1

Suppose $X$ has range $\{1,2,3,…,n\}$ and $p_X(j) = 1/n$ for $1 ≤ j ≤ n$ (uniform distribution).
Then

$\begin{align*}
g(t) &= \sum_{j = 1}^n \frac{1}{n} e^{tj} \\
&= \frac{1}{n} (e^t + e^{2t} + ⋯ + e^{nt}) \\
&= \frac{e^t (e^{nt} - 1)}{n(e^t - 1)}\;.
\end{align*}$

If we use the expression on the right-hand side of the second line above, then it is easy to see that

$\begin{align*}
\mu_1 &= g'(0) = \frac{1}{n} (1 + 2 + 3 + ⋯ + n) = \frac{n + 1}{2}, \\
\mu_2 &= g''(0) = \frac{1}{n} (1 + 4 + 9 + ⋯ + n^2) = \frac{(n + 1)(2n + 1)}{6},
\end{align*}$

and that

$\mu = \mu_1 = \frac{n + 1}{2}$
$\sigma^2 = \mu_2 - {\mu_1}^2 = \frac{n^2 - 1}{12}$
"""

# ╔═╡ 7f72c1f9-7ed9-49da-9a1d-a460ed1fcb40
md"""
### Example 10.2

Suppose now that $X$ has range $\{0,1,2,3,…,n\}$ and $p_X(j) = \begin{pmatrix} n \\ j \end{pmatrix} p^j q^{n - j}$ for $0 ≤ j ≤ n$ (binomial distribution).
Then

$\begin{align*}
g(t) &= \sum_{j = 0}^n e^{tj} \begin{pmatrix} n \\ j \end{pmatrix} p^j q^{n - j} \\
&= \sum_{j = 0}^n \begin{pmatrix} n \\ j \end{pmatrix} (pe^t)^j q^{n - j} \\
&= (pe^t + q)^n
\end{align*}$

Note that

$\begin{align*}
\mu_1 = g'(0) &= n(pe^t + q)^{n - 1} pe^t \,\Big|_{t = 0} = np, \\
\mu_2 = g''(0) &= n(n - 1) p^2 + np,
\end{align*}$

so that

$\mu = \mu_1 = np$
$\sigma^2 = \mu - {\mu_1}^2 = np(1 - p)$
"""

# ╔═╡ 921ca370-98ae-4658-8bf3-d99683f6434e
md"""
### Example 10.3

Suppose $X$ has range $\{1,2,3,…\}$ and $p_X(j) = q^{j - 1} p$ for all $j$ (geometric distribution).
Then

$\begin{align*}
g(t) &= \sum_{j = 1}^{∞} e^{tj} q^{j - 1} p \\
&= \frac{pe^t}{1 - qe^t} \;.
\end{align*}$

Here

$\begin{align*}
\mu_1 &= g'(0) = \left.\frac{pe^t}{(1 - qe^t)^2} \right|_{t = 0} = \frac{1}{p} \\
\mu_2 &= g''(0) = \left.\frac{pe^t + pqe^{2t}}{(1 - qe^t)^3}\right|_{t = 0} = \frac{1 + q}{p^2}
\end{align*}$

$\mu = \mu_1 = \frac{1}{p}$
$\sigma^2 = \mu_2 - {\mu_1}^2 = \frac{q}{p^2}$
"""

# ╔═╡ bd89bc88-85ce-4559-9c35-994975f81d40
md"""
### Example 10.4

Let $X$ have range $\{0,1,2,3,…\}$ and let $p_X(j) = e^{-\lambda} \lambda^j / j!$ for all $j$ (Poisson distribution with mean $\lambda$).
Then

$\begin{align*}
g(t) &= \sum_{j = 0}^∞ e^{tj} \frac{e^{-\lambda} \lambda^j}{j!} \\
&= e^{-\lambda} \sum_{j = 0}^∞ \frac{(\lambda e^t)^j}{j!} \\
&= e^{-\lambda} e^{\lambda e^t} = e^{\lambda(e^t - 1)}\;.
\end{align*}$

Then

$\begin{align*}
\mu_1 = g'(0) &= e^{\lambda (e^t - 1)} \lambda e^t \Big|_{t = 0} = \lambda \\
\mu_2 = g''(0) &= e^{\lambda (e^t - 1)} (\lambda^2 e^{2t} + \lambda e^t) \Big|_{t = 0} = \lambda^2 + \lambda
\end{align*}$

$\mu = \mu_1 = \lambda$
$\sigma^2 = \mu_2 - {\mu_1}^2 = \lambda$

The variance of the Poisson distribution is easier to obtain in this way than directly from the definition (as was done in Exercise 6.2.29).
"""

# ╔═╡ 91735001-3c6c-4178-bcdd-9733e4b2223e
md"""
### Example 10.5

If $X$ and $Y$ are independent discrete random variables with range $\{0,1,2,…,n\}$ and binomial distribution

$p_X(j) = p_Y(j) = \begin{pmatrix} n \\ j \end{pmatrix} p^j q^{n - j}\;,$

and if $Z = X + Y$, then we know (cf. Section 7.1) that the range of $X$ is

$\{0,1,2,…,2n\}$

Here we can easily verify this result by using generating functions.
We know that

$\begin{align*}
g_X(t) = g_Y(t) &= \sum_{j = 0}^n e^{tj} \begin{pmatrix} n \\ j \end{pmatrix} p^j q^{n - j} \\
&= (pe^t + q)^n\;,
\end{align*}$

and

$h_X(z) = h_Y(z) = (pz + q)^n\;.$

Hence, we have

$g_Z(t) = g_X(t) g_Y(t) = (pe^t + q)^{2n}\;,$

or, what is the same,

$\begin{align*}
h_Z(z) &= h_X(z) h_Y(z) = (pz + q)^{2n} \\
&= \sum_{j = 0}^{2n} \begin{pmatrix} 2n \\ j \end{pmatrix} (pz)^j q^{2n - j} \;,
\end{align*}$

from which we can see that the coefficient of $z^j$ is just $p_Z(j) = \begin{pmatrix} 2n \\ j \end{pmatrix} p^j q^{2n - j}\;.$
"""

# ╔═╡ 64bacef9-01cc-4bc1-bef2-c113a93cc161
md"""
### Example 10.6

If $X$ and $Y$ are independent discrete random variables with the non-negative integers $\{0, 1, 2, 3, …\}$ as range, and with geometric distribution function

$p_X(j) = p_Y(j) = q^j p\;,$

then

$g_X(t) = g_Y(t) = \frac{p}{1 - qe^t}\;,$

and if $Z = X + Y$, then

$g_Z(t) = g_X(t) g_Y(t) = \frac{p^2}{1 - 2qe^t + q^2 e^{2t}}\;.$

If we replace $e^t$ by $z$, we get

$h_Z(z) = \frac{p^2}{(1 - qz)^2} = p^2 \sum_{k = 0}^{∞} (k + 1) q^k z^k\;,$

and we can read off the values of $p_Z(j)$ as the coefficient of $z^j$ in this expansion for $h(z)$, even though $h(z)$ is not polynomial in this case.
The distribution $p_Z$ is a negative binomial distribution (see Section 5.1).
"""

# ╔═╡ ef27dbc8-d956-4d21-bc30-34ca44e3febb
md"""
### Example 10.15

Let $X$ be a continuous random variable with range $[0,1]$ and density function $f_X(x) = 1$ for $0 ≤ x ≤ 1$ (uniform density).
Then

$\mu_n = ∫_0^1 x^n \;dx = \frac{1}{n + 1}\;,$

and

$g(t) = \sum_{k = 0}^{∞} \frac{t^k}{(k + 1)!} = \frac{e^t - 1}{t}\;.$

Here the series converges for all $t$.
Alternatively, we have

$g(t) = ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx = ∫_0^1 e^{tx} \;dx = \frac{e^t - 1}{t}\;.$

Then (by L'Hôpital's rule)

$\begin{align*}
\mu_0 &= g(0) = \lim_{t → 0} \frac{e^t - 1}{t} = 1 \;, \\
\mu_1 &= g'(0) = \lim_{t → 0} \frac{te^t - e^t + 1}{t^2} = \frac{1}{2} \;, \\
\mu_2 &= g''(0) = \lim_{t → 0} \frac{t^3 e^t - 2t^2 e^t + 2te^t - 2t}{t^4} = \frac{1}{3} \;.
\end{align*}$

In particular, we verify that $\mu = g'(0) = 1/2$ and

$\sigma^2 = g''(0) - (g'(0))^2 = \frac{1}{3} - \frac{1}{4} = \frac{1}{12}$

as before (see Example 6.25).
"""

# ╔═╡ 1af50018-fe50-4994-afdf-59339ea75061
md"""
### Example 10.16

Let $X$ have range $[0,∞)$ and density function $f_X(x) = \lambda e^{-\lambda x}$ (exponential density with parameter $\lambda$).
In this case

$\begin{align*}
\mu_n &= ∫_0^∞ x^n \lambda e^{-\lambda x} \;dx = \lambda(-1)^n \frac{d^n}{d\lambda^n} ∫_0^∞ e^{-\lambda x} \;dx \\
&= \lambda (-1)^n \frac{d^n}{d\lambda^n} \left[\frac{1}{\lambda}\right] = \frac{n!}{\lambda^n}\;,
\end{align*}$

and

$\begin{align*}
g(t) &= \sum_{k = 0}^{∞} \frac{\mu_k t^k}{k!} \\
&= \sum_{k = 0}^{∞} \left[\frac{t}{\lambda}\right]^k = \frac{\lambda}{\lambda - t}\;.
\end{align*}$

Here the series converges only for $|t| < \lambda$.
Alternatively, we have

$\begin{align*}
g(t) &= ∫_0^∞ e^{tx} \lambda e^{-\lambda x} \;dx \\
&= \left.\frac{\lambda e^{(t - \lambda)x}}{t - \lambda}\right|_0^∞ = \frac{\lambda}{\lambda - t}\;.
\end{align*}$

Now we can verify directly that

$\mu_n = g^{(n)}(0) = \left.\frac{\lambda n!}{(\lambda - t)^{n + 1}}\right|_{t = 0} = \frac{n!}{\lambda^n}\;.$
"""

# ╔═╡ 9c8d7bc0-b936-4753-bb5e-ec1dca92b882
md"""
### Example 10.17

Let $X$ have range $(-∞, +∞)$ and density function

$f_X(x) = \frac{1}{\sqrt{2\pi}} e^{-x^2 / 2}$

(normal density).
In this case we have

$\begin{align*}
\mu_n &= \frac{1}{\sqrt{2\pi}} ∫_{-∞}^{+∞} x^n e^{-x^2 / 2} \;dx \\
&= \begin{cases}
\frac{(2m)!}{2^m m!}, &\text{if } n = 2m, \\
0, &\text{if } n = 2m + 1.
\end{cases}
\end{align*}$

(These moments are calculated by integrating once by parts to show that $\mu_n = (n - 1) \mu_{n - 2}$, and observing that $\mu_0 = 1$ and $\mu_1 = 0$.)
Hence,

$g(t) = \sum_{n = 0}^∞ \frac{\mu_n t^n}{n!} = \sum_{m = 0}^∞ \frac{t^{2m}}{2^m m!} = e^{t^2 / 2}\;.$

This series converges for all values of $t$.
Again we can verify that $g^{(n)}(0) = \mu_n$.

Let $X$ be a normal random variable with parameters $\mu$ and $\sigma$.
It is easy to show that the moment generating function of $X$ is given by

$e^{t\mu + (\sigma^2 / 2) t^2}\;.$

Now suppose that $X$ and $Y$ are two independent normal random variables with parameters $\mu_1$, $\sigma_1$, and $\mu_2$, $\sigma_2$, respectively.
Then, the product of the moment generating functions of $X$ and $Y$ is

$e^{t(\mu_1 + \mu_2) + (({\sigma_1}^2 + {\sigma_2}^2) / 2) t^2}\;.$

This is the moment generating function for a normal random variable with mean $\mu_1 + \mu_2$ and variance ${\sigma_1}^2 + {\sigma_2}^2$.
Thus, the sum of two independent normal random variables is again normal.
(This was proved for the special case that both summands are standard normal in Example 7.5.)
"""

# ╔═╡ f0dbc833-e4aa-4f17-98d2-ec163135158b
md"""
### Example 11.1

According to Kemeny, Snell, and Thompson, the Land of Oz is blessed by many things, but not by good weather.
They never have two nice days in a row.
If they have a nice day, they are just as likely to have snow as rain the next day.
If they have snow or rain, they have an even chance of having the same the next day.
If there is change from snow or rain, only half of the time is this a change to a nice deay.
With this information we form a Markov chain as follows.
We take as states the kinds of weather $\mathrm{R}$, $\mathrm{J}$, and $\mathrm{S}$.
From the above information we determine the transition probabilities.
These are most conveniently represented in a square array as

$𝐏 = \hspace{0.2em}\begin{array}{c c}
    & \begin{array} {c c c}
      \mathrm{R} & \;\;\mathrm{N}\;\; & \mathrm{S}
    \end{array} \\
    \begin{array}{c}
      \mathrm{R} \\ \mathrm{N} \\ \mathrm{S}
\end{array}\hspace{-0.8em} &
    \left(
      \begin{array}{c c c}
		1/2 & 1/4 & 1/4 \\
		1/2 & 0 & 1/2 \\
		1/4 & 1/4 & 1/2 \\
      \end{array}
    \right) \\
    \mbox{} % Blank line to match column names so as to align the = vertically
  \end{array} \\[-12pt] % Correction for blank line$
"""

# ╔═╡ 4c32f103-d009-4eea-9481-46bfa5b2273a
md"""
### Example 11.14

(Example 11.13 continued) In the Drunkard's Walk example, the transition matrix in canonical form is

$𝐏 = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c c c c}
1 && 2 && 3 && 0 && 4
\end{array} \\
\begin{array}{c}
1 \\ 2 \\ 3 \\ 0 \\ 4
\end{array}\hspace{-0.8em} &
\left(
\begin{array}{c c c | c c}
0 & 1/2 & 0 & 1/2 & 0 \\
1/2 & 0 & 1/2 & 0 & 0 \\
0 & 1/2 & 0 & 0 & 1/2 \\
\hline
0 & 0 & 0 & 1 & 0 \\
0 & 0 & 0 & 0 & 1
\end{array}
\right). \\
\end{array}$

From this we see that the matrix $𝐐$ is

$𝐐 = \begin{pmatrix} 0 & 1/2 & 0 \\ 1/2 & 0 & 1/2 \\ 0 & 1/2 & 0 \end{pmatrix}.$

and

$𝐈 - 𝐐 = \begin{pmatrix} 1 & -1/2 & 0 \\ -1/2 & 0 & 1/2 \\ 0 & 1/2 & 0 \end{pmatrix}.$

Computing $(𝐈 - 𝐐)^{-1}$, we find


$𝐍 = (𝐈 - 𝐐)^{-1} = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c c}
1 & 2 & 3
\end{array} \\
\begin{array}{c}
1 \\ 2 \\ 3
\end{array}\hspace{-0.8em} &
\left(
\begin{array}{c c c}
3/2 & 1 & 1/2 \\
1 & 2 & 1 \\
1/2 & 1 & 3/2
\end{array}
\right). \\
\end{array}$

From the middle row of $𝐍$, we see that if we start in state 2, then the expected number of times in states 1, 2, and 3 before being absorbed are 1, 2, and 1.
"""

# ╔═╡ e6821eb2-39ee-4fcb-a538-587238ac7b4d
md"""
### Example 11.16

Let the transition matrix of a Markov chain be defined by

$𝐏 = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c}
1 & 2
\end{array} \\
\begin{array}{c}
1 \\ 2
\end{array}\hspace{-0.8em} &
\left(
\begin{array}{c c}
0 & 1 \\ 1 & 0
\end{array}
\right) \\
\end{array}$

Then it is clear that it is possible to move from any state to any state, so the chain is ergodic.
However, if $n$ is odd, then it is not possible to move from state 0 to state 0 in $n$ steps, and if $n$ even, then it is not possible to move from state 0 to state 1 in $n$ steps, so the chain is not regular.

A more interesting example of an ergodic, non-regular Markov chain is provided by the Ehrenfest urn model.
"""

# ╔═╡ 4e51ef31-a171-452c-ae36-377f84f0f57f
md"""
### Example 11.17

Recall the Ehrenfest urn model (Example 11.8).
The transition matrix for this example is

$𝐏 = \hspace{0.2em}\begin{array}{c c c c c}
& \begin{array} {c c c c c}
0 && 1 && 2 && 3 && 4
\end{array} \\
\begin{array}{c c c c c}
0 \\ 1 \\ 2 \\ 3 \\ 4
\end{array}\hspace{-0.8em} &
\left(
\begin{array}{c c}
0 & 1 & 0 & 0 & 0 \\
1/4 & 0 & 3/4 & 0 & 0 \\
0 & 1/2 & 0 & 1/2 & 0 \\
0 & 0 & 3/4 & 0 & 1/4 \\
0 & 0 & 0 & 1 & 0
\end{array}
\right) \\
\end{array}$

In this example, if we start in state 0 we will, after any even number of steps, be in either state 0, 2 or 4, and after any odd number of steps, be in states 1 or 3.
Thus this chain is ergodic but not regular.
"""

# ╔═╡ 953716d5-7210-4e5c-8be7-80d875b3e61b
md"""
### Example 11.19

By Theorem 11.7 we can find the limiting vector $𝐰$ for the Land of Oz from the fact that

$w_1 + w_2 + w_3 = 1$

and

$\begin{pmatrix} w_1 & w_2 & w_3 \end{pmatrix} \begin{pmatrix} 1/2 & 1/4 & 1/4 \\ 1/2 & 0 & 1/2 \\ 1/4 & 1/4 & 1/2 \end{pmatrix} = \begin{pmatrix} w_1 & w_2 & w_3 \end{pmatrix}$

These relations lead to the following four equations in three unknowns:

$\begin{align*}
w_1 + w_2 + w_3 &= 1 \;, \\
(1/2) w_1 + (1/2) w_2 + (1/4) w_3 &= w_1 \;, \\
(1/4) w_1 + (1/4) w_3 &= w_2 \;, \\
(1/4) w_1 + (1/2) w_2 + (1/2) w_3 &= w_3\;.
\end{align*}$

Our theorem guarantees that these equations have a unique solution.
If the equations are solved, we obtain the solution

$𝐰 = \begin{pmatrix} .4 & .2 & .4 \end{pmatrix}\;,$

in agreement with that predicted from $𝐏^6$, given in Example 11.2.
"""

# ╔═╡ 31e4bdef-96f8-47fa-ab08-710a0eb3f826
md"""
### Example 11.20

(Example 11.19 continued)
We set $w_1 = 1$, and then solve the first and second linear equations from $𝐰𝐏 = 𝐰$.
We have

$\begin{align*}
(1/2) + (1/2) w_2 + (1/4) w_3 &= 1\;, \\
(1/4) + (1/4) w_3 &= w_2 \;.
\end{align*}$

If we solve these, we obtain

$\begin{pmatrix} w_1 & w_2 & w_3 \end{pmatrix} = \begin{pmatrix} 1 & 1/2 & 1 \end{pmatrix}$

Now we divide this vector by the sum of the components, to obtain the final answer:

$𝐰 = \begin{pmatrix} .4 & .2 & .4 \end{pmatrix} \;.$
"""

# ╔═╡ da982b85-9281-4a12-813c-a486bfe906a3
md"""
### Example 11.24

Let us return to the maze example (Example 11.22).
We shall make this ergodic chain into an absorbing chain by making state 5 an absorbing state.
For example, we might assume that food is placed in the center of the maze and once the rat finds the food, he stays to enjoy it (see Figure 11.5).

The new transition matrix in canonical form is

```julia
P = [  0 1/2   0   0 1/2   0   0   0   0
	 1/3   0 1/3   0   0   0   0   0 1/3
	   0 1/2   0 1/2   0   0   0   0   0
	   0   0 1/3   0   0   0   0 1/3 1/3
	 1/3   0   0   0   0 1/3   0   0 1/3
	   0   0   0   0 1/2   0 1/2   0   0
	   0   0   0   0   0 1/3   0 1/3 1/3
	   0   0   0 1/2   0   0 1/2   0   0
	   0   0   0   0   0   0   0   0   1]
```

If we compute the fundamental matrix $𝐍$, we obtain

```julia
N = 1/8 *
	[14   9   4   3   9   4   3   2
	  6  14   6   4   4   2   2   2
	  4   9  14   9   3   2   3   4
	  2   4   6  14   2   2   4   6
	  6   4   2   2  14   6   4   2
	  4   3   2   3   9  14   9   4
	  2   2   2   4   4   6  14   6
	  2   3   4   9   3   4   9  14]
```

The expected time to absorption for different starting states is given by the vector $𝐍𝐜$, where

$𝐍𝐜 = \begin{pmatrix} 6 \\ 5 \\ 6 \\ 5 \\ 5 \\ 6 \\ 5 \\ 6 \end{pmatrix}\;.$

We see that, starting from compartment 1, it will take on the average six steps to reach food.
It is clear from symmetry that we should get the same answer for starting at state 3, 7, or 9.
It is also clear that it should take one more step, starting at one of these states, than it would starting at 2, 4, 6, or 8.
Some of the results obtained from $𝐍$ are not so obvious.
For instance, we note that the expected number of times in the starting state is 14/8 regardless of the state in which we start.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Plots = "~1.21.1"
PlutoUI = "~0.7.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c3598e525718abcc440f69cc6d5f60dda0a1b61e"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.6+5"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "e2f47f6d8337369411569fd45ae5753ca10394c6"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.0+6"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "9995eb3977fbf67b86d0a0a0508e83017ded03f2"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.14.0"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "727e463cfebd0c7b999bbf3e9e7e16f254b94193"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.34.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[DataAPI]]
git-tree-sha1 = "ee400abb2298bd13bfc3df1c412ed228061a2385"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.7.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "92d8f9f208637e8d2d28c664051a00569c01493d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.1.5+1"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

[[FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "LibVPX_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "3cc57ad0a213808473eafef4845a74766242e05f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.3.1+4"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "35895cf184ceaab11fd778b4590144034a167a2f"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.1+14"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "cbd58c9deb1d304f5a245a0b7eb841a2560cfec6"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.1+5"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "0c603255764a1fa0b61752d2bec14cfbd18f7fe8"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+1"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "182da592436e287758ded5be6e32c406de3a2e47"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.58.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "d59e8320c2747553788e4fc42231489cc602fa50"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.58.1+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "58bcdf5ebc057b085e58d95c138725628dd7453c"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.1"

[[Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "74ef6288d071f58033d54fd6708d4bc23a8b8972"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+1"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "44e3b40da000eab4ccb1aecdc4801c040026aeb5"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.13"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[LaTeXStrings]]
git-tree-sha1 = "c7f1c695e06c01b95a67f0cd1d34994f3e7db104"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.2.1"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a4b12a1bd2ebade87891ab7e36fdbce582301a92"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.6"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[LibVPX_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "12ee7e23fa4d18361e7c2cde8f8337d4c3101bc7"
uuid = "dd192d2f-8180-539f-9fb4-cc70b1dcf69a"
version = "1.10.0+0"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "340e257aada13f95f98ee352d316c3bed37c8ab9"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+0"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "0fb723cd8c45858c22169b2e42269e53271a6df7"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.7"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "2ca267b08821e86c5ef4376cffed98a46c2cb205"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "438d35d2d95ae2c5e8780b330592b6de8494e779"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.3"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "c67334c786157d6ef091ce622b365d3d60b1e2c4"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.12"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs"]
git-tree-sha1 = "0036d433cacff4767ff622be3cb2c281b773a2b4"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.21.1"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "e377b29ebe56fadd8b40b04d8eb117c98d0a9960"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.3.6"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3240808c6d463ac46f1c1cd7638375cd22abbccb"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.12"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "1958272568dc176a1d881acb797beb909c785510"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.0.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8cbbc098554648c84f79a463c9ff0fd277144b6c"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.10"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "1700b86ad59348c0f9f68ddc95117071f947072d"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.1"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "d0c690d37c73aeb5ca063056283fde5585a41710"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.5.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll"]
git-tree-sha1 = "2839f1c1296940218e35df0bbb220f2a79686670"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.18.0+4"

[[XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "acc685bcf777b2202a904cdcb49ad34c2fa1880c"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.14.0+4"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7a5780a0d9c6864184b3a2eeeb833a0c871f00ab"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "0.1.6+4"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "c45f4e40e7aafe9d086379e5578947ec8b95a8fb"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d713c1ce4deac133e3334ee12f4adff07f81778f"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2020.7.14+2"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "487da2f8f2f0c8ee0e83f39d13037d6bbf0a45ab"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.0.0+3"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─e0a3cd53-1743-4747-b107-ff337745a5b7
# ╟─0569c756-0510-11ec-3297-9beeebde92c0
# ╟─b2b81453-edff-4eaa-9741-235cc11e63f9
# ╟─0c832053-7b09-480a-8439-a08ca9c81487
# ╟─c5634e59-e89e-459c-aaa3-fa23cf4925a5
# ╟─a30414bc-ebab-4794-a21b-b45039e658be
# ╠═75c57158-dc2e-453d-aec9-cc61db50edf7
# ╠═e153ab4e-935a-46db-a60a-6df97b90c9fc
# ╠═5b997321-5ab2-4b4f-b25d-f8ef05ff82a5
# ╟─28a2c5c8-c76d-4c20-9300-e41062a12290
# ╟─d660bb35-f913-410b-ba35-5df8336ba1c9
# ╟─ede6660b-b119-44fa-b99c-bc97114dbefc
# ╟─bf7ed529-487a-4f55-9057-e082a3a1abac
# ╟─2bf5f9ce-bf7a-45e0-b934-38b0125f5f81
# ╟─47e8c44a-cb22-4b14-b355-2321a882748a
# ╟─539be1c2-61ce-4e72-ba3a-eefb848f0486
# ╟─2d1e03b7-e919-48b3-bf45-61016727207e
# ╟─7dd0b2be-006f-4ccd-bf51-064ba9d66187
# ╟─9621d536-8534-4805-9129-480b22ebe769
# ╟─9b1df226-e689-4985-a602-ac6dbd5b259c
# ╟─fca1d663-062a-4f9d-be21-03faf2ada3e1
# ╟─964307fd-6a01-4bf0-a62d-dfa8733a5998
# ╟─4781c7ca-7e0e-4187-bc95-f1df36ada88f
# ╟─08899841-355e-4ff6-a8ac-02a14fd2ed22
# ╠═1028f79d-6a2e-4b8f-a527-54fd36f99cbe
# ╟─c8b1a8ec-f6b6-459a-a562-5081871e5799
# ╟─98a95a0c-c33e-4e5f-88bd-f7646bda6bbf
# ╟─47eda31f-adb7-4b5e-a7f9-4fd97178de71
# ╟─306809ae-6828-4fea-829a-80d4ed2776b3
# ╟─48a863ba-1512-4322-8e07-0b0897c76d3b
# ╟─c79b2c68-68e0-44c0-a71b-7c11b9383438
# ╟─0253ce68-3aca-4fe9-a299-42cb7f690d8a
# ╟─05122f37-b15d-412b-abda-3f62ba289614
# ╟─7976928b-a82b-46eb-bc27-b84e8b6a429b
# ╟─55d83b0f-534b-4fe6-8231-1eb2e4e33c2e
# ╟─e93d43ea-0373-4e57-8b22-989aa95d1e78
# ╟─e8c89424-427b-426a-af17-8403527a89d7
# ╟─6c89a3c0-9687-4262-be52-c5d6823d7bc3
# ╟─2b4107ba-8d16-40cb-a7c2-471a1eb7ff4f
# ╟─1d6365fb-15d7-4c3f-87df-6d8cb1226bec
# ╟─a4a546d6-0377-4720-a4ac-5c073001c70a
# ╟─ff909678-e060-4465-beea-1b1f41ff8b15
# ╟─1c9dd3d5-2f51-4033-ae3f-454b196a1ca2
# ╟─33d5b583-632d-4585-a71c-f397f219c875
# ╟─e89cec32-829b-4411-a895-3366a4d9893f
# ╟─6236a06f-dc02-4e59-84ed-de4f6f434e9e
# ╟─3fe8366d-14fa-49c3-87ce-68a007e9ce1c
# ╟─e68d391b-457e-4917-9f12-3edba928ee32
# ╟─518b6487-c90a-4518-bb1b-7b3ee5df7eab
# ╟─c8b6a35f-98cc-475f-a613-a140321e0fcb
# ╟─ea150028-a631-473b-86f7-e882ad24d0d8
# ╟─26bc3206-4b04-48bf-89d8-a37c6a3d3a07
# ╟─be788e47-34df-41ea-a83b-f69ba7cbda40
# ╟─eb5519b1-7cac-494e-b96b-0297b4fba54a
# ╟─c1011fa0-2144-4674-853b-f0e6234d0574
# ╟─fd63d842-8561-431e-bc64-393085f3b995
# ╟─67db64f7-562b-444e-9c10-6f441cedb87b
# ╟─2c92d351-c567-46f3-9ed0-211d47d587d8
# ╟─d689d056-8883-45bb-8ca1-bfd1d5305f35
# ╟─a9af5bd1-a780-4b64-a5f4-f68f08e06d83
# ╟─f29a09ed-ccc8-42b1-b08b-a69937358ec1
# ╟─9a918d90-d77d-4d98-886e-4a59da7342a3
# ╟─e2c24e5e-58af-42ff-906d-3ebb304e2df6
# ╟─838cdf3d-0d4c-4951-acd3-5ad916cce509
# ╠═3650aa73-d18d-4660-bb98-fa8237252a9a
# ╟─b854dc22-6812-4ef6-a3a3-2a3ffe55ab33
# ╟─93a44711-90cf-4280-acf7-97590afb47e1
# ╟─7f72c1f9-7ed9-49da-9a1d-a460ed1fcb40
# ╟─921ca370-98ae-4658-8bf3-d99683f6434e
# ╟─bd89bc88-85ce-4559-9c35-994975f81d40
# ╟─91735001-3c6c-4178-bcdd-9733e4b2223e
# ╟─64bacef9-01cc-4bc1-bef2-c113a93cc161
# ╟─ef27dbc8-d956-4d21-bc30-34ca44e3febb
# ╟─1af50018-fe50-4994-afdf-59339ea75061
# ╟─9c8d7bc0-b936-4753-bb5e-ec1dca92b882
# ╟─f0dbc833-e4aa-4f17-98d2-ec163135158b
# ╟─4c32f103-d009-4eea-9481-46bfa5b2273a
# ╟─e6821eb2-39ee-4fcb-a538-587238ac7b4d
# ╟─4e51ef31-a171-452c-ae36-377f84f0f57f
# ╟─953716d5-7210-4e5c-8be7-80d875b3e61b
# ╟─31e4bdef-96f8-47fa-ab08-710a0eb3f826
# ╟─da982b85-9281-4a12-813c-a486bfe906a3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
