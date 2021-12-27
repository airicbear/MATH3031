### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 9fe2e52a-3799-4114-9edf-7f868e22a7a8
begin
	using PlutoUI
	
	PlutoUI.TableOfContents(title="Introduction to Probability", aside=true)
end

# ╔═╡ dd23f536-0508-11ec-2b9f-c3a3a78d10ee
md"# Discrete Probability Distributions"

# ╔═╡ 82a181be-ff30-4f69-a0b5-b4dfe4611f3c
md"## Simulation of Discrete Probabilities"

# ╔═╡ 2b355d3d-7f89-4e95-8f52-25f85075c85f
md"### Probability"

# ╔═╡ f6779fe6-866c-4984-b91f-d9d74bb6c6ee
md"### Simulation"

# ╔═╡ 46db4c31-dcb7-415d-a0ca-5ddf7e0e376d
md"### Random Numbers"

# ╔═╡ cec5dbc1-2b36-45ba-9e04-3da64c455e20
md"## Discrete Probability Distributions"

# ╔═╡ 1ccb44cc-820d-440c-ae22-13b7607c7ee3
md"### Random Variables and Sample Spaces"

# ╔═╡ 6a09f4e6-99ce-4d8d-8781-af1f3239210a
md"""
**Definition 1.1**
Suppose we have an experiment whose outcome depends on chance.
We represent the outcome of the experiment by a capital Roman letter, such as $X$, called a **random variable**.
The **sample space** of the experiment is the set of all possible outcomes.
If the sample space is either finite or countably infinite, the random variable is said to be **discrete**.

We generally denote a sample space by the capital Greek letter $Ω$.
As stated above, in correspondence between an experiment and the mathematical theory by which it is studied, the sample space $Ω$ corresponds to the set of possible outcomes of the experiment.

We now make two additional definitions.
These are subsidiary to the definition of sample space and serve to make precise some of the common terminology used in conjunction with sample spaces.
First of all, we define the elements of a sample space to be **outcomes**.
Second, each subset of a sample space is defined to be an **event**.
Normally, we shall denote outcomes by lower case letters and events by capital letters.
"""

# ╔═╡ 3a0e2c2f-2b39-4063-9606-9bec08be4ba8
md"""
**Definition 1.2**
Let $X$ be a random variable which denotes the value of the outcome of a certain experiment, and assume that this experiment has only finitely many possible outcomes.
Let $\Omega$ be the sample space of the experiment (i.e., the set of all possible values of $X$, or equivalently, the set of all possible outcomes of the experiment.)
A **distribution function** for $X$ is a real-valued function $m$ whose domain is $\Omega$ and which satisfies:

1. ``m(\omega) \geq 0 \quad \text{ for all } \omega \in \Omega \text{, and}``

2. ``\underset{\omega \in \Omega}{\sum} m(\omega) = 1.``

For any subset $E$ of $\Omega$, we define the **probability of $E$** to be the number $P(E)$ given by

$P(E) = \underset{\omega \in E}{\sum} m(\omega).$
"""

# ╔═╡ b5f70ea8-5073-4f6d-bb49-caf55e8fa2c1
md"### Distribution Functions"

# ╔═╡ 4bfdaf1a-8996-4755-ba9a-2e4639e2cf84
md"### Properties"

# ╔═╡ 4ec894b9-8632-4fec-b43d-4ca71db7248b
md"""
**Theorem 1.1**
The probabilities assigned to events by a distribution function on a sample space $\Omega$ satisfy the following properties:

1. ``P(E) \geq 0 \text{ for every } E \subset \Omega``.

2. ``P(\Omega) = 1``.

3. If $E \subset F \subset \Omega$, then $P(E) \leq P(F)$.

4. If $A$ and $B$ are *disjoint* subsets of $\Omega$, then $P(A \cup B) = P(A) + P(B)$.

5. ``P(\bar{A}) = 1 - P(A)`` for every $A \subset \Omega$.
"""

# ╔═╡ f5fcc371-034f-4980-899a-2abd4142a659
md"### Uniform Distribution"

# ╔═╡ cf031b68-a870-420e-a6a8-9d9e0a2b45b4
md"""
**Definition 1.3**
The **uniform distribution** on a sample space $\Omega$ containing $n$ elements is the function $m$ defined by

$m(\omega) = \frac{1}{n},$

for every $\omega \in \Omega$.
"""

# ╔═╡ bfe8d31f-cf90-4935-9289-2884d58f9869
md"# Continuous Probability Densities"

# ╔═╡ c2e04ff7-41a4-4f95-9715-7ab0793c8597
md"## Continuous Density Functions"

# ╔═╡ 79103f5d-3d2b-4368-b08a-999b962ee486
md"### Density Functions of Continuous Random Variables"

# ╔═╡ d05248bb-1206-48b3-b814-77ebc0d16cb3
md"""
**Definition 2.1**
Let $X$ be a continuous real-valued random variable.
A *density function* for $X$ is a real-valued function $f$ which satisfies

$P(a \leq X \leq b) = \int_a^b f(x) \;dx$

for all $a$, $b \in \mathbf{R}$.

We note that it is *not* the case that all continuous real-valued random variable possess density functions.
However, in this book, we will only consider continuous random variables for which density functions exist.

In terms of the density $f(x)$, if $E$ is a subset of $\mathbf{R}$, then

$P(X \in E) = \int_E f(x) \;dx.$

The notation here assumes that $E$ is a subset of $\mathbf{R}$ for which $\int_E f(x) \;dx$ makes sense.
"""

# ╔═╡ 193bad7e-40ff-4eec-8262-2da7ffd3a86e
md"""
**Definition**
Let $\Omega$ be a sample space.
A **random variable** $X$ is a real-valued function whose domain is $\Omega$.
"""

# ╔═╡ 9e0df1bb-3667-4702-9967-c25dc07b9073
md"### Cumulative Distribution Functions of Continuous Random Variables"

# ╔═╡ 128bc4d1-fb28-4711-979f-6d6d8a1fd136
md"""
**Definition 2.2**
Let $X$ be a continuous real-valued random variable.
Then the cumulative distribution function of $X$ is defined by the equation

$F_X(x) = P(X \leq x).$

If $X$ is a continuous real-valued random variable which possesses a density function, then it also has a cumulative distribution function, and the following theorem shows that the two functions are related in a very nice way.
"""

# ╔═╡ 5cbae973-9a8b-4ee4-8bb3-ece68591aa35
md"# Combinatorics"

# ╔═╡ a0d80aff-8c1b-4a68-84d1-1f8aeb161491
md"## Permutations"

# ╔═╡ 66496486-3b18-4787-828c-6a165319fbfa
md"### Counting Problems"

# ╔═╡ 22e16f89-e290-4260-aaaa-118eb8c39476
md"### A Counting Technique"

# ╔═╡ 25dff36a-999f-4f52-be31-167bc8aa0ed2
md"### Tree Diagrams"

# ╔═╡ fa33dca8-fc59-4adb-9d48-b233fdd84334
md"### Birthday Problem"

# ╔═╡ edbe8780-2ffa-4679-a08b-6d1e416547ea
md"### Permutations"

# ╔═╡ 72e91e76-70ef-49e7-91a3-1995d133ef4c
md"""
**Definition 3.1**
Let $A$ be any finite set.
A **permutation of $A$** is a one-to-one mapping of $A$ onto itself.
"""

# ╔═╡ da89b98c-f941-429a-bc4e-9eaf223dd332
md"""
**Theorem 3.1**
The total number of permutations of a set $A$ of $n$ elements is given by $n ⋅ (n - 1) ⋅ (n - 2) ⋅ … ⋅ 1$.

**Proof.**
To specify a particular permutation we list the elements of $A$ and, under them, show where each element is sent by the one-to-one mapping.
For example, if $A = \{a,b,c\}$ a possible permutation $\sigma$ would be

$\sigma = \begin{pmatrix}
a & b & c \\
b & c & a
\end{pmatrix} \;.$

By the permutation $\sigma$, $a$ is sent to $b$, $b$ is sent to $c$, and $c$ is sent to $a$.
The condition that the mapping be one-to-one means that no two elements of $A$ are sent, by the mapping, into the same element of $A$.

We can put the elements of our set in some order and rename them $1, 2, …, n$.
Then a typical permutation of the set $A = \{a_1, a_2, a_3, a_4\}$ can be written in the form

$\sigma = \begin{pmatrix}
1 & 2 & 3 & 4 \\
2 & 1 & 4 & 3
\end{pmatrix} \;,$

indicating that $a_1$ went to $a_2$, $a_2$ to $a_1$, $a_3$ to $a_4$, and $a_4$ to $a_3$.

If we always choose the top row to be 1 2 3 4 then, to prescribe the permutation, we need only give the bottom row, with the understanding that this tells us where 1 goes, 2 goes, and so forth, under the mapping.
When this is done, the permutation is often called a **rearrangement** of the $n$ objects $1,2,3,…,n$.
For example, all possible permutations, or rearrangements, of the numbers $A = \{1,2,3\}$ are:

$123, \; 132, \; 213, \; 231, \; 312, \; 321 \;.$

It is an easy matter to count the number of possible permutations of $n$ objects.
By our general counting principle, there are $n$ ways to assign the first element, for each of these we have $n - 1$ ways to assign the second object, $n - 2$ for the third, and so forth.
"""

# ╔═╡ dad0493d-37dd-4512-85e2-54a27831badf
md"""
**Definition 3.2**
Let $A$ be an $n$-element set, and let $k$ be an integer between 0 and $n$.
Then a $k$-permutation of $A$ is an ordered listing of a subset of $A$ of size $k$.
"""

# ╔═╡ 7ac5c2ec-07ef-4e4b-9bdc-dc438f3eead3
md"""
**Theorem 3.2**
The total number of $k$-permutations of a set $A$ of $n$ elements is given by $n ⋅ (n - 1) ⋅ (n - 2) ⋅ … ⋅ (n - k + 1)$.
"""

# ╔═╡ a0faf2af-f514-4343-a796-eb5b412c6d2d
md"""
**Theorem 3.3 (Stirling's Formula)** The sequence $n!$ is asymptotically equal to

$n^n e^{-n} \sqrt{2\pi n}$
"""

# ╔═╡ 3d35debf-1b2b-4b65-a873-b94220e62f98
md"### Factorials"

# ╔═╡ d3358b38-d6d2-4341-a57e-d59330eb8927
md"""
**Definition 3.3**
Let $a_n$ and $b_n$ be two sequences of numbers.
We say that $a_n$ is *asymptotically equal to $b_n$*, and write $a_n ∼ b_n$, if

$\lim_{n → ∞} \frac{a_n}{b_n} = 1\;.$
"""

# ╔═╡ 78cb001f-2b0a-494a-b326-b894ca8cd944
md"""
**Theorem 3.3 (Stirling's Formula)**
The sequence $n!$ is asymptotically equal to

$n^n e^{-n} \sqrt{2\pi n}\;.$
"""

# ╔═╡ 8d2638cf-e29c-4c32-ad54-ca0864e930d4
md"### Generating Random Permutations"

# ╔═╡ f97ebcc4-e1c6-4ae4-9dbc-565214573939
md"### Fixed Points"

# ╔═╡ 43032cb2-8a03-4b8c-b7b6-f2c994cbefe3
md"### Records"

# ╔═╡ 0742718e-61dc-40be-a98f-bcddd9bb8ad2
md"### List of Permutations"

# ╔═╡ 6407ba06-bd24-4e4f-9a83-39e613febb00
md"### Historical Remarks"

# ╔═╡ 643cf8d7-6c23-40bc-899f-6f8c771c3c99
md"## Combinations"

# ╔═╡ 68723805-d5d2-420a-9640-ee2cfffc6121
md"### Binomial Coefficients"

# ╔═╡ 931a5791-bdeb-406d-aa99-19fe2b6636ca
md"""
**Theorem 3.4**
For integers $n$ and $j$, with $0 < j < n$, the binomial coefficients satisfy:

$\begin{pmatrix} n \\ j \end{pmatrix} = \begin{pmatrix} n - 1 \\ j \end{pmatrix} + \begin{pmatrix} n - 1 \\ j - 1 \end{pmatrix}$
"""

# ╔═╡ 94bc9dbe-819b-4cd1-a024-1de897b86ed3
md"### Pascal's Triangle"

# ╔═╡ ee252fb6-07a2-4677-9b07-cad07441ca65
md"""
**Theorem 3.5**
The binomial coefficients are given by the formula

$\begin{pmatrix} n \\ j \end{pmatrix} = \frac{(n)_j}{j!} \;.$
"""

# ╔═╡ cb4b7a79-a8de-4d0e-82c0-9897a7ae1805
md"### Poker Hands"

# ╔═╡ 62cdb58a-47c0-46c1-89c1-b42f7181f073
md"### Bernoulli Trials"

# ╔═╡ 5e6bf12d-bf4a-48dd-b203-3feea3bd4423
md"""
**Definition 3.5**
A *Bernoulli trials process* is a sequence of $n$ chance experiments such that

1. Each experiment has two possible outcomes, which we may call *success* and *failure*.

2. The probability $p$ of success on each experiment is that same for each experiment, and this probability is not affected by any knowledge of previous outcomes.
   The probability $q$ of failure is given by $q = 1 - p$.
"""

# ╔═╡ e2f90b08-c9fa-43ae-9440-c16647de3f9d
md"### Binomial Probabilities"

# ╔═╡ 12bb67f2-e0ff-42c1-b13f-524939c9aa0a
md"""
**Theorem 3.6**
Given $n$ Bernoulli trials with probability $p$ of success on each experiment, the probability of exactly $j$ successes is

$b(n, p, j) = \begin{pmatrix} n \\ j \end{pmatrix} p^j q^{n-j}$

where $q = 1 - p$.
"""

# ╔═╡ 1c44ff18-2e90-4613-997c-ea05323dc863
md"""
**Definition 3.6**
Let $n$ be a positive integer, and let $p$ be a real number between 0 and 1.
Let $B$ be the random variable which counts the number of successes in a Bernoulli trials process with parameters $n$ and $p$.
Then the distribution $b(n,p,k)$ of $B$ is called the *binomial distribution*.
"""

# ╔═╡ 07f31d7b-2306-4406-a9b9-7316257a680e
md"### Binomial Distributions"

# ╔═╡ 45b3854c-d3df-4071-9a7b-8980c765878b
md"### Hypothesis Testing"

# ╔═╡ e6a3a9c3-a444-4277-a428-9777805aa6ca
md"### Binomial Expansion"

# ╔═╡ 46006b03-09e6-4afc-8e2a-4e3a379a71fd
md"""
**Theorem 3.7 (Binomial Theorem)**
The quantity $(a + b)^n$ can be expressed in the form

$(a + b)^n = \sum_{j = 0}^n \begin{pmatrix} n \\ j \end{pmatrix} a^j b^{n -j }$
"""

# ╔═╡ b963fe00-9b73-467e-b7c0-6522c5d47bb7
md"### Inclusion-Exclusion Principle"

# ╔═╡ caf16939-ba11-4b72-acec-edb5d5d13e96
md"""
**Theorem 3.8**
Let $P$ be a probability distribution on a sample space $Ω$, and let $\{A_1, A_2, …, A_n\}$ be a finite set of events. Then

$\begin{align*}
P(A_1 ∪ A_2 ∪ ⋯ ∪ A_n) &= \sum_{i = 1}^n P(A_i) - \sum_{1 ≤ i < j ≤ n} P(A_i ∩ A_j) \\
&\quad + \sum_{1 ≤ i < j < k ≤ n} P(A_i ∩ A_j ∩ A_k) - ⋯ \;.
\end{align*}$

That is, to find the probability that at least one of $n$ events $A_i$ occurs, first add the probability of each event, then subtract the probabilities of all possible two-way intersections, add the probability of all three-way intersections, and so forth.
"""

# ╔═╡ ce8e9eda-725f-45d0-af58-db7263d3da34
md"### Hat Check Problem"

# ╔═╡ 9514cd39-4d20-445e-bd94-653f63812076
md"### Choosing a Sample Space"

# ╔═╡ 68e14024-997f-40da-97c8-a6c0f3a5a34e
md"### Historical Remarks"

# ╔═╡ 97577267-ef80-472f-adbf-82ace77a22e3
md"# Conditional Probability"

# ╔═╡ f578ce39-5339-4f85-8bf1-e085aa5549bd
md"## Discrete Conditional Probability"

# ╔═╡ 8cd10579-ca63-4050-b930-feed9c7e363e
md"### Conditional Probability"

# ╔═╡ 3003de01-25b7-4c20-9bae-cf15e5ac293c
md"### Bayes Probabilities"

# ╔═╡ 1cd2fedd-1a66-47f4-b210-c94fc7139bad
md"### Independent Events"

# ╔═╡ 202ca2bb-ff31-4fbd-823f-bae32b2c04bd
md"""
**Definition 4.1**
Let $E$ and $F$ be two events.
We say that they are *independent* if either 1) both events have positive probability and

$P(E∣F) = P(E) \text{ and } P(F∣E) = P(F) \;,$
"""

# ╔═╡ 8ee6ec51-c913-4da0-880a-d0b9186ddd15
md"""
**Theorem 4.1**
Two events $E$ and $F$ are independent if and only if

$P(E ∩ F) = P(E) P(F) \;.$
"""

# ╔═╡ cf1c9973-2171-42fd-add0-130119d27350
md"""
**Definition 4.2**
A set of events $\{A_1, A_2, …, A_n\}$ is said to be *mutually independent* if for any subset $\{A_i, A_j, …, A_m\}$ of these events we have

$P(A_i ∩ A_j ∩ ⋯ ∩ A_m) = P(A_i) P(A_j) ⋯ P(A_m),$

or equivalently, if for any sequence $\bar{A}_1, \bar{A}_2, …, \bar{A}_n$ with $\bar{A}_j = A_j$ or $\bar{A}_j$.
"""

# ╔═╡ 0de32014-d56e-42c2-8b9e-6ee40241bd35
md"### Joint Distribution Functions and Independence of Random Variables"

# ╔═╡ 6cd68551-0a46-4158-82f6-d09f46dbf1a9
md"### Independent Trials Processes"

# ╔═╡ 4b6cfec7-e827-45bf-9d62-66aaa897aa72
md"### Bayes' Formula"

# ╔═╡ 290063be-29b7-40f4-b98f-b44eaa5da9b8
md"### Historical Remarks"

# ╔═╡ 8555fbb1-153b-4a15-9f89-1b4260d62997
md"## Continuous Conditional Probability"

# ╔═╡ b161f584-1119-47f0-8e31-cffc7af7597f
md"### Independent Events"

# ╔═╡ 494cfd23-1f73-4764-9d41-da7b9a30e606
md"### Joint Density and Cumulative Distribution Functions"

# ╔═╡ 583a3909-6038-456f-94d3-1e23b10a2516
md"""
**Definition 4.6**
Let $X_1$, $X_2$, …, $X_n$ be continuous random variables associated with an experiment, and let $\bar{X} = (X_1, X_2, …, X_n)$.
Then the join cumulative distribution function of $\bar{X}$ is defined by

$F(x_1, x_2, …, x_n) = P(X_1 ≤ x_1, X_2 ≤ x_2, …, X_n ≤ x_n) \;.$

The joint density function of $\bar{X}$ satisfies the following equation:

$F(x_1, x_2, …, x_n) = ∫_{-∞}^{x_1}∫_{-∞}^{x_2}⋯∫_{-∞}^{x_n} f(t_1, t_2, …t_n) dt_n dt_{n-1} … dt_1\;.$

It is straightforward to show that, in the above notation,

$f(x_1, x_2, …, x_n) = \frac{∂^n F(x_1, x_2, …, x_n)}{∂x_1 ∂x_2 ⋯ ∂x_n}$
"""

# ╔═╡ 1ec2da3c-d538-4b2a-a64e-e0ccd28a05f7
md"### Independent Random Variables"

# ╔═╡ 95e6ca0c-e652-4237-a379-e5a4980256eb
md"""
**Definition 4.7**
Let $X_1$, $X_2$, …, $X_n$ be continuous random variables with cumulative distribution functions $F_1(x)$, $F_2(x)$, …, $F_n(x)$.
Then these random variables are *mutually independent* if

$F(x_1, x_2, …, x_n) = F_1(x_1) F_2(x_2) ⋯ F_n(x_n)$

for any choice of $x_1$, $x_2$, …, $x_n$.
Thus, if $X_1$, $X_2$, …, $X_n$ are mutually independent, then the joint cumulative distribution function of the random variable $\bar{X} = (X_1, X_2, …, X_n)$ is just the product of the individual cumulative distribution functions.
When two random variables are mutually independent, we shall say more briefly that they are *independent*.
"""

# ╔═╡ 5a0b6653-a799-4171-b56a-87b0610650c5
md"""
**Theorem 4.2**
Let $X_1$, $X_2$, …, $X_n$ be continuous random variables with density functions $f_1(x)$, $f_2(x)$, …, $f_n(x)$.
Then these random variables are *mutually independent* if and only if

$f(x_1, x_2, …, x_n) = f_1(x_1) f_2(x_2) ⋯ f_n(x_n)$

for any choice of $x_1$, $x_2$, …, $x_n$.
"""

# ╔═╡ 5c79aa52-a014-4b0f-8a53-cb001576a51d
md"""
**Theorem 4.3**
Let $X_1$, $X_2$, …, $X_n$ be mutually independent continuous random variables and let $\phi_1(x)$, $\phi_2(x)$, …, $\phi_n(x)$ be continuous functions.
Then $\phi_1(X_1)$, $\phi_2(X_2)$, …, $\phi_n(X_n)$ are mutually independent.
"""

# ╔═╡ 73eab6a6-0d60-4a9f-9e7b-7acde9288676
md"### Independent Trials"

# ╔═╡ 0d43a5f0-2838-43ad-bf00-36d55b667643
md"### Beta Density"

# ╔═╡ 17a0703a-9dae-486d-a8cc-6c033840470e
md"# Important Distributions and Densities"

# ╔═╡ 4b901fdb-ee24-4b11-a483-192cac3f3607
md"## Important Distributions"

# ╔═╡ e98fd509-be00-49ab-807c-efbd1bf5f7d8
md"""
### Discrete Uniform Distribution

In Chapter 1, we say that in many cases, we assume that all outcomes of an experiment are equally likely.
If $X$ is a random variable which represents the outcome of an experiment of this type, then we say that $X$ is uniformly distributed.
If the sample space $S$ is of size $n$, where $0 < n < ∞$, then the distribution function $m(\omega)$ is defined to be $1/n$ for all $\omega ∈ S$.
As is the case with all of the discrete probability distributions discussed in this chapter, this experiment can be simulated on a computer using the program **GeneralSimulation**.
However, in this case, a faster algorithm can be used instead.
(This algorithm was described in Chapter 1; we repreaet the description here for completeness.)
The expression

$1 + ⌊n (rnd)⌋$

takes on as a value each integer between 1 and $n$ with probability $1/n$ (the notation $⌊x⌋$ denotes the greatest integer not exceeding $x$).
Thus, if the possible outcomes of the experiment are labelled $\omega_1, \omega_2, …, \omega_n$, then we use the above expression to represent the subscript of the output of the experiment.

If the sample space is a countably infinite set, such as the set of positive integers, then it is not possible to have an experiment which is uniform on this set (see Exercise 3).
If the sample space is an uncountable set, with positive, finite length, such as the interval $[0,1]$, then we use continuous density functions (see Section 5.2).
"""

# ╔═╡ 767ba720-ff48-4b31-add8-90f42df4a56a
md"""
### Binomial Distribution

The binomial distribution with parameteres $n$, $p$, and $k$ was defined in Chapter 3.
It is the distribution of the random variable which counts the number of heads which occur when a coin is tossed $n$ times, assuming that on any one toss, the probability that a head occurs is $p$.
The distribution function is given by the formula

$b(n,p,k) = \begin{pmatrix} n \\ k \end{pmatrix} p^k q^{n - k}\;,$

where $q = 1 - p$.

One straightforward way to simulate a binomial random variable $X$ is to compute the sum of $n$ independent 0--1 random variables, each of which take on the value 1 with probability $p$.
This method requires $n$ calls to a random number generator to obtain one value of the random variable.
When $n$ is relatively large (say at least 30), the Central Limit Theorem (see Chapter 9) implies that the binomial distribution is well-approximated by the corresponding normal density function (which is defined in Section 5.2) with parameters $\mu = np$ and $\sigma = \sqrt{npq}$.
Thus, in this case we can compute a value $Y$ of a normal random variable with these parameters, and if $-1/2 ≤ Y < n + 1/2$, we can use the value

$⌊Y + 1/2⌋$

to represent the random variable $X$.
If $Y < -1/2$ or $Y > n + 1/2$, we reject $Y$ and compute another value.
We will see in the next section how we can quickly simulate normal random variables.
"""

# ╔═╡ bf0f36c5-a5e0-46d8-8761-6c07f98ea845
md"### Geometric Distribution"

# ╔═╡ 5621fa53-5cac-4bf7-9b5b-24bdec03ca66
md"### Negative Binomial Distribution"

# ╔═╡ 47ffe7e2-4a80-46ff-865b-01ca1a5623e3
md"""
### Poisson Distribution

The Poisson distribution arises in many situations.
It is safe to say that it is one of the three most important discrete probability distributions (the other two being uniform and the binomial distributions).
The Poisson distribution can be viewed as arising from the binomial distribution or from the exponential density.
We shall now explain its connection with the former; its connection with the latter will be explained in the next section.

Suppose that we a have a situation in which a certain kind of occurrence happens at random over a period of time.
For example, the occurences that we are interested in might be incoming telephone calls to a police station in a large city.
We want to model this situation so that we can consider the probabilities of events such as more than 10 phone calls occurring in a 5-minute time interval.
Presumably, in our example, there would be more incoming calls between 6:00 and 7:00 P.M. than between 4:00 and 5:00 A.M., and this fact would certainly affect the above probability.
Thus, to have a hope of computing such probabilities, we must assume that the average rate, i.e., the average number of occurrences per minute, is a constant.
This rate we will denote by $\lambda$.
(Thus, in a given 5-minute time interval, we would expect about $5\lambda$ occurrences.
This means that if we were to apply our model to the two time periods given above, we would simply use different rates for the two time periods, thereby obtaining two different probabilities for the given event.

Our next assumption is that the number of occurrences in two non-overlapping time intervals are independent.
In our example, this means that the events that there are $j$ calls between 5:00 and 5:15 P.M. and $k$ calls between 6:00 and 6:15 P.M. on the same day are independent.

We can use the binomial distribution to model this situation.
We imagine that a given time interval is broken up into $n$ subintervals of equal length.
If the subintervals are sufficiently short, we can assume that two or more occurences happen in one subinterval with a probability which is negligible in comparison with the probability of at most one occurrence.
Thus, in each subinterval, we are assuming that there is either 0 or 1 occurrence.
This means that the sequence of subintervals can be thought of as a sequence of Bernoulli trials, with a success corresponding to an occurrence in the subinterval.

To decide upon the proper value of $p$, the probability of an occurrence in a given subinterval, we reason as follows.
On the average, theere are $\lambda t$ occurrences in a time interval of length $t$.
If this time interval is divided into $n$ subintervals, then we would expect, using the Bernoulli trials interpretation, that there should be $np$ occurrences.
Thus, we want

$\lambda t = np\;,$

so

$p = \frac{\lambda t}{n} \;.$

We now wish to consider the random variable $X$, which counts the number of occurrences in a given time interval.
We want to calculate the distribution of $X$.
For ease of calculation, we will assume that the time interval is of length 1; for time intervals of arbitrary length $t$, see Exercise 11.
We know that

$P(X = 0) = b(n,p,0) = (1 - p)^n = \left(1 - \frac{\lambda}{n}\right)^n\;.$

For large $n$, this is approximately $e^{-\lambda}$.
It is easy to calculate that for any fixed $k$, we have

$\frac{b(n,p,k)}{b(n,p,k-1)} = \frac{\lambda - (k - 1)p}{kq}$

which, for large $n$ (and therefore small $p$) is approximately $\lambda / k$.
Thus, we have

$P(X = 1) ≈ \lambda e^{-\lambda}\;,$

and in general,

$P(X = k) ≈ \frac{\lambda^k}{k!} e^{-\lambda}\;.$

The above distribution is the Poisson distribution.
We note that it must be checked that the distribution given in Equation 5.2 really *is* a distribution, i.e., that its values are non-negative and sum to 1. (See Exercise 12.)

The Poisson distribution is used as an approximation to the binomial distribution when the parameters $n$ and $p$ are large and small, respectively (see Example 5.3 and 5.4).
However, the Poisson distribution also arises in situations where it may not be easy to interpret or measure the parameters $n$ and $p$ (see Example 5.5).
"""

# ╔═╡ 02b6d8a0-9188-4613-9917-a1b6168dc187
md"""
### Hypergeometric Distribution

Suppose that we have a set of $N$ balls, of which $k$ are red and $N - k$ are blue.
We choose $n$ of these balls, without replacement, and define $X$ to be the number of balls in our sample.
The distribution of $X$ is called the hypergeometric distribution.
We note that this distribution depends upon three parameters, namely $N$, $k$, and $n$.
There does not seem to be a standard notation for this distribution; we will use the notation $h(N,k,n,x)$ to denote $P(X = x)$.
This probability can be found by noting that there are

$\begin{pmatrix} N \\ n \end{pmatrix}$

different samples of size $n$, and the number of such samples with exactly $x$ red balls is obtained by multiplying the number of ways of choosing $x$ red balls from the set of $k$ red balls and the number of ways of choosing $n - x$ blue balls from the set of $N - k$ blue balls.
Hence we have

$h(N,k,n,x) = \frac{\begin{pmatrix} k \\ x \end{pmatrix} \begin{pmatrix} N - k \\ n - x \end{pmatrix}}{\begin{pmatrix} N \\ n \end{pmatrix}}\;.$

This distribution can be generalized to the case where there are more than two types of objects.
(See Exercise 40.)

If we let $N$ and $k$ tend to $∞$, in such a way that the ratio $k/N$ remains fixed, then the hypergeometric distribution tends to the binomial distribution with parameters $n$ and $p = k/N$.
This is reasonable because if $N$ and $k$ are much larger than $n$, then whether we choose our sample with or without replacement should not affect the probabilities very much, and the experiment consisting of choosing with replacement yields a binomially distributed random variable (see Exercise 44).

An example of how this distribution might be used is given in Exercises 36 and 37.
We now give another example involving the hypergeometric distribution.
It illustrates a statistical test called Fisher's Exact Test.
"""

# ╔═╡ b91a3d13-236c-42a3-9686-5ddc75da4fd1
md"### Benford Distribution"

# ╔═╡ fabcbf77-4280-4116-a835-275bec3d92c6
md"## Important Densities"

# ╔═╡ 50cca29a-31b3-4574-a670-135fee22f346
md"""
### Continuous Uniform Density

The simplest density function corresponds to the random variable $U$ whose value represents the outcome of the experiment consisting of choosing a real number at random from the interval $[a,b]$.

$f(\omega) = \begin{cases} 1/(b - a), &\text{if } a ≤ \omega ≤ b, \\
0, &\text{otherwise.}
\end{cases}$

It is easy to simulate this density on a computer.
We simply calculate the expression

$(b - a) rnd + a\;.$
"""

# ╔═╡ 1eb8550c-16b6-4646-a400-fb3c683254ae
md"""
### Exponential and Gamma Densities

The exponential density function is defined by

$f(x) = \begin{cases}
\lambda e^{-\lambda x}, &\text{if } 0 ≤ x < ∞, \\
0, &\text{otherwise.}
\end{cases}$

Here $\lambda$ is any positive constant, depending on the experiment.
The reader has seen this density in Example 2.17.
In Figure 5.6 we show graphs of several exponential densities for different choices of $\lambda$.
The exponential density is often used to describe experiments involving a question of the form:
How long until something happens?
For example, the exponential density is often used to study the time between emissions of particles from a radioactive source.

The cumulative distribution function of the exponential density is easy to compute.
Let $T$ be an exponentially distributed random variable with parameter $\lambda$.
If $x ≥ 0$, then we have

$\begin{align*}
F(x) &= P(T ≤ x) \\
&= ∫_0^x \lambda e^{-\lambda t} \;dt \\
&= 1 - e^{-\lambda x}\;.
\end{align*}$

Both the exponential density and the geometric distribution share a property known as the "memoryless" property.
This property was introduced in Example 5.1; it says that

$P(T > r + s ∣ T > r) = P(T > s)\;.$

This can be demonstrated to hold for the exponential density by computing both sides of this equation.
The right-hand side is just

$1 - F(s) = e^{-\lambda s}$

while the left-hand side is

$\begin{align*}
\frac{P(T > r + s)}{P(T > r)} &= \frac{1 - F(r + s)}{1 - F(r)} \\
&= \frac{e^{-\lambda (r + s)}}{e^{-\lambda r}} \\
&= e^{-\lambda s}
\end{align*}$

There is a very important relationship between the exponential density and the Poisson distribution.
We begin by defining $X_1$, $X_2$, … to be a sequence of independent exponentially distributed random variables with parameter $\lambda$.
We might think of $X_i$ as denoting the amount of time between the $i$th and $(i + 1)$st emissions of a particle by a radioactive source.
"""

# ╔═╡ b655a85e-41d0-478e-bebc-018d4c809870
md"### Functions of a Random Variable"

# ╔═╡ 77527bc9-271e-40b9-a10b-285622a01511
md"### Simulation"

# ╔═╡ fe582a32-2ed7-4802-bf80-5d0df742fa68
md"""
### Normal Density

We now come to the most important density function, the normal density function.
We have seen in Chapter 3 that the binomial distribution functions are bell-shaped, even for moderate size values of $n$.
We recall that a binomially-distributed random variable with parameters $n$ and $p$ can be considered to be the sum of $n$ mutually independent 0--1 random variables.
A very important theorem in probability theory, called the Central Limit Theorem, states that under very general conditions, wif we sum a large number of mutually independent random variables, then the distribution of the sum can closely approximated by a certain specific continuous density, called the normal density.
This theorem will be discussed in Chapter 9.

The normal density function with parameters $\mu$ and $\sigma$ is defined as follows:

$f_X(x) = \frac{1}{\sqrt{2 \pi} \sigma} e^{-(x - \mu)^2 / 2\sigma^2}\;.$

The parameter $\mu$ represents the "center" of the density (and in Chapter 6, we will show that it is the average, or expected, value of the density).
The parameter $\sigma$ is a measure of the "spread" of the density, and thus it is assumed to be positive.
(In Chapter 6, we will show that $\sigma$ is the standard deviation of the density.)
We note that it is not at all obvious that the above function is a density, i.e., that its integral over the real line equals 1.
The cumulative distribution function is given by the formula

$F_X(x) = ∫_{-∞}^x \frac{1}{\sqrt{2\pi} \sigma} e^{-(u - \mu)^2 / 2\sigma^2} \;du\;.$

In Figure 5.10 we have included for a comparison a plot of the normal density for the cases $\mu = 0$ and $\sigma = 1$, and $\mu = 0$ and $\sigma = 2$.

One cannot write $F_X$ in terms of simple functions.
This leads to several problems.
First of all, values of $F_X$ must be computed using numerical integration.
Extensive tables exist containing values of this function (see Appendix A).
Secondly, we cannot write ${F_X}^{-1}$ in closed form, so we cannot use Corollary 5.2 to help us simulate a normal random variable.
For this reason, special methods have been developed for simulating a normal distribution.
One such method relies on the fact that if $U$ and $V$ are independent random variables with uniform densities on $[0,1]$, then the random variables

$X = \sqrt{-2 \log{U}} \cos{2\pi V}$

and

$Y = \sqrt{-2 \log{U}} \sin{2\pi V}$

are independent, and have normal density functions with parameters $\mu = 0$ and $\sigma = 1$.
(This is not obvious, nor shall we prove it here.
See Box and Muller.⁹)

Let $Z$ be a normal random variable with parameters $\mu = 0$ and $\sigma = 1$.
A normal random variable with these parameters is said to be a *standard* normal random variable.
It is an important and useful fact that if we write

$X = \sigma Z + \mu\;,$

then $X$ is a normal random variable with parameters $\mu$ and $\sigma$.
To show this, we will use Theorem 5.1.
We have $\phi(z) = \sigma z + \mu$, $\phi^{-1}(x) = (x - \mu) / \sigma$, and

$F_X(x) = F_Z\left(\frac{x - \mu}{\sigma}\right)\;,$

$f_X(x) = f_Z\left(\frac{x - \mu}{\sigma}\right) ⋅ \frac{1}{\sigma} = \frac{1}{\sqrt{2 \pi} \sigma} e^{-(x - \mu)^2 / 2\sigma^2}\;.$

The reader will note that this last expression is the density function with parameters $\mu$ and $\sigma$, as claimed.
"""

# ╔═╡ 75e1d5ac-64dc-4c9b-873a-ddcc94183b7a
md"### Maxwell and Rayleigh Densities"

# ╔═╡ 01522192-baa0-4ca0-847f-040aa4ad7e82
md"### Chi-Squared Density"

# ╔═╡ dfa2bd8a-32f0-4318-b38e-e939785a79e7
md"### Cauchy Density"

# ╔═╡ b257a2a6-0b48-4ab9-98e7-1827e081bad7
md"# Expected Value and Variance"

# ╔═╡ 9465f5aa-d445-4541-ba12-838879b68b5d
md"## Expected Value of Discrete Random Variables"

# ╔═╡ 3e0d134d-4687-4dae-9e88-4b949c65d917
md"### Average Value"

# ╔═╡ 8d8f750d-eb5f-438d-8192-8586a075b993
md"### Expected Value"

# ╔═╡ a40d9ee3-4d89-43e2-861c-3a4ed46ead0b
md"""
**Definition 6.1** Let $X$ be a numerically-valued discrete random variable with sample space $\Omega$ and distribution function $m(x)$.
The **expected value** $E(X)$ is defined by

$E(X) = \sum_{x ∈ Ω} xm(x)\;,$

provided this sum converges absolutely.
We often refer to the expected value as the *mean*, and denote $E(X)$ by $\mu$ for short.
If the above sum does not converge absolutely, then we say that $X$ does not have an expected value.
"""

# ╔═╡ babb35f4-8d2a-4d63-be6c-2f662a04c224
md"### Interpretation of Expected Value"

# ╔═╡ 12b4cff7-f982-4b20-9608-aac3c0c777db
md"### Expectation of a Function of a Random Variable"

# ╔═╡ c0671fda-3dcb-4d8b-96dc-a93c05451c10
md"""
**Theorem 6.1**
If $X$ is a discrete random variable with sample space $Ω$ and distribution function $m(x)$, and if $\phi = Ω → \text{R}$ is a function, then

$E(\phi(X)) = \sum_{x ∈ Ω} \phi(x) m(x) \;,$

provided the series converges absolutely.

The proof of this theorem is straightforward, involving nothing more than grouping values of $X$ with a common $Y$-value, as in Example 6.6.
"""

# ╔═╡ 3449343a-4b62-48fc-90c3-5d68b79677f1
md"### The Sum of Two Random Variables"

# ╔═╡ 57892be6-cf7e-49d5-975e-411c1589ec56
md"""
**Theorem 6.2 (Linearity of Expectation)**
Let $X$ and $Y$ be random variables with finite expected values.
Then

$E(X + Y) = E(X) + E(Y)\;,$

and if $c$ is any constant, then

$E(cX) = cE(X)\;.$
"""

# ╔═╡ 2e744a9d-dcde-408a-bd3d-e028ca80fc79
md"### Poisson Distribution"

# ╔═╡ 3f9d7185-3cd8-44ba-8be1-7178b7eca1b8
md"### Independence"

# ╔═╡ c55c937b-af4f-4e1e-a1ce-5e36a40e7c25
md"""
**Theorem 6.4**
If $X$ and $Y$ are independent random variables, then

$E(X ⋅ Y) = E(X) E(Y)\;.$
"""

# ╔═╡ 21ca33b6-651e-403d-a60c-63dd61500efe
md"### Records"

# ╔═╡ 58ad6422-4a46-4690-adc8-56a9bfef1836
md"### Craps"

# ╔═╡ 08d0570a-f89e-4cd7-ac2e-ca9e9e675f48
md"### Roulette"

# ╔═╡ 101dc5b2-9ba4-4b2d-9329-da4870c43a26
md"### Conditional Expectation"

# ╔═╡ c07661f5-2f73-4ab4-a869-62fea3b411cd
md"### Martingales"

# ╔═╡ a52efb8b-e3e4-4fe9-be42-de5bc1a8a9cc
md"### Stock Prices"

# ╔═╡ 3f9d6946-58ec-41a9-84b0-68062c8fd493
md"### Historical Remarks"

# ╔═╡ 03b6f961-cea4-4789-9f0a-be180dbd1260
md"## Variance of Discrete Random Variables"

# ╔═╡ 30071526-d9db-45a1-a4c9-c849affc4db5
md"### Variance"

# ╔═╡ e0172ab9-bea3-482c-ba88-9cb2b0e73f43
md"""
**Definition 6.3**
Let $X$ be a numerically valued random variable with expected value $\mu = E(X)$.
Then the **variance** of $X$, denoted by $V(X)$, is

$V(X) = E((X - \mu)^2)\;.$

Note that, by Theorem 6.1, $V(X)$ is given by

$V(X) = \sum_x (x - \mu)^2 m(x)\;,$

where $m$ is the distribution function of $X$.
"""

# ╔═╡ 28c67142-8144-4080-9a3f-189d7e101905
md"""
### Standard Deviation

The *standard deviation* of $X$, denoted by $D(X)$, is $D(X) = \sqrt{V(X)}$.
We often write $\sigma$ for $D(X)$ and $\sigma^2$ for $V(X)$.
"""

# ╔═╡ 46c6e3de-aee0-442a-9930-088b420b9920
md"### Calculation of Variance"

# ╔═╡ 07485eae-0aeb-4376-a1df-0b5570048a8c
md"""
**Theorem 6.6**
If $X$ is any random variable with $E(X) = \mu$, then

$V(X) = E(X^2) - \mu^2\;.$
"""

# ╔═╡ 144aa479-27b8-497c-828c-6845e7eddd95
md"### Properties of Variance"

# ╔═╡ 26419c2b-431c-4459-bad7-f594038c53c4
md"""
**Theorem 6.7**
If $X$ is any random variable and $c$ is any constant, then

$V(cX) = c^2 V(X)$

and

$V(X + c) = V(X)\;.$
"""

# ╔═╡ a254a25c-f8c8-40bd-988a-47cb313d4929
md"""
**Theorem 6.8**
Let $X$ and $Y$ be two *independent* random variables.
Then

$V(X + Y) = V(X) + V(Y)\;.$
"""

# ╔═╡ cb0ddaf6-3e1d-4af4-8998-bb8b6c95145f
md"""
**Theorem 6.9**
Let $X_1, X_2, …, X_n$ be an independent trials process with $E(X_j) = \mu$ and $V(X_j) = \sigma^2$.
Let

$S_n = X_1 + X_2 + ⋯ + X_n$

be the sum, and

$A_n = \frac{S_n}{n}$

be the average.
Then

$\begin{align*}
E(S_n) &= n \mu \;, \\
V(S_n) &= n \sigma^2 \;, \\
\sigma(S_n) &= \sigma \sqrt{n} \;, \\
E(A_n) &= \mu \;, \\
V(A_n) &= \frac{\sigma^2}{n} \;, \\
\sigma(A_n) &= \frac{\sigma}{\sqrt{n}} \;.
\end{align*}$
"""

# ╔═╡ ca29b486-6565-4b94-8ee9-636103969ff5
md"""
### Bernoulli Trials

Consider next the general Bernoulli trials process.
As usual, we let $X_j = 1$ if the $j$th outcome is a success and 0 if it is a failure.
If $p$ is the probability of a success, and $q = 1 - p$, then

$\begin{align*}
E(X_j) &= 0q + 1p = p\;, \\
E({X_j}^2) &= 0^2 q + 1^2 p = p\;,
\end{align*}$

Thus, for Bernoulli trials, if $S_n = X_1 + X_2 + ⋯ + X_n$ is the number of successes, then $E(S_n) = np$, $V(S_n) = npq$, and $D(S_n) = \sqrt{npq}$.
If $A_n = S_n / n$ is the average number of successes, then $E(A_n) = p$, $V(A_n) = pq/n$, and $D(A_n) = \sqrt{pq/n}$.
We see that the expected proportion of successes remains $p$ and the variance tends to 0.
This suggests that the frequency interpretation of probability is a correct one.
We shall make this more precise in Chapter 8.
"""

# ╔═╡ 944f8f83-bd8b-4d4e-b2ca-d0119e06e334
md"""
### Poisson Distribution

Just as in the case of expected values, it is easy to guess the variance of the Poisson distribution with parameter $\lambda$.
We recall that the variance of a binomial distribution with parameters $n$ and $p$ equals $npq$.
We also recall that the Poisson distribution could be obtained as a limit of binomial distributions, if $n$ goes to $\infty$ and $p$ goes to 0 in such a way that their product is kept fixed at the value $\lambda$.
In this case, $npq = \lambda q$ approaches $\lambda$, since $q$ goes to 1.
So, given a Poisson distribution with parameter $\lambda$, we should guess that its variance is $\lambda$.
The reader is asked to show this in Exercise 29.
"""

# ╔═╡ 4694a3cc-f728-4b8c-bc81-69933e89a574
md"## Continuous Random Variables"

# ╔═╡ 012a31ee-02f0-416b-a2e0-2955ca4f42f9
md"### Expected Value"

# ╔═╡ b24a70d4-d778-4497-9da9-9b7fe6236c2b
md"""
**Definition 6.4**
Let $X$ be a real-valued random variable with density function $f(x)$.
The *expected value* $\mu = E(X)$ is defined by

$\mu = E(X) = ∫_{-∞}^{+∞} xf(x) \;dx\;,$

provided the integral

$∫_{-∞}^{+∞} |x| f(x) \;dx$

is finite.
"""

# ╔═╡ 099cafe1-7702-4804-9f43-8c38a65790ea
md"""
**Theorem 6.10**
If $X$ and $Y$ are real-valued random variables and $c$ is any constant, then

$\begin{align*}
E(X + Y) &= E(X) + E(Y) \;, \\
E(cX) &= cE(X)\;.
\end{align*}$

More generally, if $X_1, X_2, …, X_n$ are $n$ real-valued random variables, and $c_1, c_2, …, c_n$ are $n$ constants, then

$E(c_1 X_1 + c_2 X_2 + ⋯ + c_n X_n) = c_1 E(X_1) + c_2 E(X_2) + ⋯ + c_n E(X_n)$
"""

# ╔═╡ 7493be31-f225-416c-bbe9-9d3ab8cd2658
md"### Expectation of a Function of a Random Variable"

# ╔═╡ 4d13debf-2fd3-4bb3-a0b1-29f6377beae3
md"""
**Theorem 6.11**
If $X$ is a real-value random variable and if $\phi : 𝐑 → 𝐑$ is a continuous real-valued function with domain $[a, b]$, then

$E(\phi(X)) = ∫_{-∞}^{+∞} \phi(x) f_X(x) \;dx\;,$

provided the integral exists.
"""

# ╔═╡ 5f224667-e277-44e4-aef2-1c5cb9bb71e5
md"### Expectation of the Product of Two Random Variables"

# ╔═╡ 4f0395d2-ef00-472e-8763-71c2e76b8699
md"""
**Theorem 6.12**
Let $X$ and $Y$ be independent real-valued continuous random variables with finite expected values.
Then we have

$E(XY) = E(X)E(Y)\;.$
"""

# ╔═╡ 5f24ed38-100b-4aaa-8299-8367c33d031a
md"### Variance"

# ╔═╡ 3537d12a-9310-4afd-ab10-5c24013f2c63
md"""
**Definition 6.5**
Let $X$ be a real-valued random variable with density function $f(x)$.
The *variance* $\sigma^2 = V(X)$ is defined by

$\sigma^2 = V(X) = E((X - \mu)^2)$
"""

# ╔═╡ acdc80f2-faf4-4a06-ad81-0e40a3436e81
md"""
**Theorem 6.14**
If $X$ is a real-valued random variable defined on $Ω$ and $c$ is any constant, then (cf. Theorem 6.7)

$\begin{align*}
V(cX) &= c^2 V(X) \;, \\
V(X + c) &= V(X) \;.
\end{align*}$
"""

# ╔═╡ bc0d47d6-6c49-422d-8d3a-8a5f0cf86ac7
md"""
**Theorem 6.15**
If $X$ is a real-valued random variable with $E(X) = \mu$, then (cf. Theorem 6.6)

$V(X) = E(X^2) - \mu^2\;.$
"""

# ╔═╡ 48cb0247-2081-40dc-ba4d-b2340acb2522
md"""
**Theorem 6.16**
If $X$ and $Y$ are independent real-valued random variables on $Ω$, then (cf. Theorem 6.8)

$V(X + Y) = V(X) + V(Y)\;.$
"""

# ╔═╡ f7ced716-0073-484d-8ded-dc110ac93f83
md"### Independent Trials"

# ╔═╡ a13a2cf0-ffea-471d-8455-dc31955db977
md"""
**Corollary 6.1**
If $X_1, X_2, …, X_n$ is an independent trials process of real-valued random variables, with $E(X_i) = \mu$ and $V(X_i) = \sigma^2$, and if

$\begin{align*}
S_n &= X_1 + X_2 + ⋯ + X_n \;, \\
A_n &= \frac{S_n}{n} \;,
\end{align*}$

then

$\begin{align*}
E(S_n) &= n\mu \;, \\
E(A_n) &= \mu \;, \\
V(S_n) &= n \sigma^2 \;, \\
V(A_n) &= \frac{\sigma^2}{n} \;.
\end{align*}$

It follows that if we set

$S_n^* = \frac{S_n - n\mu}{\sqrt{n \sigma^2}} \;,$

then

$\begin{align*}
E(S_n^*) &= 0 \;, \\
V(S_n^*) &= 1 \;.
\end{align*}$

We say that $S_n^*$ is a *standardized version* of $S_n$ (see Exercise 12 in Section 6.2).
"""

# ╔═╡ f63049c9-1702-4b68-9b3c-2949bd5904a4
md"### Queues"

# ╔═╡ 7179db95-f6e4-45a1-9736-9a05afbdd02d
md"# Sums of Independent Random Variables"

# ╔═╡ 1eab7ede-333c-4cdf-b08e-91768c474e0f
md"## Sums of Discrete Random Variables"

# ╔═╡ 23f413cf-9512-48e5-b204-68d6ec3f0ac2
md"### Convolutions"

# ╔═╡ f07fc05c-6076-4e79-8e6d-402f2e898118
md"""
**Definition 7.1** Let $X$ and $Y$ be two independent integer-valued random variables, with distribution functions $m_1(x)$ and $m_2(x)$ respectively.
Then the *convolution* of $m_1(x)$ and $m_2(x)$ is the distribution function $m_3 = m_1 ∗ m_2$ given by

$m_3(j) = \sum_k m_1(k) ⋅ m_2(j - k)\;,$

for $j = …, -2, -1, 0, 1, 2, ….$
The function $m_3(x)$ is the distribution function of the random variable $Z = X + Y$.
"""

# ╔═╡ a2b48b2e-b366-4182-b6fb-1877f7e12519
md"## Sums of Continuous Random Variables"

# ╔═╡ 9f944dbc-e38f-4cd1-9e6a-4b2693e77bf2
md"### Convolutions"

# ╔═╡ ba271ab3-a938-4d91-ae2a-87785bcd39d5
md"""
**Definition 7.2**
Let $X$ and $Y$ be two continuous random variables with density functions $f(x)$ and $g(y)$, respectively.
Assume that both $f(x)$ and $g(y)$ are defined for all real numbers.
Then the *convolution* $f ∗ g$ of $f$ and $g$ is the function given by

$\begin{align*}
(f ∗ g)(z) &= ∫_{-∞}^{+∞} f(z - y) g(y) \;dy \\
&= ∫_{-∞}^{+∞} g(z - x) f(x) \;dx\;.
\end{align*}$
"""

# ╔═╡ f04cfa4b-d9c0-456a-a5f1-60d6a36256b7
md"# Law of Large Numbers"

# ╔═╡ 7f71f08f-57cf-44a3-b08b-bd6e73eba44b
md"## Law of Large Numbers for Discrete Random Variables"

# ╔═╡ c0f94ab1-2464-494d-b3eb-facc3018b673
md"### Chebyshev Inequality"

# ╔═╡ 3e4a84c2-bc02-4770-b403-3cdb49c9e06f
md"""
**Theorem 8.1 (Chebyshev Inequality)**
Let $X$ be a discrete random variable with expected value $\mu = E(X)$, and let $\epsilon > 0$ be any positive real number.
Then

$P(|X - \mu| ≥ \epsilon) ≤ \frac{V(X)}{\epsilon^2}\;.$
"""

# ╔═╡ 33261b7f-1b66-4441-ab77-cb519aa422d7
md"""
**Theorem 8.2 (Law of Large Numbers)**
Let $X_1, X_2, …, X_n$ be an independent trials process, with finite expected value $\mu = E(X_j)$ and finite variance $\sigma^2 = V(X_j)$.
Let $S_n = X_1 + X_2 + ⋯ + X_n$.
Then for any $\epsilon > 0$,

$P\left(\left|\frac{S_n}{n} - \mu\right| ≥ \epsilon\right) → 0$

as $n → ∞$. Equivalently,

$P\left(\left|\frac{S_n}{n} - \mu\right| < \epsilon\right) → 1$

as $n → ∞$.
"""

# ╔═╡ 354feeb2-4bb3-408c-a2d6-7b2f37d51de2
md"## Law of Large Numbers for Continuous Random Variables"

# ╔═╡ ccf1a8a0-cbb4-412d-9451-4163c67c80f9
md"### Chebyshev Inequality"

# ╔═╡ f9968ce7-b06d-4d19-b748-6b134de65c94
md"""
**Theorem 8.3 (Chebyshev Inequality)** Let $X$ be a continuous random variable with density function $f(x)$.
Suppose $X$ has a finite expected value $\mu = E(X)$ and finite variance $\sigma^2 = V(X)$.
Then for any positive number $\epsilon > 0$ we have

$P(|X - \mu| ≥ \epsilon) ≤ \frac{\sigma^2}{\epsilon^2}\;.$
"""

# ╔═╡ 730c42e4-216a-4d19-87f6-088c628822d0
md"### Law of Large Numbers"

# ╔═╡ cbd999ad-40e8-4439-9135-734fdcf14c5d
md"""
**Theorem 8.4 (Law of Large Numbers)**
Let $X_1, X_2, …, X_n$ be an independent trials process with a continuous density function $f$, finite expected value $\mu$, and finite variance $\sigma^2$.
Let $S_n = X_1 + X_2 + ⋯ + X_n$ be the sum of the $X_i$.
Then for any real number $\epsilon > 0$ we have

$\lim_{n → ∞} P\left(\left|\frac{S_n}{n} - \mu\right| ≥ \epsilon\right) = 0\;,$

or equivalently,

$\lim_{n → ∞} P\left(\left|\frac{S_n}{n} - \mu\right| < \epsilon\right) = 1\;.$
"""

# ╔═╡ b26e522b-96c7-46a5-9404-253ddad70afd
md"# Central Limit Theorem"

# ╔═╡ 9e664d0b-b1c1-4532-9dee-06cc0309093a
md"## Central Limit Theorem for Bernoulli Trials"

# ╔═╡ 8c39c8a9-e51a-4f48-bf88-50b4f1eb8a2a
md"### Bernoulli Trials"

# ╔═╡ 64ec4921-d8a5-4565-b2ec-69b929f3996d
md"### Standardized Sums"

# ╔═╡ b3dbc2f8-6f22-42e9-a2fa-a3feecc51f5f
md"""
**Definition 9.1**
The **standardized sum** of $S_n$ is given by

$S_n^* = \frac{S_n - np}{\sqrt{npq}}\;.$

``S_n^*`` always has expected value 0 and variance 1.
"""

# ╔═╡ 7fc0d014-7373-4ef4-ae14-ed87463deb75
md"""
**Theorem 9.1 (Central Limit Theorem for Binomial Distributions)**
For the binomial distribution $b(n,p,j)$ we have

$\lim_{n → ∞} \sqrt{npq}\; b(n,p,\left\langle np + x\sqrt{npq}\right\rangle) = \phi(x)\;,$

where $\phi(x)$ is the standard normal density.
"""

# ╔═╡ ec7a90fc-25b8-433f-8210-2216c860a2c8
md"""
**Theorem 9.2 (Central Limit Theorem for Bernoulli Trials)**
Let $S_n$ be the number of successes in $n$ Bernoulli trials with probability $p$ for success, and let $a$ and $b$ be two fixed real numbers.
Then

$\lim_{n → ∞} P\left(a ≤ \frac{S_n - np}{\sqrt{npq}} ≤ b\right) = ∫_a^b \phi(x) \;dx\;.$
"""

# ╔═╡ 592fcbec-ea6c-4ca2-943b-1eba037fa363
md"### Approximation of Binomial Probabilities"

# ╔═╡ c0ec1a83-8cb0-40d4-877c-966b796b33f2
md"### Applications to Statistics"

# ╔═╡ a5f6e1ad-ceb1-4eca-a1b3-de2b05a966ea
md"### Historical Remarks"

# ╔═╡ 8cc58368-232b-41db-8f79-cf394a615887
md"## Central Limit Theorem for Discrete Independent Trials"

# ╔═╡ c925c992-8532-4765-aed7-1bcd0a71ca16
md"""### Standardized Sums

Consider the standardized random variable

$S_n^* = \frac{S_n - n\mu}{\sqrt{n\sigma^2}}\;.$

This standardizes $S_n$ to have expected value $0$ and variance $1$.
If $S_n = j$, then $S_n^*$ has the value $x_j$ with

$x_j = \frac{j - n\mu}{\sqrt{n\sigma^2}}\;.$

We can construct a spike graph just as we did for Bernoulli trials.
Each spike is centered at some $x_j$.
The distance between successive spikes is

$b = \frac{1}{\sqrt{n \sigma^2}}\;,$

and the height of the spike is

$h = \sqrt{n\sigma^2} P(S_n = j)\;.$

The case of Bernoulli trials is the special case for which $X_j = 1$ if the $j$th outcome is a success and $0$ otherwise; then $\mu = p$ and $\sigma^2 = \sqrt{pq}$.

We now illustrate this process for two different discrete distributions.
The first the is the distribution $m$, given by

$m = \begin{pmatrix} 1 & 2 & 3 & 4 & 5 \\ .2 & .2 & .2 & .2 & .2 \end{pmatrix}\;.$

In Figure 9.7 we show that the standardized sums for this distribution for the cases $n = 2$ and $n = 10$.
Even for $n = 2$ the approximation is surprisingly good.

For our second discrete distribution, we choose

$m = \begin{pmatrix} 1 & 2 & 3 & 4 & 5 \\ .4 & .3 & .1 & .1 & .1 \end{pmatrix}\;.$

This distribution is quite asymmetric and the approximation is not very good for $n = 3$, but by $n = 10$ we again have an excellent approximation (see Figure 9.8).
Figures 9.7 and 9.8 were produced by the program **CLTIndTrialsPlot**.
"""

# ╔═╡ 77f267f5-c14d-4d5a-872a-2e54311cdf72
md"### Approximation Theorem"

# ╔═╡ 52178723-6311-4bf1-b42d-20e85adeeb1b
md"""
**Theorem 9.3**
Let $X_1, X_2, …, X_n$ be an independent trials process and let $S_n = X_1 + X_2 + ⋯ + X_n$.
Assume that the greatest common divisor of the differences of all the values that the $X_j$ can take on is 1.
Let $E(X_j) = \mu$ and $V(X_j) = \sigma^2$.
Then for $n$ large,

$P(S_n = j) ∼ \frac{\phi(x_j)}{\sqrt{n\sigma^2}}\;,$

where $x_j = (j - n\mu) / \sqrt{n\sigma^2}$, and $\phi(x)$ is the standard normal density.
"""

# ╔═╡ 50cefd0a-ac4e-4e55-a31f-d92cb365aca1
md"### Central Limit Theorem for a Discrete Independent Trials Process"

# ╔═╡ 71550f23-fc60-4be2-8579-0a944ec5a092
md"### A More General Central Limit Theorem"

# ╔═╡ 88d47da4-b8ec-494b-bb62-cc36838eac9d
md"### The Normal Distribution and Genetics"

# ╔═╡ 43cb1285-c1cb-4594-8fdd-29499569e567
md"### Discussion"

# ╔═╡ 6468c629-560f-4866-9c3d-96e9ff788bc8
md"### Historical Remarks"

# ╔═╡ 5b1d8dd2-8c02-45a7-9051-0421edc4efa9
md"## Central Limit Theorem for Continuous Independent Trials"

# ╔═╡ cd1c76dc-7419-4f64-947b-883a1e2e7691
md"### Standardized Sums"

# ╔═╡ 8c2dff98-2321-4b5d-822a-1e59af796a38
md"### Central Limit Theorem"

# ╔═╡ ce41bd43-e77b-4fc1-86bd-cfe247754a67
md"""
**Theorem 9.6 (Central Limit Theorem)**
Let $S_n = X_1 + X_2 + ⋯ + X_n$ be the sum of $n$ independent continuous random variables with common density function $p$ having expected value $\mu$ and variance $\sigma^2$.
Let $S_n^* = (S_n - n\mu) / \sqrt{n}\sigma$.
Then we have, for all $a < b$,

$\lim_{n → ∞} P(a < S_n^* < b) = \frac{1}{\sqrt{2\pi}} ∫_a^b e^{-x^2/2} \;dx\;.$
"""

# ╔═╡ 10bffa9a-025e-4be5-990f-9db4d2fca8bf
md"### Estimating the Mean"

# ╔═╡ 8c1f3cb0-5f09-4bf6-b575-7ecd8bb51273
md"### Sample Mean"

# ╔═╡ a0094ad0-d25c-4b49-be3e-d4949d405797
md"### Sample Variance"

# ╔═╡ 6a0050de-d47f-440d-b81e-2c94560cf9ec
md"### $t$-Density"

# ╔═╡ ba6f5c07-c500-4fa5-8059-97bd51888284
md"# Generating Functions"

# ╔═╡ c5e61ab7-b163-4368-9c67-34e3db58dff0
md"## Generating Functions for Discrete Distributions"

# ╔═╡ 6fe1c732-f77f-419c-bc4e-96674fbadf6e
md"### Moments"

# ╔═╡ 869637bc-7312-49ee-92e4-247d01f4d88d
md"### Moment Generating Functions"

# ╔═╡ 407e14e0-848d-440a-883a-046be2fa84b1
md"### Moment Problem"

# ╔═╡ 4853b5f3-dec8-4e15-8758-49b47d7edf91
md"""
**Theorem 10.1**
Let $X$ be a discrete random variable with finite range $\{x_1, x_2, …, x_n\}$ distribution function $p$, and moment generating function $g$.
Then $g$ is uniquely determined by $p$, and conversely.
"""

# ╔═╡ 592f94dd-827c-41d1-b07b-3c8ea9aa1a99
md"""
### Ordinary Generating Functions

In the special but important case where the $x_j$ are all nonnegative integers, $x_j = j$, we can prove this theorem in a simpler way.

In this case, we have

$g(t) = \sum_{j = 0}^n e^{tj} p(j)\;,$

and we see that $g(t)$ is a *polynomial* in $e^t$.
If we write $z = e^t$, and define the function $h$ by

$h(z) = \sum_{j = 0}^n z^j p(j) \;,$

then $h(z)$ is a polynomial in $z$ containing the same information as $g(t)$, and in fact

$\begin{align*}
h(z) &= g(\log{z}) \;, \\
g(t) &= h(e^t)\;.
\end{align*}$

The function $h(z)$ is often called the *ordinary generating function* for $X$.
Note that $h(1) = g(0) = 1$, $h'(1) = g'(0) = \mu_1$, and $h''(1) = g''(0) - g'(0) = \mu_2 - \mu_1$.
It follows from all this that if we know $g(t)$, then we know $h(z)$, and if we know $h(z)$, then we can find the $p(j)$ by Taylor's formula:

$\begin{align*}
p(j) &= \text{coefficient of } z^j \text{ in } h(z) \\
&= \frac{h^{(j)}(0)}{j!} \;.
\end{align*}$

For example, suppose we know that the moments of a certain discrete random variable $X$ are given by

$\begin{align*}
\mu_0 &= 1 \;, \\
\mu_k &= \frac{1}{2} + \frac{2^k}{4} \;, \qquad \text{for } k ≥ 1\;.
\end{align*}$

Then the moment generating function $g$ of $X$ is

$\begin{align*}
g(t) &= \sum_{k = 0}^{∞} \frac{\mu_k t^k}{k!} \\
&= 1 + \frac{1}{2} \sum_{k = 1}^{∞} \frac{t^k}{k!} + \frac{1}{4} \sum_{k = 1}^{∞} \frac{(2t)^k}{k!} \\
&= \frac{1}{4} + \frac{1}{2} e^t + \frac{1}{4} e^{2t} \;.
\end{align*}$

This is a polynomial in $z = e^t$, and

$h(z) = \frac{1}{4} + \frac{1}{2} z + \frac{1}{4} z^2\;.$

Hence, $X$ must have range $\{0,1,2\}$, and $p$ must have values $\{1/4, 1/2, 1/4\}$.
"""

# ╔═╡ a80e4eb7-031f-4a1b-9b2e-7b2bcfa5a087
md"""
### Properties

Both the moment generating function $g$ and the ordinary generating function $h$ have many properties useful in the study of random variables, of which we can consider only a few here.
In particular, if $X$ is any discrete random variable and $Y = X + a$, then

$\begin{align*}
g_Y(t) &= E(e^{tY}) \\
&= E(e^{t(X + a)}) \\
&= e^{ta} E(e^{tX}) \\
&= e^{ta} g_X(t) \;.
\end{align*}$

while if $Y = bX$, then

$\begin{align*}
g_Y(t) &= E(e^{tY}) \\
&= E(e^{tbX}) \\
&= g_X(bt) \;.
\end{align*}$

In particular, if

$X^* = \frac{X - \mu}{\sigma}\;,$

then (see Exercise 11)

$g_{x^*}(t) = e^{-\mu t/\sigma} g_X \left(\frac{t}{\sigma}\right)\;.$

If $X$ and $Y$ are *independent* random variables and $Z = X + Y$ is their sum, with $p_X$, $p_Y$, and $p_Z$ the associated distribution functions, then we have seen in Chapter 7 that $p_Z$ is the *convolution* of $p_X$ and $p_Y$, and we know that convolution involves a rather complicated calculation.
But for the generating functions we have instead the simple relations

$\begin{align*}
g_Z(t) &= g_X(t) g_Y(t) \;, \\
h_Z(z) &= h_X(z) h_Y(z) \;,
\end{align*}$

that is, $g_Z$ is simply the *product* of $g_X$ and $g_Y$, and similarly for $h_Z$.

To see this, first note that if $X$ and $Y$ are independent, then $e^{tX}$ and $e^{tY}$ are independent (see Exercise 5.2.38), and hence

$E(e^{tX} e^{tY}) = E(e^{tX}) E(e^{tY})\;.$

It follows that

$\begin{align*}
g_Z(t) &= E(e^{tZ}) = E(e^{t(X + Y)}) \\
&= E(e^{tX}) E(e^{tY}) \\
&= g_X(t) g_Y(t)\;,
\end{align*}$

and, replacing $t$ by $\log{z}$, we also get

$h_Z(z) = h_X(z) h_Y(z)\;.$
"""

# ╔═╡ 81cb09af-18fc-4771-8c4e-de40666ac10c
md"## Generating Functions for Continuous Densities"

# ╔═╡ 29d443cf-f43e-4ac5-a95e-971442a6839d
md"""
### Moments

If $X$ is a continuous random variable defined on the probability space $Ω$, with density function $f_X$, then we define the $n$th moment of $X$ by the formula

$\mu_n = E(X^n) = ∫_{-∞}^{+∞} x^n f_X(x) \;dx\;,$

provided the integral

$\mu_n = E(X^n) = ∫_{-∞}^{+∞} |x|^n f_X(x) \;dx\;,$

is finite.
Then, just as in the discrete case, we see that $\mu_0 = 1$, $\mu_1 = \mu$, and $\mu_2 - {\mu_1}^2 = \sigma^2$.
"""

# ╔═╡ 25c3aa30-a65d-489f-b1c9-83711acda1af
md"""
### Moment Generating Functions

Now we define the **moment generating function $g(t)$** for $X$ by the formula

$\begin{align*}
g(t) &= \sum_{k = 0}^∞ \frac{\mu_k t^k}{k!} = \sum_{k = 0}^∞ \frac{E(X^k) t^k}{k!} \\
&= E(e^{tX}) = ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx\;,
\end{align*}$
"""

# ╔═╡ ba02e5a9-bb65-4fdf-9ac1-5edd039877f7
md"# Markov Chains"

# ╔═╡ ded3aaa6-0726-4950-b354-d46ba030561c
md"## Introduction"

# ╔═╡ a06a74a8-97ba-4d5e-bb07-f42fd80fadae
md"""
### Specifying a Markov Chain

We describe a Markov chain as follows:
We have a set of **states**, $S = \{s_1, s_2, …, s_r\}$.
The process starts in one of these states and moves successively in state $s_i$, then it moves to state $s_j$ at the next step with a probability denoted by $p_{ij}$, and this probability does not depend upon which states the chain was in before the current state.

The probabilities $p_{ij}$ are called **transition probabilities**.
The process can remain in the state it is in, and this occurs with probability $p_{ii}$.
An initial probability distribution, defined on $S$, specifies the starting state.
Usually this is done by specifying a particular state as the starting state.

R. A. Howard provides us with a picturesque description of a Markov chain as a frog jumping on a set of lily pads.
The frog starts on one of the pads and then jumps from lily pad to lily pad with the appropriate transition probabilities.
"""

# ╔═╡ df1bd6ec-c5b2-46ce-a0ba-4276cad4e281
md"""
### Transition Matrix

The entries in the first row of the matrix $𝐏$ in Example 11.1 represent the probabilities for the various kinds of weather following a rainy day.
Similarly, the entries in the second and third rows represent the probabilities for the various kinds of weather following nice and snowy days, respectively.
Such a square array is called the **matrix of transition probabilities**, or the **transition matrix**.

We consider the question of determining the probability that, given the chain is in state $i$ today, it will be in state $j$ two days from now.
We denote this probability by $p_{ij}^{(2)}$.
In Example 11.1, we see that if it is rainy today then the event that it is snowy two days from now is the disjoint union of the following three events:
1) it is rainy tomorrow and snowy two days from now,
2) it is nice tomorrow and snowy two days from now, and
3) it is snowy tomorrow and snowy two days from now.
The probability of the first of these events is the product of the conditional probability that it is rainy tomorrow, given that it is rainy today, and the conditional probability that it is snowy two days from now, given that it is rainy tomorrow.
Using the transition matrix $𝐏$, we can write this product as $p_{11} p_{13}$.
The other two events also have probabilities that can be written as products of entries of $𝐏$.
Thus, we have

$p_{13}^{(2)} = p_{11} p_{13} + p_{12} p_{23} + p_{13} p_{33}\;.$
"""

# ╔═╡ 36850972-f22f-4a11-a446-56d99b6fb196
md"""
**Theorem 11.1**
Let $𝐏$ be the transition matrix of a Markov chain.
The $ij$th entry $p_{ij}^{(n)}$ of the matrix $𝐏^n$ gives the probability that the Markov chain, starting in state $s_i$, will be in state $s_j$ after $n$ steps.
"""

# ╔═╡ e89580f4-cfa2-4163-a130-fb2c93c4ba45
md"""
**Theorem 11.2**
Let $𝐏$ be the transition matrix of a Markov chain, and let $𝐮$ be the probability vector which represents the starting distribution.
Then the probability that the chain is in state $s_i$ after $n$ steps is the $i$th entry in the vector

$𝐮^{(n)} = 𝐮𝐏^n.$
"""

# ╔═╡ c06493f9-c181-4e75-bebb-da8cab52495c
md"## Absorbing Markov Chains"

# ╔═╡ 3fd4b1f5-869d-4d65-9d7b-d30f7e463e88
md"""
**Definition 11.1**
A state $s_i$ of a Markov chain is called **absorbing** if it is impossible to leave it (i.e., $p_{ii} = 1$).
A Markov chain is **absorbing** if it has at least one absorbing state, and if from every state it is possible to go to an absorbing state (not necessarily in one step).
"""

# ╔═╡ f2f5ed06-8a09-49b9-8fa8-e058052f99a2
md"### Drunkard's Walk"

# ╔═╡ 6a866197-9fdd-4a95-8c0e-d9a404a349af
md"""
### Canonical Form

Consider an arbitrary Markov chain.
Renumber the states so that the transient states come first.
If there are $r$ absorbing states and $t$ transient states, the transition matrix will have the following **canonical form**

$𝐏 = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c}
\text{TR.} & \text{ABS.}
\end{array} \\
\begin{array}{c}
\text{TR.} \\[10pt] \text{ABS.}
\end{array}\hspace{-0.8em} &
\left(
\begin{array}{c | c}
\;𝐐\; & \;𝐑\; \\[15pt]
\hline
𝟎 & 𝐈
\end{array}
\right) \\
\end{array}$

Here $𝐈$ is an $r$-by-$r$ identity matrix, $𝟎$ is an $r$-by-$t$ zero matrix, $𝐑$ is a nonzero $t$-by-$r$ matrix, and $𝐐$ is an $t$-by-$t$ matrix.
The first $t$ states are transient and the last $r$ states are absorbing.
In Section 11.1, we saw that the entry $p_{ij}^{(n)}$ of the matrix $𝐏^n$ is the probability of being in the state $s_j$ after $n$ steps, when the chain is started in state $s_i$.
A standard matrix algebra argument shows that $𝐏^n$ is of the form

$𝐏^n = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c}
\text{TR.} & \text{ABS.}
\end{array} \\
\begin{array}{c}
\text{TR.} \\[10pt] \text{ABS.}
\end{array}\hspace{-0.8em} &
\left(
\begin{array}{c | c}
\;𝐐^n\; & \;∗\; \\[15pt]
\hline
𝟎 & 𝐈
\end{array}
\right) \\
\end{array}$

where the asterisk ∗ stands for the $t$-by-$r$ matrix in the upper right-hand corner of $𝐏^n$.
(This submatrix can be written in terms of $𝐐$ and $𝐑$, but the expression is complicated and is not needed at this time.)
The form of $𝐏^n$ shows that the entries of $𝐐^n$ given the probabilities for being in each of the transient states after $n$ steps for each possible transient starting state.
For our first theorem we prove that the probability of being in the transient states after $n$ steps approaches zero.
Thus every entry of $𝐐^n$ must approach zero as $n$ approaches infinity (i.e., $𝐐 → 𝟎$).
"""

# ╔═╡ 646fe224-7f05-4fc4-917f-ef64227ea360
md"### Probability of Absorption"

# ╔═╡ e984df6c-d82f-484e-a25e-e8313b9c2be8
md"""
**Theorem 11.3**
In an absorbing Markov chain, the probability that the process will be absorbed is 1 (i.e., $𝐐^n → 𝟎$ as $n → ∞$).
"""

# ╔═╡ 26c3c3cc-b732-47d7-923a-185b957e5c17
md"### The Fundamental Matrix"

# ╔═╡ 6e9313dc-953d-4e75-895e-062197e46c66
md"""
**Theorem 11.4**
For an absorbing Markov chain the matrix $𝐈 - 𝐐$ has an inverse $𝐍$ and $𝐍 = 𝐈 + 𝐐 + 𝐐^2 + ⋯$.
The $ij$-entry $n_{ij}$ of the matrix $𝐍$ is the expected number of times the chain is in state $s_j$, given that it starts in state $s_i$.
The initial state is counted if $i = j$.
"""

# ╔═╡ 0403f5d9-6686-41f8-8a84-314315545f81
md"""
**Definition 11.3**
For an absorbing Markov chain $𝐏$, the matrix $𝐍 = (𝐈 - 𝐐)^{-1}$ is called the **fundamental matrix** for $𝐏$.
The entry $n_{ij}$ of $𝐍$ gives the expected number of times that the process is in the transient state $s_j$ if it is started in the transient state $s_j$.
"""

# ╔═╡ 690e18e2-aea0-44a4-a05d-ccf3018efacc
md"### Time to Absorption"

# ╔═╡ daf0573f-7106-4ee7-998e-ceb42cb6b128
md"""
**Theorem 11.5**
Let $t_i$ be the expected number of steps before the chain is absorbed, given that the chain starts in state $s_i$, and let $𝐭$ be the column vector whose $i$th entry is $t_i$.
Then

$𝐭 = 𝐍𝐜$

where $𝐜$ is a column vector all of whose entries are 1.
"""

# ╔═╡ 2dbc3052-da03-4af9-b339-01c2de982963
md"### Absorption Probabilities"

# ╔═╡ 618dab80-7411-4814-a38e-6aaa8beabcce
md"""
**Theorem 11.6**
Let $b_{ij}$ be the probability that an absorbing chain will be absorbed in the absorbing state $s_j$ if it starts in the transient state $s_i$.
Let $𝐁$ be the matrix with entries $b_{ij}$.
Then $𝐁$ is an $t$-by-$r$ matrix, and

$𝐁 = 𝐍𝐑\;,$

where $𝐍$ is the fundamental matrix and $𝐑$ is as in the canonical form.
"""

# ╔═╡ 1af31c96-5cae-4653-ba92-ced4720d9e5e
md"## Ergodic Markov Chains"

# ╔═╡ 2ab488c1-d60d-4cff-bbae-9e7a51301c8b
md"""
**Definition 11.4**
A Markov chain is called an **ergodic** chain if it is possible to go from every state to every state (not necessarily in one move).

In many books, ergodic Markov chains are called **irreducible**.
"""

# ╔═╡ dfa2ca09-3c58-452b-b1e6-9719c955135b
md"""
**Definition 11.5**
A Markov chain is called a **regular** chain if some power of the transition matrix has only positive elements.

In other words, for some $n$, it is possible to go from any state to any state in exactly $n$ steps.
It is clear from this definition that every regular chain is ergodic.
On the other hand, an ergodic chain is not neccessarily regular, as the following examples show.
"""

# ╔═╡ 47acac05-a803-4440-8be1-689d75b18ea8
md"### Regular Markov Chains"

# ╔═╡ 58654b0d-ece1-4bf9-9d02-5f668ee34c51
md"""
**Theorem 11.7**
Let $𝐏$ be the transition matrix for a regular chain.
Then, as $n → ∞$, the powers $𝐏^n$ approach a limiting matrix $𝐖$ with all rows the same vector $𝐰$.
The vector $𝐰$ is a strictly positive probability vector (i.e., the components are all positive and they sum to one).
"""

# ╔═╡ 72f92e85-a2f6-4bc3-a975-a3558ee570af
md"""
**Theorem 11.8**
Let $𝐏$ be a regular transition matrix, let

$𝐖 = \lim_{n → ∞} 𝐏^n\;,$

let $𝐰$ be the common row of $𝐖$, and let $𝐜$ be the column vector all of whose components are 1.
Then

(a) $𝐰𝐏 = 𝐰$, and any row vector $𝐯$ such that $𝐯𝐏 = 𝐯$ is constant multiple of $𝐰$.

(b) $𝐏𝐜 = 𝐜$, and any column vector $𝐱$ such that $𝐏𝐱 = 𝐱$ is a multiple of $𝐜$.
"""

# ╔═╡ 506edb2b-946c-4357-a60e-365d8ae0e11c
md"### Fixed Vectors"

# ╔═╡ a1454bf0-31f4-4bbe-92b2-523345df5107
md"""
**Definition 11.6** A row vector $𝐰$ with the property $𝐰𝐏 = 𝐰$ is called a **fixed row vector** for $𝐏$.
Similarly, a column vector $𝐱$ such that $𝐏𝐱 = 𝐱$ is called a **fixed column vector** for $𝐏$.
"""

# ╔═╡ ead083f8-e633-4b3d-bb7e-9ac2a21f6528
md"""
**Theorem 11.9**
Let $𝐏$ be the transition matrix for a regular chain and $𝐯$ an arbitrary probability vector.
Then

$\lim_{n → ∞} 𝐯𝐏^n = 𝐰\;,$

where $𝐰$ is the unique fixed probability vector for $𝐏$.
"""

# ╔═╡ 8dfe47d8-5a82-45a1-b8c5-89ac385fd8be
md"### Equilibrium"

# ╔═╡ 23df820c-c4d9-45d5-a674-eaf8ca7d4e44
md"""
**Theorem 11.10**
For an ergodic Markov chain, there is a unique probability vector $𝐰$ such that $𝐰𝐏 = 𝐰$ and $𝐰$ is strictly positive.
Any row vector such that $𝐯𝐏 = 𝐯$ is a multiple of $𝐰$.
Any column vector $𝐱$ such that $𝐏𝐱 = 𝐱$ is a constant vector.
"""

# ╔═╡ f045b7e5-1ec1-493d-86a1-6620d8ec1a56
md"""
**Theorem 11.11**
Let $𝐏$ be the transition matrix for an ergodic chain.
Let $𝐀_n$ be the matrix defined by

$𝐀_n = \frac{𝐈 + 𝐏 + 𝐏^2 + ⋯ + 𝐏^n}{n + 1}\;.$

Then $𝐀_n → 𝐖$, where $𝐖$ is a matrix all of whose rows are equal to the unique fixed probability vector $𝐰$ for $𝐏$.
"""

# ╔═╡ 96cbfe8f-e353-443e-bd70-095c06b36e3d
md"""
**Theorem 11.12 (Law of Large Numbers for Ergodic Markov Chains)**
Let ${H_j}^{(n)}$ be the proportion of times in $n$ steps that an ergodic chain is in state $s_j$.
Then for any $\epsilon > 0$,

$P\left(\left|{H_j}^{(n)} - w_j\right| > \epsilon\right) → 0\;,$

independent of the starting state $s_i$.
"""

# ╔═╡ 6e37625e-e0e2-4a35-89b6-c681fa0ec2df
md"## Fundamental Limit Theorem for Regular Chains"

# ╔═╡ f15cafd1-3199-4383-9652-2814f08df654
md"""
**Lemma 11.1**
Let $𝐏$ be an $r$-by-$r$ transition matrix with no zero entries.
Let $d$ be the smallest entry of the matrix.
Let $𝐲$ be a column vector with $r$ components, the largest of which is $M_0$ and the smallest $m_0$.
Let $M_1$ and $m_1$ be the largest and smallest component, respectively, of the vector $𝐏𝐲$.
Then

$M_1 - m_1 ≤ (1 - 2d)(M_0 - m_0).$
"""

# ╔═╡ 5c8bcaf8-04e3-417a-96de-ff8de3051b89
md"""
**Theorem 11.13 (Fundamental Limit Theorem for Regular Chains)**
If $𝐏$ is the transition matrix for a regular Markov chain, then

$\lim_{n → ∞} 𝐏^n = 𝐖\;,$

where $𝐖$ is a matrix with all rows equal.
Furthermore, all entries in $𝐖$ are strictly positive.
"""

# ╔═╡ cea8b8a6-e53f-4db3-a808-6cdac3616916
md"### Doeblin's Proof"

# ╔═╡ 206b46eb-39fa-4038-804e-134c4c293c7d
md"""
**Theorem 11.14**
Let $𝐏$ be the transition matrix for a regular Markov chain with fixed vector $𝐰$.
Then for any initial probability vector $𝐮$, $𝐮𝐏^n → 𝐰$ as $n → ∞$.
"""

# ╔═╡ e8ea3e55-dbb5-458b-9ca2-61c1b0e54e82
md"""
## Mean First Passage Time for Ergodic Chains

In this section we consider two closely related descriptive quantities of interest for ergodic chains: the mean time to return to a state and the mean time to go from one state to another state.

Let $𝐏$ be the transition matrix of an ergodic chain with states $s_1, s_2, …, s_r$.
Let $𝐰 = (w_1, w_2, …, w_r)$ be the unique probability vector such that $𝐰𝐏 = 𝐰$.
Then, by the Law of Large Numbers for Markov chains, in the long run the process will spend a fraction $w_j$ of the time in state $s_j$.
Thus, if we start in any state, the chain will eventually reach state $s_j$; in fact, it will be in state $s_j$ infinitely often.

Another way to see this is the following:
Form a new Markov chain by making $s_j$ an absorbing state, that is, define $p_{jj} = 1$.
If we start at any state other than $s_j$, this new process will behave exactly like the original chain up to the first time that state $s_j$ is reached.
Since the original chain was an ergodic chain, it was possible to reach $s_j$ from any other state.
Thus the new chain is an absorbing chain with a single absorbing state $s_j$ that will eventually be reached.
So if we start the original chain at a state $s_i$ with $i ≠ j$, we will eventually reach the state $s_j$.

Let $𝐍$ be the fundamental matrix for the new chain.
The entries of $𝐍$ give the expected number of times in each state before absorption.
In terms of the original chain, these quantities give the expected number of times in each of the states before reaching state $s_j$ for the first time.
The $i$th component of the vector $𝐍𝐜$ gives the expected number of steps before absorption in the new chain, starting in state $s_i$.
In terms of the old chain, this is the expected number of steps required to reach state $s_j$ for the first time starting at state $s_i$.
"""

# ╔═╡ ac792e3a-707a-4501-bd58-eeada73e4c33
md"### Mean First Passage Time"

# ╔═╡ a5761a7c-3a20-4052-9f4e-1c9b9805cc3d
md"""
**Definition 11.7**
If an ergodic Markov chain is started in state $s_i$, the expected number of steps to reach state $s_j$ for the first time is called the **mean first passage time** from $s_i$ to $s_j$.
It is denoted by $m_{ij}$.
By convention $m_{ii} = 0$.
"""

# ╔═╡ 4e8d3f85-b78a-42e4-8114-d6ef5dc6f195
md"""
### Mean Recurrence Time

A quantity that is closely related to the mean first passage time is the *mean recurrence time*, defined as follows.
Assume that we start in state $s_i$; consider the length of time before we return to $s_i$ for the first time.
It is clear that we must return, since we either stay at $s_i$ the first step or go to some other state $s_j$, and from any other state $s_j$, we will eventually reach $s_i$ because the chain is ergodic.
"""

# ╔═╡ b5ce8959-a60e-4376-9b40-85ea00fffc9a
md"""
**Definition 11.8**
If an ergodic Markov chain is started in state $s_i$, the expected number of steps to return to $s_i$ for the first time is the **mean recurrence time** for $s_i$.
It is denoted by $r_i$.
"""

# ╔═╡ 959081ab-2d61-44c5-bec3-2b17f9b3c9fc
md"""
We need to develop some basic properties of the mean first passage time.
Consider the mean first passage time from $s_i$ to $s_j$; assume that $i ≠ j$.
This may be computed as follows: take the expected number of steps required given the outcome of the first step, multiply by the probability that this outcome occurs, and add.
If the first step is to $s_j$, the expected number of steps required is 1; if it is some other state $s_k$, the expected number of steps required is $m_{kj}$ plus 1 for the step already taken.
Thus,

$m_{ij} = p_{ij} + \sum_{k ≠ j} p_{ik} (m_{kj} + 1) \;,$

or, since $\sum_k p_{ik} = 1$,

$m_{ij} = 1 + \sum_{k ≠ j} p_{ik} m_{kj} \;.$

Similarly, starting in $s_i$, it must take at least one step to return.
Considering all possible first steps gives us

$\begin{align*}
r_i &= \sum_k p_{ik} (m_{ki} + 1) \\
&= 1 + \sum_k p_{ik} m_{ki}\;.
\end{align*}$
"""

# ╔═╡ ffed35ee-eb38-40cf-b63d-758d66d07e03
md"### Mean First Passage Matrix and Mean Recurrence Matrix"

# ╔═╡ 127fe5cd-efe0-49b7-8e0c-b3922db383cc
md"""
**Theorem 11.15**
For an ergodic Markov chain, the mean recurrence time for state $s_i$ is $r_i = 1/w_i$, where $w_i$ is the $i$th component of the fixed probability vector for the transition matrix.
"""

# ╔═╡ 5b8f6e0a-3be6-4be9-acac-2569245aae1d
md"""
**Corollary 11.1**
For an ergodic Markov chain, the components of the fixed probability vector $𝐰$ are strictly positive.
"""

# ╔═╡ 0534c407-ccc0-4a34-9de4-d8c2a08faf24
md"### Fundamental Matrix"

# ╔═╡ 76f2acfa-fc09-4e87-bc83-0cb1a912b46f
md"""
**Proposition 11.1**
Let $𝐏$ be the transition matrix of an ergodic chain, and let $𝐖$ be the matrix all of whose rows are the fixed probability row vector for $𝐏$.
Then the matrix

$𝐈 - 𝐏 + 𝐖$

has an inverse.
"""

# ╔═╡ be7152f4-25f3-44a7-8ae9-23c5ee1910af
md"### Using the Fundamental Matrix to Calculate the Mean First Passage Matrix"

# ╔═╡ 9b30db6a-6318-4d0d-a238-6ef9a896ca0e
md"""
**Lemma 11.2** Let $𝐙 = (𝐈 - 𝐏 + 𝐖)^{-1}$, and let $𝐜$ be a column vector for all 1's.
Then

$\begin{align*}
𝐙𝐜 &= 𝐜\;, \\
𝐰𝐙 &= 𝐰\;,
\end{align*}$

and

$𝐙(𝐈 - 𝐏) = 𝐈 - 𝐖.$
"""

# ╔═╡ d0046c4c-d4b0-40c7-817f-acb501b98bda
md"# Random Walks"

# ╔═╡ c492e0a6-42f1-4c89-950e-36ff6553851b
md"""
## Random Walks in Euclidean Space

In the last several chapters, we have studied sums of random variables with the goal being to describe the distribution and density functions of the sum.
In this chapter, we shall look at sums of discrete random variables from a different perspective.
We shall be concerned with properties which can be associated with the sequence of partial sums, such as the number of sign changes of this sequence, the number of terms in the sequence which equal 0, and the expected size of the maximum term in the sequence.
"""

# ╔═╡ b5f9a527-3829-4ca4-a419-d2eb610114fb
md"""
**Definition 12.1**
Let $\{X_k\}_{k=1}^∞$ be a sequence of independent, identically distributed discrete random variables.
For each positive integer $n$, we let $S_n$ denote the sum $X_1 + X_2 + ⋯ + X_n$.
The sequence $\{S_n\}_{n = 1}^∞$ is called a **random walk**.
If the common range of the $X_k$'s is $𝐑^m$, then we say that $\{S_n\}$ is a random walk in $𝐑^m$.
"""

# ╔═╡ 4e37e8c4-ee1d-4ee7-b52d-3b8deb2cf248
md"""
### Random Walks on the Real Line

We shall first consider the simplest non-trivial case of a random walk in $𝐑^1$, namely the case where the common distribution function of the random variables $X_n$ is given by

$f_X(x) = \begin{cases} 1/2, &\text{if } x = ±1, \\ 0, &\text{otherwise.} \end{cases}$

This situation corresponds to a fair coin being flipped, with $S_n$ representing the number of heads minus the number of tails which occur in the first $n$ flips.
We note that in this situation, all paths of length $n$ have the same probability, namely $2^{-n}$.

It is sometimes instructive to represent a random walk as a polygonal line, or path, in the plane, where the horizontal axis represents time and the vertical axis represents the value of $S_n$.
Given a sequence $\{S_n\}$ of partial sums, we first plot the points $(n, S_n)$, and then for each $k < n$, we connect $(k, S_k)$ and $(k + 1, S_{k + 1})$ with a straight line segment.
The *length* of a path is just the difference in the time values of the beginning and ending points on the path.
The reader is referred to Figure 12.1.
This figure, and the process it illustrates, are identical with the example, given in Chapter 1, of two people playing heads or tails.
"""

# ╔═╡ 026ab83c-5e17-4b31-b3e6-a7cb31b01379
md"""
### Returns and First Returns

We say that an **equalization** has occurred, or there is a **return to the origin** at time $n$, if $S_n = 0$.
We note that this can only occur if $n$ is an even integer.
To calculate the probability of an equalization at time $2m$, we need only count the number of paths of length $2m$ which begin and end at the origin.
The number of such paths is clearly

$\begin{pmatrix} 2m \\ m \end{pmatrix}\;.$

Since each path has probability $2^{-2m}$, we have the following theorem.
"""

# ╔═╡ 6e727e00-b282-4111-be0a-374211033ada
md"""
**Theorem 12.1**
The probability of a return to the origin at time $2m$ is given by

$u_{2m} = \begin{pmatrix} 2m \\ m \end{pmatrix} 2^{-2m}\;.$

The probability of a return to the origin at an odd time is 0.
"""

# ╔═╡ c2f64785-c945-4d21-a22d-03bd25ac9c3a
md"""
**Theorem 12.2**
For $n ≥ 1$, the probabilities $\{u_{2k}\}$ and $\{f_{2k}\}$ are related by the equation

$u_{2n} = f_0 u_{2n} + f_2 u_{2n - 2} + ⋯ + f_{2n} u_0\;.$
"""

# ╔═╡ 16004e75-de98-416e-a656-09c5fbc43eac
md"""
**Theorem 12.3**
For $m ≥ 1$, the probability of a first return to the origin at time $2m$ is given by

$f_{2m} = \frac{u_{2m}}{2m - 1} = \frac{\begin{pmatrix} 2m \\ m \end{pmatrix}}{(2m - 1) 2^{2m}}\;.$
"""

# ╔═╡ 4f01d3a3-bbb3-4616-be00-2893bfb0ba1c
md"""
**Proof.**
We begin by defining the generating functions

$U(x) = \sum_{m = 0}^∞ u_{2m} x^m$

and

$F(x) = \sum_{m = 0}^∞ f_{2m} x^m\;.$

Theorem 12.2 says that

$U(x) = 1 + U(x) F(x) \;.$

(The prescence of the 1 on the right-hand side is due to the fact that $u_0$ is defined to be 1, but Theorem 12.2 only holds for $m ≥ 1$.)
We note that both generating functions certainly converge on the interval $(-1, 1)$, since all of the coefficients are at most 1 in absolute value.
Thus, we can solve the above equation for $F(x)$, obtaining

$F(x) = \frac{U(x) - 1}{U(x)}\;.$

Now, if we can find a closed-form expression for the function $U(x)$, we will also have a closed-form expression for $F(x)$.
From Theorem 12.1, we have

$U(x) = \sum_{m = 0}^∞ \begin{pmatrix} 2m \\ m \end{pmatrix} 2^{-2m} x^m\;.$

In Wilf, we find that

$\frac{1}{\sqrt{1 - 4x}} = \sum_{m = 0}^∞ \begin{pmatrix} 2m \\ m \end{pmatrix} x^m \;.$

The reader is asked to prove this statement in Exercise 1.
If we replace $x$ by $x/4$ in the last equation, we see that

$U(x) = \frac{1}{\sqrt{1 - x}}\;.$

Therefore, we have

$\begin{align*}
F(x) &= \frac{U(x) - 1}{U(x)} \\
&= \frac{(1 - x)^{-1/2} - 1}{(1 - x)^{-1/2}} \\
&= 1 - (1 - x)^{1/2}\;.
\end{align*}$

Although it is possible to compute the value of $f_{2m}$ using the Binomial Theorem, it is easier to note that $F'(x) = U(x)/2$, so that the coefficients $f_{2m}$ can be found by integrating the series for $U(x)$.
We obtain, for $m ≥ 1$,

$\begin{align*}
f_{2m} &= \frac{u_{2m - 2}}{2m} \\
&= \frac{\begin{pmatrix} 2m - 2 \\ m - 1 \end{pmatrix}}{m2^{2m - 1}} \\
&= \frac{\begin{pmatrix} 2m \\ m \end{pmatrix}}{(2m - 1)2^{2m}} \\
&= \frac{u_{2m}}{2m - 1}\;,
\end{align*}$

since

$\begin{pmatrix} 2m - 2 \\ m -1 \end{pmatrix} = \frac{m}{2(2m - 1)} \begin{pmatrix} 2m \\ m \end{pmatrix}$
"""

# ╔═╡ c4d7fdad-f860-48fa-9f1f-aec88b435241
md"""
### Expected Number of Equalizations

We now give another example of the use of generating functions to find a general formula for terms in a sequence, where the sequence is related by recursion relations to other sequences.
Exercise 9 gives still another example.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.9"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "438d35d2d95ae2c5e8780b330592b6de8494e779"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.3"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─9fe2e52a-3799-4114-9edf-7f868e22a7a8
# ╟─dd23f536-0508-11ec-2b9f-c3a3a78d10ee
# ╟─82a181be-ff30-4f69-a0b5-b4dfe4611f3c
# ╟─2b355d3d-7f89-4e95-8f52-25f85075c85f
# ╟─f6779fe6-866c-4984-b91f-d9d74bb6c6ee
# ╟─46db4c31-dcb7-415d-a0ca-5ddf7e0e376d
# ╟─cec5dbc1-2b36-45ba-9e04-3da64c455e20
# ╟─1ccb44cc-820d-440c-ae22-13b7607c7ee3
# ╟─6a09f4e6-99ce-4d8d-8781-af1f3239210a
# ╟─3a0e2c2f-2b39-4063-9606-9bec08be4ba8
# ╟─b5f70ea8-5073-4f6d-bb49-caf55e8fa2c1
# ╟─4bfdaf1a-8996-4755-ba9a-2e4639e2cf84
# ╟─4ec894b9-8632-4fec-b43d-4ca71db7248b
# ╟─f5fcc371-034f-4980-899a-2abd4142a659
# ╟─cf031b68-a870-420e-a6a8-9d9e0a2b45b4
# ╟─bfe8d31f-cf90-4935-9289-2884d58f9869
# ╟─c2e04ff7-41a4-4f95-9715-7ab0793c8597
# ╟─79103f5d-3d2b-4368-b08a-999b962ee486
# ╟─d05248bb-1206-48b3-b814-77ebc0d16cb3
# ╟─193bad7e-40ff-4eec-8262-2da7ffd3a86e
# ╟─9e0df1bb-3667-4702-9967-c25dc07b9073
# ╟─128bc4d1-fb28-4711-979f-6d6d8a1fd136
# ╟─5cbae973-9a8b-4ee4-8bb3-ece68591aa35
# ╟─a0d80aff-8c1b-4a68-84d1-1f8aeb161491
# ╟─66496486-3b18-4787-828c-6a165319fbfa
# ╟─22e16f89-e290-4260-aaaa-118eb8c39476
# ╟─25dff36a-999f-4f52-be31-167bc8aa0ed2
# ╟─fa33dca8-fc59-4adb-9d48-b233fdd84334
# ╟─edbe8780-2ffa-4679-a08b-6d1e416547ea
# ╟─72e91e76-70ef-49e7-91a3-1995d133ef4c
# ╟─da89b98c-f941-429a-bc4e-9eaf223dd332
# ╟─dad0493d-37dd-4512-85e2-54a27831badf
# ╟─7ac5c2ec-07ef-4e4b-9bdc-dc438f3eead3
# ╟─a0faf2af-f514-4343-a796-eb5b412c6d2d
# ╟─3d35debf-1b2b-4b65-a873-b94220e62f98
# ╟─d3358b38-d6d2-4341-a57e-d59330eb8927
# ╟─78cb001f-2b0a-494a-b326-b894ca8cd944
# ╟─8d2638cf-e29c-4c32-ad54-ca0864e930d4
# ╟─f97ebcc4-e1c6-4ae4-9dbc-565214573939
# ╟─43032cb2-8a03-4b8c-b7b6-f2c994cbefe3
# ╟─0742718e-61dc-40be-a98f-bcddd9bb8ad2
# ╟─6407ba06-bd24-4e4f-9a83-39e613febb00
# ╟─643cf8d7-6c23-40bc-899f-6f8c771c3c99
# ╟─68723805-d5d2-420a-9640-ee2cfffc6121
# ╟─931a5791-bdeb-406d-aa99-19fe2b6636ca
# ╟─94bc9dbe-819b-4cd1-a024-1de897b86ed3
# ╟─ee252fb6-07a2-4677-9b07-cad07441ca65
# ╟─cb4b7a79-a8de-4d0e-82c0-9897a7ae1805
# ╟─62cdb58a-47c0-46c1-89c1-b42f7181f073
# ╟─5e6bf12d-bf4a-48dd-b203-3feea3bd4423
# ╟─e2f90b08-c9fa-43ae-9440-c16647de3f9d
# ╟─12bb67f2-e0ff-42c1-b13f-524939c9aa0a
# ╟─1c44ff18-2e90-4613-997c-ea05323dc863
# ╟─07f31d7b-2306-4406-a9b9-7316257a680e
# ╟─45b3854c-d3df-4071-9a7b-8980c765878b
# ╟─e6a3a9c3-a444-4277-a428-9777805aa6ca
# ╟─46006b03-09e6-4afc-8e2a-4e3a379a71fd
# ╟─b963fe00-9b73-467e-b7c0-6522c5d47bb7
# ╟─caf16939-ba11-4b72-acec-edb5d5d13e96
# ╟─ce8e9eda-725f-45d0-af58-db7263d3da34
# ╟─9514cd39-4d20-445e-bd94-653f63812076
# ╟─68e14024-997f-40da-97c8-a6c0f3a5a34e
# ╟─97577267-ef80-472f-adbf-82ace77a22e3
# ╟─f578ce39-5339-4f85-8bf1-e085aa5549bd
# ╟─8cd10579-ca63-4050-b930-feed9c7e363e
# ╟─3003de01-25b7-4c20-9bae-cf15e5ac293c
# ╟─1cd2fedd-1a66-47f4-b210-c94fc7139bad
# ╟─202ca2bb-ff31-4fbd-823f-bae32b2c04bd
# ╟─8ee6ec51-c913-4da0-880a-d0b9186ddd15
# ╟─cf1c9973-2171-42fd-add0-130119d27350
# ╟─0de32014-d56e-42c2-8b9e-6ee40241bd35
# ╟─6cd68551-0a46-4158-82f6-d09f46dbf1a9
# ╟─4b6cfec7-e827-45bf-9d62-66aaa897aa72
# ╟─290063be-29b7-40f4-b98f-b44eaa5da9b8
# ╟─8555fbb1-153b-4a15-9f89-1b4260d62997
# ╟─b161f584-1119-47f0-8e31-cffc7af7597f
# ╟─494cfd23-1f73-4764-9d41-da7b9a30e606
# ╟─583a3909-6038-456f-94d3-1e23b10a2516
# ╟─1ec2da3c-d538-4b2a-a64e-e0ccd28a05f7
# ╟─95e6ca0c-e652-4237-a379-e5a4980256eb
# ╟─5a0b6653-a799-4171-b56a-87b0610650c5
# ╟─5c79aa52-a014-4b0f-8a53-cb001576a51d
# ╟─73eab6a6-0d60-4a9f-9e7b-7acde9288676
# ╟─0d43a5f0-2838-43ad-bf00-36d55b667643
# ╟─17a0703a-9dae-486d-a8cc-6c033840470e
# ╟─4b901fdb-ee24-4b11-a483-192cac3f3607
# ╟─e98fd509-be00-49ab-807c-efbd1bf5f7d8
# ╟─767ba720-ff48-4b31-add8-90f42df4a56a
# ╟─bf0f36c5-a5e0-46d8-8761-6c07f98ea845
# ╟─5621fa53-5cac-4bf7-9b5b-24bdec03ca66
# ╟─47ffe7e2-4a80-46ff-865b-01ca1a5623e3
# ╟─02b6d8a0-9188-4613-9917-a1b6168dc187
# ╟─b91a3d13-236c-42a3-9686-5ddc75da4fd1
# ╟─fabcbf77-4280-4116-a835-275bec3d92c6
# ╟─50cca29a-31b3-4574-a670-135fee22f346
# ╟─1eb8550c-16b6-4646-a400-fb3c683254ae
# ╟─b655a85e-41d0-478e-bebc-018d4c809870
# ╟─77527bc9-271e-40b9-a10b-285622a01511
# ╟─fe582a32-2ed7-4802-bf80-5d0df742fa68
# ╟─75e1d5ac-64dc-4c9b-873a-ddcc94183b7a
# ╟─01522192-baa0-4ca0-847f-040aa4ad7e82
# ╟─dfa2bd8a-32f0-4318-b38e-e939785a79e7
# ╟─b257a2a6-0b48-4ab9-98e7-1827e081bad7
# ╟─9465f5aa-d445-4541-ba12-838879b68b5d
# ╟─3e0d134d-4687-4dae-9e88-4b949c65d917
# ╟─8d8f750d-eb5f-438d-8192-8586a075b993
# ╟─a40d9ee3-4d89-43e2-861c-3a4ed46ead0b
# ╟─babb35f4-8d2a-4d63-be6c-2f662a04c224
# ╟─12b4cff7-f982-4b20-9608-aac3c0c777db
# ╟─c0671fda-3dcb-4d8b-96dc-a93c05451c10
# ╟─3449343a-4b62-48fc-90c3-5d68b79677f1
# ╟─57892be6-cf7e-49d5-975e-411c1589ec56
# ╟─2e744a9d-dcde-408a-bd3d-e028ca80fc79
# ╟─3f9d7185-3cd8-44ba-8be1-7178b7eca1b8
# ╟─c55c937b-af4f-4e1e-a1ce-5e36a40e7c25
# ╟─21ca33b6-651e-403d-a60c-63dd61500efe
# ╟─58ad6422-4a46-4690-adc8-56a9bfef1836
# ╟─08d0570a-f89e-4cd7-ac2e-ca9e9e675f48
# ╟─101dc5b2-9ba4-4b2d-9329-da4870c43a26
# ╟─c07661f5-2f73-4ab4-a869-62fea3b411cd
# ╟─a52efb8b-e3e4-4fe9-be42-de5bc1a8a9cc
# ╟─3f9d6946-58ec-41a9-84b0-68062c8fd493
# ╟─03b6f961-cea4-4789-9f0a-be180dbd1260
# ╟─30071526-d9db-45a1-a4c9-c849affc4db5
# ╟─e0172ab9-bea3-482c-ba88-9cb2b0e73f43
# ╟─28c67142-8144-4080-9a3f-189d7e101905
# ╟─46c6e3de-aee0-442a-9930-088b420b9920
# ╟─07485eae-0aeb-4376-a1df-0b5570048a8c
# ╟─144aa479-27b8-497c-828c-6845e7eddd95
# ╟─26419c2b-431c-4459-bad7-f594038c53c4
# ╟─a254a25c-f8c8-40bd-988a-47cb313d4929
# ╟─cb0ddaf6-3e1d-4af4-8998-bb8b6c95145f
# ╟─ca29b486-6565-4b94-8ee9-636103969ff5
# ╟─944f8f83-bd8b-4d4e-b2ca-d0119e06e334
# ╟─4694a3cc-f728-4b8c-bc81-69933e89a574
# ╟─012a31ee-02f0-416b-a2e0-2955ca4f42f9
# ╟─b24a70d4-d778-4497-9da9-9b7fe6236c2b
# ╟─099cafe1-7702-4804-9f43-8c38a65790ea
# ╟─7493be31-f225-416c-bbe9-9d3ab8cd2658
# ╟─4d13debf-2fd3-4bb3-a0b1-29f6377beae3
# ╟─5f224667-e277-44e4-aef2-1c5cb9bb71e5
# ╟─4f0395d2-ef00-472e-8763-71c2e76b8699
# ╟─5f24ed38-100b-4aaa-8299-8367c33d031a
# ╟─3537d12a-9310-4afd-ab10-5c24013f2c63
# ╟─acdc80f2-faf4-4a06-ad81-0e40a3436e81
# ╟─bc0d47d6-6c49-422d-8d3a-8a5f0cf86ac7
# ╟─48cb0247-2081-40dc-ba4d-b2340acb2522
# ╟─f7ced716-0073-484d-8ded-dc110ac93f83
# ╟─a13a2cf0-ffea-471d-8455-dc31955db977
# ╟─f63049c9-1702-4b68-9b3c-2949bd5904a4
# ╟─7179db95-f6e4-45a1-9736-9a05afbdd02d
# ╟─1eab7ede-333c-4cdf-b08e-91768c474e0f
# ╟─23f413cf-9512-48e5-b204-68d6ec3f0ac2
# ╟─f07fc05c-6076-4e79-8e6d-402f2e898118
# ╟─a2b48b2e-b366-4182-b6fb-1877f7e12519
# ╟─9f944dbc-e38f-4cd1-9e6a-4b2693e77bf2
# ╟─ba271ab3-a938-4d91-ae2a-87785bcd39d5
# ╟─f04cfa4b-d9c0-456a-a5f1-60d6a36256b7
# ╟─7f71f08f-57cf-44a3-b08b-bd6e73eba44b
# ╟─c0f94ab1-2464-494d-b3eb-facc3018b673
# ╟─3e4a84c2-bc02-4770-b403-3cdb49c9e06f
# ╟─33261b7f-1b66-4441-ab77-cb519aa422d7
# ╟─354feeb2-4bb3-408c-a2d6-7b2f37d51de2
# ╟─ccf1a8a0-cbb4-412d-9451-4163c67c80f9
# ╟─f9968ce7-b06d-4d19-b748-6b134de65c94
# ╟─730c42e4-216a-4d19-87f6-088c628822d0
# ╟─cbd999ad-40e8-4439-9135-734fdcf14c5d
# ╟─b26e522b-96c7-46a5-9404-253ddad70afd
# ╟─9e664d0b-b1c1-4532-9dee-06cc0309093a
# ╟─8c39c8a9-e51a-4f48-bf88-50b4f1eb8a2a
# ╟─64ec4921-d8a5-4565-b2ec-69b929f3996d
# ╟─b3dbc2f8-6f22-42e9-a2fa-a3feecc51f5f
# ╟─7fc0d014-7373-4ef4-ae14-ed87463deb75
# ╟─ec7a90fc-25b8-433f-8210-2216c860a2c8
# ╟─592fcbec-ea6c-4ca2-943b-1eba037fa363
# ╟─c0ec1a83-8cb0-40d4-877c-966b796b33f2
# ╟─a5f6e1ad-ceb1-4eca-a1b3-de2b05a966ea
# ╟─8cc58368-232b-41db-8f79-cf394a615887
# ╟─c925c992-8532-4765-aed7-1bcd0a71ca16
# ╟─77f267f5-c14d-4d5a-872a-2e54311cdf72
# ╟─52178723-6311-4bf1-b42d-20e85adeeb1b
# ╟─50cefd0a-ac4e-4e55-a31f-d92cb365aca1
# ╟─71550f23-fc60-4be2-8579-0a944ec5a092
# ╟─88d47da4-b8ec-494b-bb62-cc36838eac9d
# ╟─43cb1285-c1cb-4594-8fdd-29499569e567
# ╟─6468c629-560f-4866-9c3d-96e9ff788bc8
# ╟─5b1d8dd2-8c02-45a7-9051-0421edc4efa9
# ╟─cd1c76dc-7419-4f64-947b-883a1e2e7691
# ╟─8c2dff98-2321-4b5d-822a-1e59af796a38
# ╟─ce41bd43-e77b-4fc1-86bd-cfe247754a67
# ╟─10bffa9a-025e-4be5-990f-9db4d2fca8bf
# ╟─8c1f3cb0-5f09-4bf6-b575-7ecd8bb51273
# ╟─a0094ad0-d25c-4b49-be3e-d4949d405797
# ╟─6a0050de-d47f-440d-b81e-2c94560cf9ec
# ╟─ba6f5c07-c500-4fa5-8059-97bd51888284
# ╟─c5e61ab7-b163-4368-9c67-34e3db58dff0
# ╟─6fe1c732-f77f-419c-bc4e-96674fbadf6e
# ╟─869637bc-7312-49ee-92e4-247d01f4d88d
# ╟─407e14e0-848d-440a-883a-046be2fa84b1
# ╟─4853b5f3-dec8-4e15-8758-49b47d7edf91
# ╟─592f94dd-827c-41d1-b07b-3c8ea9aa1a99
# ╟─a80e4eb7-031f-4a1b-9b2e-7b2bcfa5a087
# ╟─81cb09af-18fc-4771-8c4e-de40666ac10c
# ╟─29d443cf-f43e-4ac5-a95e-971442a6839d
# ╟─25c3aa30-a65d-489f-b1c9-83711acda1af
# ╟─ba02e5a9-bb65-4fdf-9ac1-5edd039877f7
# ╟─ded3aaa6-0726-4950-b354-d46ba030561c
# ╟─a06a74a8-97ba-4d5e-bb07-f42fd80fadae
# ╟─df1bd6ec-c5b2-46ce-a0ba-4276cad4e281
# ╟─36850972-f22f-4a11-a446-56d99b6fb196
# ╟─e89580f4-cfa2-4163-a130-fb2c93c4ba45
# ╟─c06493f9-c181-4e75-bebb-da8cab52495c
# ╟─3fd4b1f5-869d-4d65-9d7b-d30f7e463e88
# ╟─f2f5ed06-8a09-49b9-8fa8-e058052f99a2
# ╟─6a866197-9fdd-4a95-8c0e-d9a404a349af
# ╟─646fe224-7f05-4fc4-917f-ef64227ea360
# ╟─e984df6c-d82f-484e-a25e-e8313b9c2be8
# ╟─26c3c3cc-b732-47d7-923a-185b957e5c17
# ╟─6e9313dc-953d-4e75-895e-062197e46c66
# ╟─0403f5d9-6686-41f8-8a84-314315545f81
# ╟─690e18e2-aea0-44a4-a05d-ccf3018efacc
# ╟─daf0573f-7106-4ee7-998e-ceb42cb6b128
# ╟─2dbc3052-da03-4af9-b339-01c2de982963
# ╟─618dab80-7411-4814-a38e-6aaa8beabcce
# ╟─1af31c96-5cae-4653-ba92-ced4720d9e5e
# ╟─2ab488c1-d60d-4cff-bbae-9e7a51301c8b
# ╟─dfa2ca09-3c58-452b-b1e6-9719c955135b
# ╟─47acac05-a803-4440-8be1-689d75b18ea8
# ╟─58654b0d-ece1-4bf9-9d02-5f668ee34c51
# ╟─72f92e85-a2f6-4bc3-a975-a3558ee570af
# ╟─506edb2b-946c-4357-a60e-365d8ae0e11c
# ╟─a1454bf0-31f4-4bbe-92b2-523345df5107
# ╟─ead083f8-e633-4b3d-bb7e-9ac2a21f6528
# ╟─8dfe47d8-5a82-45a1-b8c5-89ac385fd8be
# ╟─23df820c-c4d9-45d5-a674-eaf8ca7d4e44
# ╟─f045b7e5-1ec1-493d-86a1-6620d8ec1a56
# ╟─96cbfe8f-e353-443e-bd70-095c06b36e3d
# ╟─6e37625e-e0e2-4a35-89b6-c681fa0ec2df
# ╟─f15cafd1-3199-4383-9652-2814f08df654
# ╟─5c8bcaf8-04e3-417a-96de-ff8de3051b89
# ╟─cea8b8a6-e53f-4db3-a808-6cdac3616916
# ╟─206b46eb-39fa-4038-804e-134c4c293c7d
# ╟─e8ea3e55-dbb5-458b-9ca2-61c1b0e54e82
# ╟─ac792e3a-707a-4501-bd58-eeada73e4c33
# ╟─a5761a7c-3a20-4052-9f4e-1c9b9805cc3d
# ╟─4e8d3f85-b78a-42e4-8114-d6ef5dc6f195
# ╟─b5ce8959-a60e-4376-9b40-85ea00fffc9a
# ╟─959081ab-2d61-44c5-bec3-2b17f9b3c9fc
# ╟─ffed35ee-eb38-40cf-b63d-758d66d07e03
# ╟─127fe5cd-efe0-49b7-8e0c-b3922db383cc
# ╟─5b8f6e0a-3be6-4be9-acac-2569245aae1d
# ╟─0534c407-ccc0-4a34-9de4-d8c2a08faf24
# ╟─76f2acfa-fc09-4e87-bc83-0cb1a912b46f
# ╟─be7152f4-25f3-44a7-8ae9-23c5ee1910af
# ╟─9b30db6a-6318-4d0d-a238-6ef9a896ca0e
# ╟─d0046c4c-d4b0-40c7-817f-acb501b98bda
# ╟─c492e0a6-42f1-4c89-950e-36ff6553851b
# ╟─b5f9a527-3829-4ca4-a419-d2eb610114fb
# ╟─4e37e8c4-ee1d-4ee7-b52d-3b8deb2cf248
# ╟─026ab83c-5e17-4b31-b3e6-a7cb31b01379
# ╟─6e727e00-b282-4111-be0a-374211033ada
# ╟─c2f64785-c945-4d21-a22d-03bd25ac9c3a
# ╟─16004e75-de98-416e-a656-09c5fbc43eac
# ╟─4f01d3a3-bbb3-4616-be00-2893bfb0ba1c
# ╟─c4d7fdad-f860-48fa-9f1f-aec88b435241
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
