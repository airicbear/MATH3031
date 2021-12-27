### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 4fd14263-e23a-40af-bd26-560a557d9958
begin
	using PlutoUI
	using StatsPlots
	using StatsBase
	using Turing
	using Distributions
	using Graphs
	using LinearAlgebra
	
	b(n,p,j) = binomial(n,j) * p^j * (1-p)^(n-j)
	
	md"# In-Class Notes"
end

# ╔═╡ 74bd45a0-a70d-41dc-a861-b58c3fcfea4d
md"""
### Simulation

**Probability of drawing the same card twice from a deck**

Number of trials: 
$(@bind num_trials NumberField(1:1000000, default=1000000))
$(@bind run_simulation Button("Run Simulation"))
"""

# ╔═╡ 738cd501-3ef5-47fe-9877-e9d7274dfc26
let
	run_simulation
	deck = repeat(1:13, 4)
	same_rank_count = 0
	MAX_ALLOWED = 10000000
	
	if 0 < num_trials < MAX_ALLOWED
		for i ∈ 1:num_trials
			card1, card2 = sample(deck, 2, replace = false)

			if card1 == card2
				same_rank_count += 1
			end
		end
		
		result = same_rank_count / num_trials

		md"""
		| Simulation                     | Actual  |
		|--------------------------------|---------|
		| $same_rank_count / $num_trials | 1 / 17  |
		| $result                        | $(1/17) |
		"""
	elseif num_trials >= MAX_ALLOWED
		md"""
		| Simulation | Actual  |
		|------------|---------|
		| OVERFLOW   | 1 / 17  |
		| OVERFLOW   | $(1/17) |
		"""
	else
		md"""
		| Simulation | Actual  |
		|------------|---------|
		| 0 / 0      | 1 / 17  |
		| 0.0        | $(1/17) |
		"""
	end
end

# ╔═╡ dcfd90f2-7166-4c32-b9b4-c9f5d6ea06e5
md"""
### Example

Flip a coin until it comes up H

$\Omega = \{1,2,3,\ldots\}$

$\begin{align*}
P(1) &= \frac{1}{2} \\

P(2) &= \frac{1}{4} \\

P(k) &= \frac{1}{2^k}
\end{align*}$
"""

# ╔═╡ 7747ba8e-6739-4735-a0c0-0f60d152320a
md"""
### Example

Pick a random integer

$\Omega = \{1,2,3,\ldots\}$
"""

# ╔═╡ 0d04dd73-578c-49f5-bc93-934a0484f877
md"""
Suppose $P(k) = c$, for any $k \in \Omega$

$\begin{align*}
P(\Omega) &= \sum_{\omega \in \Omega} P(\omega) \\
&= \sum_{k = 1}^{\infty} c \\
&= c \cdot \sum_{k = 1}^{\infty} 1
\end{align*}$


diverges if $c \neq 0$,
and if $c = 0$ then $P(\Omega) = 0$.

So, no uniform distribution makes sense!
"""

# ╔═╡ e3241831-8e6f-4113-9886-80a13ad9c24b
md"""
### Idea

Let $A \subset \Omega = \{1,2,3,\ldots\}$

Write $A(n) =$ # of elements of $A \leq n$.

**Define**

$P(A) = \lim_{n \to \infty} \frac{A(n)}{n}$ if the limit exists
"""

# ╔═╡ 3ef25269-1f20-4d06-8cd6-12497374a268
md"""
### Example

Pick a random real number in $[0,1)$

$\Omega = [0,1)$

$P\left(0 \leq x \leq \frac{1}{2}\right) = \frac{1}{2}$

$P(a \leq x \leq b) = b - a$
"""

# ╔═╡ 4d547011-5ab7-4fee-996d-79be10b9ea7e
md"""
### Define

**Probability density function**

$P(E) = \int_E f(x) \;dx$
"""

# ╔═╡ eada22fa-d2f6-42b1-9fad-f121bde7b4f2
let
	numtrials = 10000
	hitcount = 0
	
	for i ∈ 1:numtrials
		x = rand(Uniform())
		y = rand(Uniform())
		
		if 0.5 < x + y < 1.5
			hitcount += 1
		end
	end
	
	md"""
	### Example 2.14
	
	| Simulation              | Calculated |
	|-------------------------|------------|
	| $(hitcount / numtrials) | 0.75       |
	"""
end

# ╔═╡ d0f67f5b-e9f3-4ce0-bfa8-f7ebbd11eea8
md"""
### Example

How many subsets of a set of size $n$ are there?

---

For each element of the set we either choose to include or exclude that element.

So the total number of subsets is

$\underbrace{2 ⋅ 2 ⋅ 2 ⋯ 2}_{n \text{ times}} = 2^n \;.$
"""

# ╔═╡ cb4f684c-4716-46cf-b8c7-5dfa5f59e82b
md"""
### Observation

The number of subsets is equal to the number of subsets of size $n$ + the number of subsets of size $n - 1$, etc.
"""

# ╔═╡ 546840f0-757f-4a79-af85-dafa4bdb20bc
md"""
### Question

How many cards should we draw from a deck so that it's more likely than not to have drawn a pair?

Drawing 2 cards,

$P(\text{pair}) = \frac{3}{51}$

$P(\text{not a pair}) = \frac{48}{51}$

Drawing 3 cards,

$P(\text{not a pair}) = \frac{48}{51} ⋅ \frac{44}{50}$

Drawing 4 cards,

$P(\text{not a pair}) = \frac{48}{51} ⋅ \frac{44}{50} ⋅ \frac{40}{49}$

Drawing 5 cards,

$P(\text{not a pair}) = \frac{48}{51} ⋅ \frac{44}{50} ⋅ \frac{40}{49} ⋅ \frac{36}{48}$

Drawing 6 cards,

$P(\text{not a pair}) = \frac{48}{51} ⋅ \frac{44}{50} ⋅ \frac{40}{49} ⋅ \frac{36}{48} ⋅ \frac{32}{47}$

$P(\text{a pair}) = 1 - P(\text{not a pair}) ≈ 0.655$
"""

# ╔═╡ 6c12e369-5d92-4f2d-9e58-e86aef4ceaa4
md"""
### Definition

A **$k$-permutation** in a set of size $n$ is an ordered list of $k$ elements from the set.
"""

# ╔═╡ 2b928c78-326a-4359-8aee-47f2a5fb6b2b
md"""
### Example

Number of $k$-permutations of an $n$ set is equal to

$\underbrace{n ⋅ (n - 1) ⋅ (n - 2) ⋅ ⋯ ⋅ (n - k + 1)}_{k \text{ terms}} = \frac{n!}{(n - k)!}$
"""

# ╔═╡ dcca9c09-2477-4cf3-9ace-d3960da2647e
md"""
### The Division Principle

If $n$ objects can be divided into $d$ groups of size $k$ then

$d = \frac{n}{k}$
"""

# ╔═╡ 3fe4496b-77de-4f63-8d51-55da786f2d41
md"""
### Example

Count the number of $k$ permutations of an $n$-set.

The number of arrangements of $n$ things divided by the number of arrangments the $n - k$ things that we won't keep.

E.g., 10 books on a 6 book bookshelf: 4 things not kept, $\frac{10!}{4!}$
"""

# ╔═╡ bf93a4e4-fe01-49be-963b-b89200a58ecc
md"""
### Definition

$\begin{pmatrix} n \\ k \end{pmatrix} = \text{\# of } k\text{-element subsets in an } n\text{-element set}$
"""

# ╔═╡ b4441b33-13cd-48ae-b5ef-841f2b4c3404
md"""
### Example

$\begin{pmatrix} n \\ k \end{pmatrix} = \frac{n!}{(n - k)! \;k!}$

- ``(n - k)! :`` rearrange the $n - k$ discarded things
- ``k! :`` rearrange the $k$ kept things
"""

# ╔═╡ 18729755-5a19-4a63-8edc-cf73a8cf84c3
md"""
### Example

How many ways can the word PROBABILITY be rearranged?
"""

# ╔═╡ 9d745575-0b48-46db-bb25-88213fb5da40
factorial(length("PROBABILITY")) / (factorial(2) * factorial(2))

# ╔═╡ 672f02cd-d9ee-4f88-8ac0-0f31d825a7dd
md"""
### Program
"""

# ╔═╡ a09cb20f-2c46-4611-8051-b2a95df8d6c4
let
	hearts = [(:H, r) for r ∈ 1:13]
	clubs = [(:C, r) for r ∈ 1:13]
	diamonds = [(:D, r) for r ∈ 1:13]
	spades = [(:S, r) for r ∈ 1:13]
	
	deck = [hearts clubs diamonds spades]
end

# ╔═╡ 07f25a09-1726-40f8-a29c-4d3bb39501f9
md"""
### Example

What are the number of ways to create a flush?

- Choose suit: 4

- Choose 5 cards from that suit: $\begin{pmatrix} 13 \\ 5 \end{pmatrix}$

$4 ⋅ \begin{pmatrix} 13 \\ 5 \end{pmatrix}$
"""

# ╔═╡ 5d566dc2-cc91-4224-a800-a23a657aad23
4 * binomial(13, 5)

# ╔═╡ aa1be24e-e516-42de-8cd5-42a2a253a1a3
md"""
### Example

Suppose we have $n$ pieces of candy to distribute to $k$ children.
How many ways can we do it so that every kid gets at least 1 piece?

A framework: need $k - 1$ sticks to divide the candy,

$⋅ ⋅ ∣ ⋅ ∣ ⋅ ⋅ ∣ ⋅ ⋯ ⋅ \qquad n \text{ pieces of candy}$

How many ways can we pick $k - 1$ of the $n - 1$ spots between candies to put a dividing line?

$\begin{pmatrix} n - 1 \\ k - 1 \end{pmatrix}$
"""

# ╔═╡ 5f4aa98e-2a86-4e5a-9cdf-6e8b995384c3
md"""
### Example

What if not all kids need to get candy?

Consider $n + k - 1$ spots (considering both sticks and stones)

How many ways can we choose these spots to be sticks?

$\begin{pmatrix} n + k - 1 \\ k - 1 \end{pmatrix}$

How many ways can we choose these spots to be candy?

$\begin{pmatrix} n + k - 1 \\ n \end{pmatrix}$

In fact,

$\begin{pmatrix} n + k - 1 \\ k - 1 \end{pmatrix} = \begin{pmatrix} n + k - 1 \\ n \end{pmatrix}$
"""

# ╔═╡ a1f878da-60e3-4071-a37e-3a9f9504e189
md"""
### Example

$(x + y)(x + y) = x^2 + xy + yx + y^2 = x^2 + 2xy + y^2$

Coefficient of $x^k y^{n - k}$ in $(x + y)^n$ is $\begin{pmatrix} n \\ k \end{pmatrix}$

They are called binomial distributions because they are the coefficients when you expand a binomial such as $(x + y)^n$
"""

# ╔═╡ 7f6d0210-15dc-4ded-8acb-abff9a41ef8f
md"""
### Example

$\begin{align*}
(x+y)^4 &= \begin{pmatrix} 4 \\ 0 \end{pmatrix} y^4
+ \begin{pmatrix} 4 \\ 1 \end{pmatrix} xy^3
+ \begin{pmatrix} 4 \\ 2 \end{pmatrix} x^2y^2
+ \begin{pmatrix} 4 \\ 3 \end{pmatrix} x^3 y
+ \begin{pmatrix} 4 \\ 4 \end{pmatrix} x^4 \\
&= y^4 + 4xy^3 + 6x^2y^2 + 4x^3y + x^4
\end{align*}$
"""

# ╔═╡ cd021f2b-5f94-45a6-b7f4-893488639d79
md"""
### Binomial Theorem

$(x + y)^n = \sum_{k=0}^n \begin{pmatrix} n \\ k \end{pmatrix} x^k y^{n-k}$
"""

# ╔═╡ aa99031e-f015-4611-862d-af9f8c04238e
md"""
### Example

Proving that there are the same number of even subsets as there are odd subsets (in terms of number of elements)

$0 = ((-1) + 1)^n = \sum_{k=0}^n \begin{pmatrix} n \\ k \end{pmatrix} (-1)^k (1)^{n-k} = \begin{pmatrix} n \\ 0 \end{pmatrix} - \begin{pmatrix} n \\ 1 \end{pmatrix} + \begin{pmatrix} n \\ 2 \end{pmatrix} - \begin{pmatrix} n \\ 3 \end{pmatrix} + \begin{pmatrix} n \\ 4 \end{pmatrix}
- ⋯ ± \begin{pmatrix} n \\ n \end{pmatrix}$

$\begin{pmatrix} n \\ 1 \end{pmatrix} + \begin{pmatrix} n \\ 3 \end{pmatrix} +  \begin{pmatrix} n \\ 5 \end{pmatrix} + ⋯  = \begin{pmatrix} n \\ 0 \end{pmatrix} + \begin{pmatrix} n \\ 2 \end{pmatrix}  + \begin{pmatrix} n \\ 4 \end{pmatrix} + ⋯$
"""

# ╔═╡ 3cd4694a-3557-40b1-9e23-6c244f0dc1ca
md"""
### Definition

A **Bernoulli trial** is an experiment with two outcomes (success/failure).
If we perform such a trial with $P(\text{success}) = p$ and $P(\text{failure}) = q = 1 - p$ $\; n$ dependent times, then $b(n,p,k)$ is the probability of getting exactly $k$ successes.
"""

# ╔═╡ acc59503-608c-4296-a014-f4196cb2ba78
md"""
### Example

Flip a fair coin 10 times.

$P(5 \text{ heads}) = b(10, 0.5, 5) = \frac{\begin{pmatrix} 10 \\ 5 \end{pmatrix}}{2^{10}} ≈ 24.6\%$
"""

# ╔═╡ 60be6148-b310-4e9d-b409-587116bfdd56
b(10, 0.5, 5)

# ╔═╡ fd4bd85e-0a40-4d3b-ac17-2aab421a7e53
md"""
What if the coin is _not_ fair?

$\begin{align*}
P(H) &= p \\
P(T) &= q = 1 - p
\end{align*}$

For any 1 sequence with 5 H's and 5 T's, the probability of that outcome is $p^5 q^5$.

So $P(5 \text{ H's}) = \begin{pmatrix} 10 \\ 5 \end{pmatrix} p^5 q^5$.

Also: $P(7 \text{ H's}) = \begin{pmatrix} 10 \\ 7 \end{pmatrix} p^3 q^3$.

In general:

$b(n,p,k) = \begin{pmatrix} n \\ k \end{pmatrix} p^k q^{n-k}$
"""

# ╔═╡ 9e8e4ab9-df33-40ba-bbba-5252150ef7d3
md"""
### Observation

Suppose $P(H) = p$ and $P(T) = q = 1 - p$ then $P(HT) = P(TH) = pq$.
"""

# ╔═╡ 2d4a4881-1f82-46ca-bfc3-e652ebfe270f
md"""
### Definition

Given $E, F ⊆ Ω$ the **conditional probability** of $F$ given $E$ is

$P(F∣E) = \frac{P(F ∩ E)}{P(E)}$.
"""

# ╔═╡ 702200c3-061c-46a2-a2b8-25dd8308b71b
md"""
### Example

An urn contains 4 red and 6 green balls.
We draw a sample of 3 balls.

``A`` = we draw 2 red balls

``B`` = we draw ≥ 1 red ball

$P(B ∣ A) = 1$

Find $P(A ∣ B)$ using $A ⊆ B$

$P(A) = \frac{\begin{pmatrix} 4 \\ 2 \end{pmatrix} \begin{pmatrix} 6 \\ 1 \end{pmatrix}}{\begin{pmatrix} 10 \\ 3 \end{pmatrix}} = \frac{6 ⋅ 6}{120} = \frac{36}{120} = \frac{3}{10}$

$P(B) = 1 - P(\bar{B}) = 1 - \frac{\begin{pmatrix} 4 \\ 0 \end{pmatrix} \begin{pmatrix} 6 \\ 3 \end{pmatrix}}{\begin{pmatrix} 10 \\ 3 \end{pmatrix}} = 1 - \frac{1 ⋅ 20}{20} = \frac{5}{6}$

$P(A ∣ B) = \frac{P(A ∩ B)}{P(B)} = \frac{P(A)}{P(B)} = \frac{\frac{3}{10}}{\frac{5}{6}} = \frac{9}{25}$

**Note:** $|Ω| = \begin{pmatrix} 10 \\ 3 \end{pmatrix}$, and $Ω$ has uniform distribution, so:

$P(A ∩ B) = \frac{|A ∩ B|}{|Ω|}$

$P(B) = \frac{|B|}{|Ω|}$

So:

$P(A ∣ B) = \frac{P(A ∩ B)}{P(B)} = \frac{\frac{|A ∩ B|}{|Ω|}}{\frac{|B|}{|Ω|}} = \frac{|A ∩ B|}{|B|}$
"""

# ╔═╡ e5d63fb2-4269-421a-af62-cb251e944dad
md"""
### Definition

Events $E,F ⊆ Ω$ are called *independent* if

$P(E ∣ F) = P(E) \text{ and } P(F ∣ E) = P(F)$
"""

# ╔═╡ ee02b7b5-23ae-4e6d-9de0-f929bfe5d468
md"""
### Observation (Theorem)

If

$P(E ∣ F) = P(E)$

Then

$\frac{P(E ∩ F)}{P(F)} = P(E)$

So

$P(E ∩ F) = P(E) P(F)$
"""

# ╔═╡ f0c12aeb-caf4-4a31-87ac-289728d8c02f
md"""
### Example

Let $Ω = \{ w, x, y, z \}$

$P(y) = 0.3$

$P(z) = 0.1$

$A = \{x, y\}$

$B = \{y, z\}$

Find $P(w)$ and $P(x)$ if $A$, $B$ are independent.
"""

# ╔═╡ a783612e-80c3-4e94-8144-49785508752b
md"$P(w) + P(x) = 0.6$"

# ╔═╡ 8a77d3c9-6793-4984-b3a7-6670f64fa906
md"$P(x) = .45$"

# ╔═╡ 33cb0291-29bd-4c91-9e66-7723ba6dfeb8
md"$P(w) = .15$"

# ╔═╡ 9d3634a4-887e-4f29-ab37-e02ec36a7018
md"""
### Definition

If

$P(E ∩ F) < P(E) P(F)$

then $E,F$ are **negatively correlated**.

If

$P(E ∩ F) > P(E) P(F)$

then $E,F$ are **positively correlated**.
"""

# ╔═╡ 73d1be03-401a-418e-acda-67f9e377d45d
md"""
### Example

Flip 4 fair coins.

$A = \{\text{no two consecutive H's}\}$

$B = \{\text{1st and 2nd are the same}\}$

$C = \{\text{1st and 3rd ...}\}$

$D = \{\text{1st and 4th ...}\}$
"""

# ╔═╡ 74183c27-1dec-45ce-aa84-0e613ecc8143
md"""
### Bayes' Theorem

Given events $A$, $B$ such that $P(B) \neq 0$, we have

$P(A ∣ B) = \frac{P(B ∣ A) P(A)}{P(B)} = \frac{P(B ∣ A) P(A)}{P(B ∣ A) P(A) + P(B ∣ \bar{A}) P(\bar{A})}$
"""

# ╔═╡ 089bfad6-8407-4f40-bef9-f9a6fdee6e86
md"""
### Proof (Bayes' Theorem)

To see the first equality, notice that

$P(A ∣ B) = \frac{P(A ∩ B)}{P(B)}$

so multiplying both sides by $P(B)$ we have

$P(A ∣ B) P(B) = P(A ∩ B)\;.$

We also have

$P(B ∣ A) = \frac{P(A ∩ B)}{P(A)}$

and multiplying gives

$P(B ∣ A) P(A) = P(A ∩ B)\;.$

We have two expressions both equal to $P(A ∩ B)$, so we can set them equal to each other:

$P(A ∣ B) P(B) = P(B ∣ A) P(A)\;.$

Finally, divide both sides by $P(B)$ to get the first equality in the theorem:

$P(A ∣ B) = \frac{P(B ∣ A) P(A)}{P(B)} \;.$
"""

# ╔═╡ 58065c15-333d-4044-a666-1254d59b1f7b
md"""
The second equality in the theorem is really just a statement about the denominators, i.e., that

$P(B) = P(B ∣ A) P(A) + P(B ∣ \bar{A}) P(\bar{A}) \;.$

On the right hand side, note that

$P(B ∣ A) = \frac{P(B ∩ A)}{P(A)}$

and

$P(B ∣ \bar{A}) = \frac{P(B ∩ \bar{A})}{P(\bar{A})} \;.$

Substituting these quotients into the right hand side, we have:

$P(B ∣ A) P(A) + P(B ∣ \bar{A}) P(\bar{A}) = \frac{P(B ∩ A)}{P(A)} P(A) + \frac{P(B ∩ \bar{A})}{P(\bar{A})} P(\bar{A}) = P(B ∩ A) + P(B ∩ \bar{A})$

Finally, notice that every outcome in $B$ is either in $A$ or not in $A$, so the last expression in the previous line is equal to $P(B)$. ∎
"""

# ╔═╡ a9d58e9e-03f5-413a-a6a3-fbce6e717f73
md"""
### Definition

The *sensitivity* of a diagnostic test is the conditional probability of getting a positive result given that a person has a condition ($P(+ ∣ \text{condition})$).

The *specificity* of a diagnostic test is the conditional probability of getting a negative result given that a person does not have the condition ($P(- ∣ \text{not condition})$)

When you're at the doctor's office you're generally interested in the opposite conditional probabilities: $P(\text{condition} ∣ +)$ and $P(\text{not condition} ∣ -)$.
"""

# ╔═╡ 889cbadd-54a0-4fe7-8062-73b8e64d4045
md"""
### Bayes' Theorem

$\underbrace{P(H ∣ E)}_{\text{posterior}} = \frac{P(E ∣ H) P(H)}{P(E)} = \frac{P(E ∣ H) P(H)}{P(E ∣ H)\underbrace{P(H)}_{\text{prior}} + P(E ∣ \bar{H})P(\bar{H})}$
"""

# ╔═╡ 46473ebc-40bd-4406-a667-e5f4a5a81d33
md"""
### Example

- ``H`` = I have SARS-CoV-2
- ``E`` = I have a positive rapid test

$P(H ∣ E) = \frac{P(E ∣ H) P(H)}{\underbrace{P(E ∣ H)}_{\text{sensitivity}}P(H) + \underbrace{P(E ∣ \bar{H})}_{\text{false positive rate}}P(\bar{H})}$

- ``P(\bar{E} ∣ \bar{H})`` = Specificity = $1 - P(E ∣ \bar{H})$

- We have the sensitivity and the false positive rate, but what about the prior?
"""

# ╔═╡ a671fe7f-0ddb-4136-96ae-5d2f6735d5fa
md"""
### Program
"""

# ╔═╡ 4eca57d2-b3ee-4314-81c2-3b0c38e83904
function my_prob(sensitivity, specificity, prior)
	falsepositiverate = 1 - specificity
	return sensitivity * prior / (sensitivity * prior + falsepositiverate * (1 - prior))
end

# ╔═╡ 895646b1-6109-4498-b40f-29a8413cb247
let
	prior = my_prob(0.99, 0.90, 0.06)
end

# ╔═╡ 7ffb646b-7ea8-42e7-937b-aef5cd2cc013
let
	prior = my_prob(0.60, 0.99, 0.06)
end

# ╔═╡ 5214f0c7-fe6c-4ad0-8f37-72477102d37c
0.0594 / (0.0594 + 0.094)

# ╔═╡ 15d8d803-07db-4f6f-825c-06dafc4d7ef4
0.036 / (0.036 + 0.01 * 0.94)

# ╔═╡ f8ba2c86-c691-4266-a06c-0fd2fc80c0da
plot(x -> 1 - 0.02778753332580035x, xlims=[0,1])

# ╔═╡ 0b75eac8-13b1-4263-86b7-8b3c0bc202a1
let
	f = x -> 1 - 0.02778753332580035x
	f(0.7)
end

# ╔═╡ c79ca4a4-89ff-4bc7-a3be-bc147eb7f3e5
let
	prior = my_prob(0.58, 0.99, 0.027)
	prior = my_prob(0.58, 0.99, prior)
	prior = my_prob(0.58, 0.99, prior)
end

# ╔═╡ 82c03bd2-89df-42f7-a832-c14e52e0ec0d
md"""
### Example

- ``S`` = a particular email is spam
- ``H`` = a particular email is ham

We build a spam filter which is a list of words.
We've found that 90% of spam emails have at least two of these words.
Also, among ham emails, 80% do not have at least two filter words.
Let ``F`` = an incoming email has at least 2 filter words.
What is $P(S ∣ F)$?

$\begin{align*}
P(S ∣ F) &= \frac{P(F ∣ S)P(S)}{P(F ∣ S) P(S) + \underbrace{P(F ∣ \bar{S})}_{P(F ∣ H)} \underbrace{P(\bar{S})}_{P(H)}} \\
&= \frac{(0.9) P(S)}{(0.9) P(S) + (0.2) P(H)} \\
&= \frac{(0.9) P(S)}{(0.9) P(S) + (0.2) (1 - P(S))} \\
&= \frac{0.9P(S)}{0.9P(S) + 0.2 - 0.2P(S)} \\
\end{align*}$
"""

# ╔═╡ 51558f28-d3e8-48b1-b484-aaf000f9f1eb
my_prob(0.9, 0.8, 0.8)

# ╔═╡ d64ca3bc-8d1c-44bf-9380-9bee00870594
md"""
### Example

- ``B`` = coin is biased to come up heads 75% of the time

- ``E`` = 75 out of 100 flips come up heads

$P(B ∣ E) = \frac{P(E ∣ B) P(B)}{P(E ∣ B) P(B) + P(E ∣ \bar{B}) P(\bar{B})}$

This doesn't work! $P(B ∣ E) = 0$ since there are infinite possibilities of biases!
"""

# ╔═╡ 87341e1a-c742-4895-a207-7a133f499f0e
md"""
### Theorem

Let $\Omega$ be a continuous probability space with the uniform densitty.
Let $E ⊆ \Omega$, then probability of $E$ is

$\frac{\text{size}(E)}{\text{size}(\Omega)}$

If $F ⊆ \Omega$, then

$P(F ∣ E) = \frac{P(E ∩ F)}{P(E)}$
"""

# ╔═╡ a8080744-7f74-478f-bf98-6c598fca4ab4
md"""
### Example

``X, Y ∈ [0, 1]`` uniformly.

$P\left(Y ≤ X^2 ∣ X ≥ \frac{1}{2}\right)$
"""

# ╔═╡ be96b973-22b2-496f-bd8a-d82e4862c2a4
let
	plot(x->x^2, xlims=[0,1], ylims=[0,1], label=false, xticks=[0,1//2,1], yticks=[0,1//2,1])
	plot!(0.5:0.1:1,x->x^2, label=false, fillrange=0, fillalpha=0.5)
end

# ╔═╡ a8a4593d-8ed0-407b-9306-011d82cb9dd7
md"""
### Definition

If $\Omega$ is not uniform, then let $X$ be a real-valued continuous random variable with **probability density function** $f_X(x)$.

$P\left(a ≤ X ≤ b\right) = ∫_a^b f(x) \;dx$
"""

# ╔═╡ edad4144-5bec-4cfd-b1fe-7fdd45b302cc
md"""
### Definition

The **cumulative distribution function** for $X$ is $F_X(x)$ satisfying

$F_X(x) = P(X ≤ r) = ∫_{-∞}^r f(x) \;dx$
"""

# ╔═╡ b1fc24c7-ac2e-44f4-930b-7161541bfe6c
md"""
### Definition

If $E ⊆ \Omega$, then

$f(x ∣ E) = \begin{cases}
\frac{f(x)}{P(E)} &\text{if } x ∈ E \\
0 &\text{otherwise}
\end{cases}$

$P(F) = ∫_F f(x) \;dx$

$P(F ∣ E) = ∫_F f(x ∣ E) \;dx = ∫_{E ∩ F} \frac{f(x)}{P(E)} \;dx = \frac{1}{P(E)} ∫_{E ∩ F} f(x) \;dx = \frac{P(E ∩ F)}{P(E)}$

So

$P(F ∣ E) = \frac{P(E ∩ F)}{P(E)}$
"""

# ╔═╡ 301d5354-2fb9-4726-8230-76189a742139
md"""
### Definition

The **joint density function** and **joint cumulative distribution function** for $X$, $Y$

$\underbrace{F(r,s)}_{\text{joint cdf}} = P(X ≤ r, Y ≤ s) = ∫_{-∞}^r ∫_{-∞}^s \overbrace{f(x,y)}^{\text{joint pdf}} \;dy \;dx$
"""

# ╔═╡ 7772f73c-48d8-44d8-a810-9452520b9f35
md"""
### Example

Throw a dart at a unit circle so it lands randomly with uniform density.

Let $(X,Y)$ be the landing point.
Then

$f(x,y) = \begin{cases}
\frac{1}{\pi} &\text{if } (x,y) ∈ 1 \\
0 &\text{otherwise}
\end{cases}$

What is $f_X(x)$?

$\begin{align*}
\underbrace{∫_{-1}^r ∫_{-\sqrt{1 - x^2}}^{\sqrt{1 - x^2}} \frac{1}{\pi} \;dy \;dx}_{P(X ≤ r) = F_X(r)} &= \frac{1}{\pi} \int_{-1}^r y \;\Big|_{-\sqrt{1 - x^2}}^{\sqrt{1 - x^2}} \;dx \\
&= \frac{1}{\pi} ∫_{-1}^r 2 \sqrt{1 - x^2} \;dx \\
&= ∫_{-1}^r \underbrace{\frac{2}{\pi} \sqrt{1 - x^2}}_{f_X(x)} \;dx
\end{align*}$

Also:

$f_Y(y) = \frac{2}{\pi} \sqrt{1 - y^2}$
"""

# ╔═╡ b7c86d6a-2542-46d5-89ba-8032d626720b
let
	plot(x -> (2/π) * sqrt(1 - x^2), layout = (2,1), label = false)
	plot!(y -> (2/π) * sqrt(1 - y^2), subplot = 2, label = false)
end

# ╔═╡ 896fe8f1-f227-48af-b88d-4086425d49a9
md"""
### Definition

``X``, ``Y`` are **independent random variables** if

$F(x, y) = F_X(x) F_Y(y)$

$f(x,y) = f_X(x) f_Y(y)$
"""

# ╔═╡ bc19a731-f8b3-4822-b691-73215509862f
md"""
### Example

``U ∈ [0,1]`` is uniform

``Y = U + 2``

$F_Y(x) = P(Y ≤ x) = \begin{cases} 0 &x ≤ 2 \\ x - 2 &2 < x < 3 \\ 1 &x ≥ 3 \end{cases}$
"""

# ╔═╡ cbeb2753-ccd1-42df-9f5a-5d31d2f87371
md"""
### Binomial Distribution

Let $X$ = number of successes of $n$ Bernoulli trials with probability of success $p$.

$b(n,p,k) = P(X = k) = \begin{pmatrix} n \\ k \end{pmatrix} p^k (1 - p)^{n - k}$
"""

# ╔═╡ c25e33fd-e00f-47ee-a526-21039f392e9e
md"""
### Typesetter Example

- ``n`` is large

- ``p`` is small

- ``\lambda`` is the long running average error per 1000 words

**Goal:**
Describe the distribution on $X$ in terms of $\lambda$.

1. ``P(X = 0) = b(n, p, 0) = \begin{pmatrix} n \\ 0 \end{pmatrix} p^0 (1 - p)^n = (1 - p)^n``

**Observe:**

$\lambda = np \implies p = \frac{\lambda}{n}$

So:

$P(X = 0) = \left(1 - \frac{\lambda}{n}\right)^n$

FACT:

$\lim_{n → ∞} \left(1 + \frac{x}{n}\right)^n = e^x$

So:

$\left(1 - \frac{\lambda}{n}\right)^n ≈ e^{-\lambda}$
"""

# ╔═╡ 855ca197-bc37-4841-a1b0-90b8665b400a
md"""

2.

$\begin{align*}
\frac{P(X = k)}{P(X = k - 1)}
= \frac{b(n,p,k)}{b(n,p,k-1)}
&= \frac{\begin{pmatrix} n \\ k \end{pmatrix} p^k (1 - p)^{n-k}}{\begin{pmatrix} n \\ k - 1 \end{pmatrix} p^{k-1} (1 - p)^{n - k + 1}} \\

&= \frac{\left(\frac{n!}{k! (n-k)!}\right)p^k (1 - p)^{n-k}}{\left(\frac{n!}{(k-1)!(n - k + 1)!}\right) p^{k-1} (1 - p)^{n - k + 1}} \\
&= \frac{\left(\frac{n!}{k! (n-k)!}\right)p}{\left(\frac{n!}{(k-1)!(n - k + 1)!}\right) (1 - p)} \\
&= \frac{p}{1 - p} ⋅ \frac{(k-1)!(n - k + 1)!}{k! (n-k)!} \\
&= \frac{p}{1 - p} ⋅ \frac{n - k + 1}{k} \\
&= \frac{np + p(-k + 1)}{(1 - p) k} \\
&≈ \frac{\lambda}{k}
\end{align*}$
"""

# ╔═╡ c5ba6590-831e-43d0-b159-fe01ef5679d9
md"""
3.

$P(X = 1) = P(X = 0) ⋅ \frac{P(X = 1)}{P(X = 0)} ≈ e^{-\lambda} \left(\frac{\lambda}{1}\right) = \lambda e^{-\lambda}$

$P(X = 2) = P(X = 1) ⋅ \frac{P(X = 2)}{P(X = 1)} ≈ \left(\lambda e^{-\lambda}\right) \left(\frac{\lambda}{2}\right) = \frac{\lambda^2}{2} e^{-\lambda}$

$P(X = 3) = P(X = 2) ⋅ \frac{P(X = 3)}{P(X = 2)} ≈ \left(\lambda e^{-\lambda}\right) \left(\frac{\lambda}{2}\right) = \frac{\lambda^3}{3!} e^{-\lambda}$

$… P(X = k) ≈ \left(\frac{\lambda^k}{k!}\right) e^{-\lambda} \qquad \text{(Poisson distribution)}$
"""

# ╔═╡ d9441f6c-768b-4163-9d0d-3f0c25f8abe9
md"""
### Example

Look at many 1000-word samples of the typesetter's previous work.
Suppose that 36.8% of the samples are error-free.
What is $\lambda$?
"""

# ╔═╡ e239a3c7-f4f6-4e0f-901b-df72fc3dfd38
md"""
$P(X = 0) = .368 = e^{-\lambda} \implies \lambda = -\ln(.368) ≈ 1$
"""

# ╔═╡ 45f354fd-5957-4d78-b188-dc69a4499794
let
	n = 1000
	p = .368
	λ = -log(p)
end

# ╔═╡ 81da8f90-44c2-47e5-84e4-f80cc3c0dbb6
md"""
### Example

Suppose a factory has a piece of equipment that needs to be serviced 3 times per month.
Let $X$ count the number of times in a month that the equipment needs service.
"""

# ╔═╡ f8603ea3-93cf-4e98-87d9-f57365d1bfa4
md"""
$\lambda = 3$

$P(X = k) = \left(\frac{\lambda^k}{k!}\right) e^{-\lambda}$

$P(X = 0) = \left(\frac{3^0}{0!}\right) e^{-3} = e^{-3}$

$P(X = 3) = \left(\frac{3^3}{3!}\right) e^{-3} = \frac{9}{2} e^{-3}$
"""

# ╔═╡ 60ea9da7-6bf8-49cd-8876-a440b3ca3555
md"""
Let $Y$ = the number of times needing service over a 2-month span.

$P(Y = 4) = \left(\frac{6^4}{4!}\right) e^{-6}$
"""

# ╔═╡ 59bca935-3b8e-4d7b-ab32-00e15e0b26e8
md"""
Let $T$ = time until the next repair is needed.

$P(T ≤ t) = 1 - \underbrace{P(T > t)}_{\text{No repair } < \;t}$

$P(T > t) = 1 - \left(\frac{(\lambda t)^0}{0!}\right) e^{-(\lambda t)} = 1 - e^{-3t}$

So, the cdf for $T$ is

$F_T(t) = \begin{cases}
1 - e^{-3t} &t ≥ 0 \\
0 &t < 0
\end{cases}$

and the pdf is

$f_T(t) = \frac{d}{dt} F_T(t) = \begin{cases} 3e^{-3t} &t ≥ 0 \\ 0 &t < 0 \end{cases}$
"""

# ╔═╡ a822bba7-f2d6-4f67-8d5f-fe846eef78ee
md"""
### Definition

The **exponential density** function with parameter $\lambda$ is

$f(t) = \begin{cases}
\lambda e^{-\lambda t} &t ≥ 0 \\
0 &t < 0
\end{cases}$
"""

# ╔═╡ 46131ff8-6fe1-4e66-800e-870198d70f56
md"""
### Fact

The exponential density is *memoryless*, i.e.,

$P(T > r + s ∣ T > s) = P(T > r)$
"""

# ╔═╡ d9054d10-3cee-4e49-8f7f-456d46217e90
md"""
### Definition

Given a discrete random variable $X : Ω → ℝ$.
the **expected value**, or **mean**, of $X$ is:

$E(X) = \sum_x xP(X = x)$
"""

# ╔═╡ 2481521c-7946-4df4-8ab4-320dda05cde0
md"""
### Example

Suppose $X$ is uniform.
Then $X$ takes on finitely many values $\{x_1, x_2, …, x_n\}$ and

$E(X) = x_1 ⋅ \frac{1}{n} + x_2 + \frac{1}{n} + ⋯ + x_n ⋅ \frac{1}{n} = \frac{1}{n} (x_1 + x_2 + ⋯ + x_n)$
"""

# ╔═╡ ef2c975e-a18f-4044-80ba-ed571104784c
md"""
### Example

Let $X$ be the outcome of rolling a fair die.
Outcomes: {1, 2, 3, 4, 5, 6}

$E(X) = \frac{1 + 2 + 3 + 4 + 5 + 6}{6} = \frac{21}{6}$
"""

# ╔═╡ 0e0cd48b-8e1b-4522-9a9d-ca3b14a98bfd
md"""
### Fact

$\sum_{k = 1}^n k = \frac{n(n + 1)}{2}$
"""

# ╔═╡ 859c93c6-d10f-479c-9fc9-4176c7bd7907
md"""
### Example

Let $X$ be Poisson-distributed with parameter $\lambda$.

$P(X = k) = \left(\frac{\lambda^k}{k!}\right) e^{-\lambda}$

So:

$\begin{align*}
E(X) &= \sum_{k = 0}^{∞} k ⋅ P(X = k) \\
&= \sum_{k = 1}^{∞} k ⋅ \left(\frac{\lambda^k}{k!}\right) e^{-\lambda} \\
&= e^{-\lambda} \sum_{k = 1}^{∞} \frac{\lambda^k}{(k - 1)!} \\
&= \lambda e^{-\lambda} \sum_{k = 1}^{∞} \frac{\lambda^{k - 1}}{(k - 1)!} \\
&= \lambda e^{-\lambda} \underbrace{\sum_{m = 0}^{∞} \frac{\lambda^m}{m!}}_{e^{\lambda}} \\
&= \lambda
\end{align*}$
"""

# ╔═╡ 5677c379-2ab7-48d4-bfb9-b30a6498b89f
md"""
### Example

Let $X$ be binomially distributed with parameters $n$ and $p$.

$P(X = k) = b(n, p, k) = \begin{pmatrix} n \\ k \end{pmatrix} p^k (1 - p)^{n - k}$

So:

$\begin{align*}
E(X) &= \sum_{k = 0}^n k ⋅ P(X = k) \\
&= \sum_{k = 1}^n k ⋅ \begin{pmatrix} n \\ k \end{pmatrix} ⋅ p^k (1 - p)^{n - k} \\
&= \sum_{k = 1}^n k ⋅ \frac{n!}{k! (n - k)!} ⋅ p^k (1 - p)^{n - k} \\
&= \sum_{k = 1}^n \frac{n!}{(k - 1)! (n - k)!} p^k (1 - p)^{n - k} \\
&= np \sum_{k = 1}^n \frac{(n - 1)! \;p^{k - 1} (1 - p)^{(n - 1) - (p - 1)}}{(k - 1)! \left((n - 1) - (k - 1)\right)!} \\
&= np \sum_{m = 0}^{n - 1} \frac{(n - 1)!}{m! (n - 1 - m)!} p^m (1 - p)^{n - 1 - m} \\
&= np \sum_{m = 0}^{n - 1} \underbrace{\begin{pmatrix} n - 1 \\ m \end{pmatrix} p^m (1 - p)^{n - 1 - m}}_{b(n - 1, p, m)} \\
&= np
\end{align*}$
"""

# ╔═╡ 13374113-e298-46f5-9807-b80d6af2c2fb
md"""
### Theorem (Linearity of Expectation)

If $X$, $Y$ are discrete, real-valued random variables with finite expectation, then:

1) ``E(X + Y) = E(X) + E(Y)``

2) ``E(cX) = cE(X)``
"""

# ╔═╡ 8df13432-d099-4486-bed9-f27a8bd17bd6
md"""
### Example

Let ``X`` = 6-sided die roll,
``Y`` = 10-sided die roll,
``Z`` = 20-sided die roll

$E(X) = \frac{21}{6} = \frac{7}{2}$

$E(Y) = \frac{55}{10} = \frac{11}{2}$

$E(Z) = \frac{210}{20} = \frac{21}{2}$
"""

# ╔═╡ 60dbe8b2-5b06-4f91-894a-2e3ba03572cc
md"""
### Definition

An **indicator variable** for $E ⊆ Ω$ is

$I_E(\omega) = \begin{cases}
1 &\text{if } \omega ∈ E \\
0 &\text{if } \omega ∉ E
\end{cases}$
"""

# ╔═╡ 6aeea501-c22e-433e-93ba-57d6aa29b2ed
md"""
### Example

Let $X_i$ indicate success of $i^{\text{th}}$ Bernoulli trial.

``X`` = number of successes in ``n`` trials = $X_1 + X_2 + ⋯ + X_n$

$E(X_i) = p$

So:

$E(X) = E(X_1) + E(X_2) + ⋯ + E(X_n) = \underbrace{p + p + ⋯ + p}_{n \text{ times}} = np$
"""

# ╔═╡ dd9f9fa8-fd01-4cbd-99a2-edce4ae3235f
md"""
### Example

Suppose we flip 200 coins.
Let $X$ = number of runs of 6 H's

E.g.,

$\text{HHHHHHHTT}⋯\text{T}\;,$

so $X = 2$

By definition,

$E(X) = \sum_{k = 0}^{195} k ⋅ P(X = k) \qquad \text{(This problem is too hard to solve.)}$

Define $X_i$ to indicate a run of 6 H's starting at $i$ $(1 ≤ i ≤ 195)$.

$P(X_1 = 1) = P(\text{flips 1–6 are H}) = \frac{1}{2^6}$

$P(X_2 = 1) = P(\text{flips 2–7 are H}) = \frac{1}{2^6}$

$P(X_1 = X_2 = 1) = P(\text{flips 1–7 are H}) = \frac{1}{2^7} ≠ \frac{1}{2^{12}}$

$E(X_i) = 0 ⋅ P(X_i = 0) + 1 ⋅ P(X_i = 1) = \frac{1}{2^6}$

$X = X_1 + X_2 + ⋯ + X_{195}$

$E(X) = \sum_{k = 1}^{195} E(X_k) = \sum_{k = 1}^{195} \frac{1}{2^6} = \frac{195}{2^6} ≈ 3$
"""

# ╔═╡ 0bd1e837-999c-4237-8dc6-47c6156371b3
md"""
### Definition

Let $X : Ω → ℝ$ be a discrete random variable.
The **variance** of $X$ is

$\begin{align*}
V(X) &= E((X - \underbrace{E(X)}_{\mu})^2) \\
&= E((X - \mu)^2) \\
&= E(X^2) - 2\mu E(X) + \mu^2 \\
&= E(X^2) - 2\mu^2 + \mu^2 \\
&= E(X^2) - \mu^2 \\
&= E(X^2) - E(X)^2
\end{align*}$

The **standard deviation** is

$D(X) = \sqrt{V(X)}$
"""

# ╔═╡ 13561c55-033b-420e-bc15-42e91ae24bdc
md"""
### Example

Find the variance of the roll of a 6-sided fair die with values 2 through 7.

$X = \{2, 3, 4, 5, 6, 7\}$

$\begin{align*}
E(X) = \sum_{x ∈ Ω} xm(x) &= 2 \left(\frac{1}{6}\right) + 3 \left(\frac{1}{6}\right) + 4 \left(\frac{1}{6}\right) + 5 \left(\frac{1}{6}\right) + 6 \left(\frac{1}{6}\right) + 7 \left(\frac{1}{6}\right) \\
&= \frac{9}{2} = \mu
\end{align*}$

$X^2 = \{2^2, 3^2, 4^2, 5^2, 6^2, 7^2\}$

$E(X^2) = (2^2) \left(\frac{1}{6}\right) + (3^2) \left(\frac{1}{6}\right) + (4^2) \left(\frac{1}{6}\right) + (5^2) \left(\frac{1}{6}\right) + (6^2) \left(\frac{1}{6}\right) + (7^2) \left(\frac{1}{6}\right)$

$=\frac{139}{6}$

$V(X) = E(X^2) - \mu^2 = \frac{139}{6} - \left(\frac{9}{2}\right)^2 = \frac{35}{12}$
"""

# ╔═╡ ea0a83fd-598a-4a24-9b52-cae5d5da28f9
let
	X = 2:7
	m(x) = 1 // length(X)
	E(X) = sum([x * m(x) for x ∈ X])
	V(X) = E(X.^2) - E(X)^2
	V(X)
end

# ╔═╡ 58c11093-bc86-4a1d-b4c1-2ddaab55bf39
md"""
### Theorem (Properties of Variance)

1) ``V(cX) = c^2 V(X)``

2) ``V(X + c) = V(X)``

3) If $X$ and $Y$ are independent, then $V(X + Y) = V(X) + V(Y)$.
"""

# ╔═╡ 11116492-2901-44ef-8685-6221769f8166
md"""
### Example

Let $X$ be a Bernoulli random variable with probability $p$ of success.

$E(X) = p$

$V(X) = p - p^2 = p(1 - p) = pq$

For example, the variance of the number of successes in $n$ trials is

$\underbrace{pq + pq + ⋯ + pq}_n = npq$.
"""

# ╔═╡ f90705e7-0d65-43be-86a9-060f199b4093
md"""
### Binomial Distribution

Let $X$ count successes in $n$ Bernoulli trials with probability $p$ of success.
Let $X_i$ indicate success in $i^{\text{th}}$ trial.

$E(X_i) = p$

$V(X_i) = pq$

So:

$X = X_1 + ⋯ + X_n$

Therefore

$E(X) = np$

$V(X) = npq$
"""

# ╔═╡ 91defb2a-f044-4d8f-b787-6067b363617b
md"""
### Example

Let $X$ be Poisson-distributed with parameter $\lambda$.

$E(X) = \lambda\;.$

**Recall:**

$\lambda = np \qquad \text{where } n \text{ is large and } p \text{ is small}$

We might guess:

$V(X) = \lambda q = \lambda (1 - p) = \lambda$

Calculate:

$V(X) = E(X^2) - \lambda^2$

$E(X^2) = \sum_{k = 0}^∞ k^2 P(X = k) = \sum_{k = 0}^∞ b^2 \left(\frac{\lambda^2}{b!}\right) e^{-\lambda}$

$\begin{align*}
E(X(X - 1)) &= \sum_{k = 2}^∞ k(k - 1) \left(\frac{\lambda^k}{k!}\right) e^{-\lambda} \\
&= e^{-\lambda} \sum_{k = 2}^∞ \frac{\lambda^k}{(k - 2)!} \\
&= \lambda^2 e^{-\lambda} \sum_{k = 2}^∞ \frac{\lambda^{k - 2}}{(k - 2)!} \\
&= \lambda^2 e^{-\lambda} \sum_{m = 0}^∞ \frac{\lambda^m}{m!} \\
&= \lambda^2
\end{align*}$

$\begin{align*}
E(X^2) &= E(X(X - 1) + X) \\
&= E(X(X - 1)) + E(X) \\
&= \lambda^2 + \lambda \\
V(X) &= E(X^2) - E(X)^2 \\
&= \lambda^2 + \lambda - \lambda^2 \\
&= \lambda
\end{align*}$
"""

# ╔═╡ d08c14ac-00e0-428a-9e65-ed8ebabdf52a
md"""
### Discrete

$E(X) = \sum_x x P(X = x) \qquad \text{if the sum converges absolutely}$
"""

# ╔═╡ 8e7d9976-5567-40c1-9d29-252bad248746
md"""
### Continuous

$E(X) = ∫_{-∞}^{∞} x \underbrace{f(x) \;dx}_{\text{probability}} \qquad \text{if } ∫_{-∞}^{∞} |x| f(x) \;dx \text{ exists}$
"""

# ╔═╡ 32967ad2-1f93-411e-8fc6-d30c88d94bc8
md"""
### Example

Suppose $X$ is uniform in $[a,b]$.

$1 = \underbrace{P(X ≤ b)}_{F(b)} = ∫_{-∞}^b f(x) \;dx = ∫_a^b \underbrace{f(x)}_{\text{constant: } c} \;dx = cx \;\Big|_a^b = c(b - a)$
$\implies c = \frac{1}{b - a}$

So:

$f(x) = \begin{cases}
0 & x < a \\
\frac{1}{b - a} & a ≤ x ≤ b \\
0 & x > b
\end{cases}$

$\begin{align*}
E(X) &= ∫_a^b x f(x) \;dx \\
&= ∫_a^b x ⋅ \frac{1}{b - a} \;dx \\
&= \left.\frac{1}{b - a} \left(\frac{x^2}{2}\right) \right]_a^b \\
&= \frac{1}{b - a} \left(\frac{b^2}{2} - \frac{a^2}{2}\right) \\
&= \frac{1}{b - a} \left(\frac{b^2 - a^2}{2}\right) \\
&= \frac{1}{b - a} \left(\frac{(b - a)(b + a)}{2}\right) \\
&= \frac{b + a}{2}
\end{align*}$
"""

# ╔═╡ 7277240a-c31a-483d-b20f-76f795b009e9
md"""
### Theorem

If $X : Ω → ℝ$, and $\phi : ℝ → ℝ$ is continuous, then: $Y = \phi(X)$ is a continuous random variable with

$E(Y) = ∫_{-∞}^∞ \phi(x) f_X(x) \;dx$
"""

# ╔═╡ 1b978621-22cb-4f3b-954b-d00de1af338d
md"""
### Example

Let $X$ be uniform in $[a,b]$.
Let $Y = X^2$.
What is the expected value of $Y$?

$\begin{align*}
E(Y) &= ∫_a^b x^2 \left(\frac{1}{b - a}\right) \;dx \\
&= \frac{1}{b - a} \left[\frac{1}{3} x^3\right]_a^b \\
&= \frac{1}{b - a} \left[\frac{b^3}{3} - \frac{a^3}{3}\right] \\
&= \frac{1}{b - a} \left(\frac{b^3 - a^3}{3}\right) \\
&= \frac{(b - a)(b^2 + ab + a^2)}{3(b - a)} \\
&= \frac{b^2 + ab + a^2}{3} \\
\end{align*}$
"""

# ╔═╡ 30f5b48b-e6fb-4303-8d2a-06025282dd25
md"""
### Example

Suppose a stick has length $L$, and we break at a uniformly random point.
What is $E(\text{length of the longer piece})$?

Let $X$ be the break point.
Then

$f_X(x) = \begin{cases}
0 & x < 0 \\
\frac{1}{L} & 0 ≤ x ≤ L \\
0 & x > L
\end{cases}$

Define $\phi : ℝ → ℝ$ by

$\phi(x) = \begin{cases}
— & x < 0 \\
L - x & 0 ≤ x ≤ \frac{L}{2} \\
x & \frac{L}{2} ≤ x ≤ L \\
— & x > L
\end{cases}$

Let $Y = \phi(X) = \text{length of longer piece}$

$\begin{align*}
E(Y) &= ∫_0^L \phi(x) f_X(x) \;dx \\
&= ∫_0^{L / 2} (L - x) \frac{1}{L} \;dx + ∫_{L / 2}^L x ⋅ \frac{1}{L} \;dx \\
&= \left.\frac{1}{L} \left(Lx - \frac{x^2}{2}\right)\right|_{0}^{L / 2} +  \left.\frac{1}{L} \left(\frac{x^2}{2}\right)\right|_{L / 2}^{L} \\
&= \frac{1}{L} \left[\left(\frac{L^2}{2} - \frac{L^2}{8}\right) + \left(\frac{L^2}{2} - \frac{L^2}{8}\right)\right] \\
&= \frac{1}{L} \left[\frac{3L^2}{8} ⋅ 2\right] \\
&= \frac{3}{4} L
\end{align*}$
"""

# ╔═╡ bb6eef03-d318-4a75-a15e-657531a14ecc
md"""
### Definition

The **variance** of $X$ is

$E\left((X - \mu)^2\right)$

Note: Let $\phi(x) = (x - \mu)^2$.
Then

$V(X) = E(\phi(X)) = ∫_{-∞}^{∞} \phi(x) f_X(x) \;dx$

Actually:

$V(X) = E((X - \mu)^2) = \underbrace{E(X^2)}_{\displaystyle∫_{-∞}^∞ x^2 f_X(x) \;dx} - \mu^2$
"""

# ╔═╡ 09f3087b-1d65-4eda-8812-5287a68d97d0
md"""
### Example

Let $X$ be uniform in $[a,b]$.
Find $V(X)$.

**Solution:**

$\begin{align*}
V(X) &= E(X^2) - \mu^2 \\
&= \frac{a^2 + ab + b^2}{3} - \left(\frac{a + b}{2}\right)^2 \\
&= \frac{a^2 + ab + b^2}{3} - \frac{a^2 + ab + b^2}{4} \\
&= \frac{4a^2 + 4ab + 4b^2 - 3a^2 - 6ab - 3b^2}{12} \\
&= \frac{a^2 - 2ab + b^2}{12} \\
&= \frac{(a - b)^2}{12}
\end{align*}$
"""

# ╔═╡ b7a4bf78-90aa-4154-bb71-b41a798cf103
md"# Exam 1 Review"

# ╔═╡ 4c4f60f2-a056-4531-8ca4-155faabc131a
md"""
## Counting Formulas

- Multiplication Principle

- Division Principle

- ``2^n`` - subsets of size $n$

- ``n!`` - rearrangements of $n$ distinct objects

- ``P(n, k) = \displaystyle\frac{n!}{(n - k)!}``

- ``C(n, k) = \begin{pmatrix} n \\ k \end{pmatrix} = \displaystyle\frac{n!}{k! (n - k!)}`` - $k$-subsets of a set of size $n$

- Binomial Theorem:

$(x + y)^n = \sum_{k = 0}^n \begin{pmatrix} n \\ k \end{pmatrix} x^k y^{n - k}$
"""

# ╔═╡ 138ba885-4f7d-4c09-b5ef-e62f88062f5b
md"""
## Discrete Probability Spaces

- Sample space $Ω$, outcome $\omega ∈ Ω$, event $A ⊆ Ω$

- Random variable $X : Ω → ℝ$

- Distribution on $Ω$, distribution on $X$

- Uniform - $P(\omega) = 1/n$

- Binomial $(n,p)$ - $P(X = k) = \begin{pmatrix} n \\ k \end{pmatrix} p^k (1 - p)^{n - k}$

  $E(X) = np, \quad V(X) = np(1 - p) = npq$

- Poisson ($\lambda$) - $P(X = k) = \left(\frac{\lambda^k}{k!}\right) e^{-\lambda}$

  $E(X) = \lambda, \quad V(X) = \lambda$
"""

# ╔═╡ 80abe510-bc12-42c6-b15f-84810f5ecc6b
md"""
## Continuous Probability Spaces

- p.d.f. - $f(x)$ so that $P(a ≤ X ≤ b) = \displaystyle∫_a^b f(x) \;dx$

- c.d.f. - $F(x)$ so that $F(x) = P(X ≤ x) = \displaystyle∫_{-∞}^x f(t) \;dt$

- Uniform - $f(x)$ constant on a bounded interval $[a,b]$

  $E(X) = \frac{a + b}{2}, \quad V(X) = \frac{(b - a)^2}{12}$

- Exponential ($\lambda$) - $f(x) = \lambda e^{-\lambda x}$ for $x ≥ 0$ (0 otherwise)

  $E(X) = \frac{1}{\lambda}, \quad V(X) = \frac{1}{\lambda^2}$
"""

# ╔═╡ 3c3b7359-61b7-4523-883e-4f525bb6a0f9
md"""
## Conditional Probability

- ``P(A ∣ B) = \displaystyle\frac{P(A ∩ B)}{P(B)}``

- Independent Events: $P(A ∣ B) = P(A)$ and $P(B ∣ A) = B$ (or at least one has probability 0).
  Equivalently: $P(A ∩ B) = P(A) P(B)$

- Independent Discrete Variables:
  ``P(X = a, Y = b) = P(X = a) P(Y = b)`` for all $a,b$.

- Independent Continuous Variables: $F(x, y) = F_X(x) F_Y(y)$ for all $x,y$.
   Equivalently: $f(x,y) = f_X(x) f_Y(y)$ for all $x,y$.

- Bayes' Theorem:

  $P(H ∣ E) = \frac{P(E ∣ H) P(H)}{P(E ∣ H) P(H) + P(E ∣ \bar{H}) P(\bar{H})}$
"""

# ╔═╡ d38a793e-cb92-4365-a389-ec5433ec2980
md"""
## Expected Value - $\mu$

- If $X$ is discrete, $E(X) = \displaystyle\sum_x xP(X = x)$ (if converges absolutely)

- If $X$ is continuous, $E(X) = \displaystyle∫_{-∞}^{∞} xf(x) \;dx$ (if converges absolutely)

- (Linearity) $E(aX + bY) = aE(X) + bE(Y)$.

- If $X,Y$ independent, then $E(XY) = E(X) E(Y)$.
"""

# ╔═╡ 8dc2fd31-a871-46d7-91a5-de028ee7deff
md"""
## Variance - $\sigma^2$

- ``V(X) = E((X - \mu)^2) = E(X^2) - \mu^2``

- ``V(X + c) = V(X)``, ``V(cX) = c^2V(X)``

- If $X, Y$ independent, then $V(X + Y) = V(X) + V(Y)$

- Standard deviation $\sigma = \sqrt{V(X)}$
"""

# ╔═╡ 13e2d6e8-7c7c-4236-8ec2-a93827e5b0c5
md"""
### Example

Let $X,Y$ be the results of rolling 2 fair 6-sided dice.
Let $Z = X + Y$.

$P_Z(k) = P(Z = k)$

E.g.,

$P_Z(5) = P(Z = 5) = \frac{\text{size}(\{(1,4),(2,3),(3,2),(4,1)\})}{36} = \frac{1}{9}$

What is the relationship between $P_X$, $P_Y$, and $P_Z$?

$\begin{align*}P(Z = k) &= P(X = 1)P(Y = k - 1) + P(X = 2)P(Y = k - 2) + ⋯ \\&= \sum_{i = 1}^6 P(X = i) P(Y = k - i)\end{align*}$

Or even:

$P(Z = k) = \sum_{i = -\infty}^{\infty} P(X = i) P(Y = k - i)$
"""

# ╔═╡ 2e071eaa-4806-4e8e-b743-5fd7ffa65416
md"""
### Definition

Suppose $X,Y$ are discrete random variables which are independent and take on integer values.
Let $Z = X + Y$.

Then:

$P(Z = k) = \sum_{i = -∞}^∞ P(X = i) P(Y = k - i) = (P_X ∗ P_Y)(k)$

The function $P_Z = P_X ∗ P_Y$ is called the **convolution** of $P_X$ and $P_Y$.
"""

# ╔═╡ 0a2b57db-e107-47ba-8abd-9d267f41635b
md"""
### Observations

1. Computers can do this fast.

2. For some cases, interesting things will happen (if done by hand).

3. Commutative (associative), i.e., $(P_Y * P_X)(k) = \displaystyle\sum_{i = -∞}^∞ P(Y = i)P(X = k - i)$
"""

# ╔═╡ b0bb489e-3d53-43e3-a5c9-4809f7d3eae1
md"""
### Example

Let $X$ be the number of successes in $n$ Bernoulli trials with probability $p$ of success.
Let $Y$ be the number of successes in $m$ Bernoulli trials with probability $p$ of success.
Let $Z = X + Y$.

$P(X = k) = \begin{pmatrix} n \\ k \end{pmatrix} p^k (1 - p)^{n - k}$

$P(Y = k) = \begin{pmatrix} m \\ k \end{pmatrix} p^k (1 - p)^{m - k}$

$\begin{align*}
P(Z = r) &= \sum_{k = -∞}^∞ P(X = k) P(Y = r - k) \\
&= \sum_{k = 0} \begin{pmatrix} n \\ k \end{pmatrix} p^k (1 - p)^{n - k} \begin{pmatrix} m \\ r - k \end{pmatrix} p^{r - k} (1 - p)^{m - (r - k)} \\
&= \sum_{k = 0} \begin{pmatrix} n \\ k \end{pmatrix} \begin{pmatrix} m \\ r - k \end{pmatrix} p^r (1 - p)^{\overbrace{n - k + m - r + k}^{n + m - r}} \\
&= p^r (1 - p)^{n + m - r} \underbrace{\sum_{k = 0} \begin{pmatrix} n \\ k \end{pmatrix} \begin{pmatrix} m \\ r - k \end{pmatrix}}_{\begin{pmatrix} n + m \\ r \end{pmatrix}} \\
&= \begin{pmatrix} n + m \\ r \end{pmatrix} p^r (1 - p)^{n + m - r} 
\end{align*}$

So:

The sum of binomially distributed $X$ $(n,p)$ and $Y$ $(m,p)$ is binomially distributed $Z(n+m, p)$.
"""

# ╔═╡ b8b22e76-91c9-4bff-ad39-e63c2a111464
md"""
### Example

Let $X$ be Poisson distributed with parameter $\lambda$.
Let $Y$ be Poisson distributed with parameter $\mu$.

$P(X = k) = \left(\frac{\lambda^k}{k!}\right) e^{-\lambda}$

$P(Y = k) = \left(\frac{\mu^k}{k!}\right) e^{-\mu}$

$\begin{align*}
P(X + Y = r) &= \sum_{k = -∞}^∞ P(X = k)P(Y = r - k) \\
&= \sum_{k = 0}^r \left(\frac{\lambda^k}{k!}\right) e^{-\lambda} \left(\frac{\mu^{r - k}}{(r - k)!}\right) e^{-\mu} \\
&= \frac{e^{-(\lambda + \mu)}}{r!} \sum_{k = 0}^r \frac{r!}{k! (r - k)!} ⋅ \lambda^k \mu^{r - k} \\
&= \frac{e^{-(\lambda + \mu)}}{r!} \underbrace{\sum_{k = 0}^r \begin{pmatrix} r \\ k \end{pmatrix} \lambda^k \mu^{r - k}}_{(\lambda + \mu)^r} \\
&= \left(\frac{(\lambda + \mu)^r}{r!}\right) e^{-(\lambda + \mu)}
\end{align*}$

Poisson with parameter $\lambda + \mu$.
"""

# ╔═╡ 6d21aba5-7de9-4f06-9b0e-3e56eb1e9ebb
md"""
### Example (special case)

Let $X,Y$ both have parameter $\lambda$.
Then $X + Y$ is Poisson distributed with parameter $2\lambda$.
"""

# ╔═╡ 6f429112-f86d-48af-bcee-9576a9dff25f
md"""
Recall the geometric distribution: $X$ is the number of trials until the first success if probability is $p$ of success for each trial.

For $k ≥ 1$,

$P(X = k) = p(1 - p)^{k - 1}$
"""

# ╔═╡ efb8ea4f-ba3a-4992-9b17-b89ec786b6b4
md"""
### Example

If $X$ is geometrically distributed with parameter $p$, then

$P(X = k) = p(1 - p)^{k - 1}$

Suppose $Y$ is also geometric distributed with parameter $p$.
Let $Z = X + Y$.
Then:

$\begin{align*}
P(Z = m) &= \sum_{k = -∞}^∞ P(X = k) P(Y = m - k) \\
&= \sum_{k = 1}^{m - 1} P(X = k)P(Y = m - k) \\
&= \sum_{k = 1}^{m - 1} p(1 - p)^{k - 1} p(1 - p)^{m - k - 1} \\
&= \sum_{k = 1}^{m - 1} p^2 (1 - p)^{m - 2} \\
&= p^2 (1 - p)^{m - 2} \sum_{k = 1}^{m - 1} 1 \\
&= (m - 1) p^2 (1 - p)^{m - 2}
\end{align*}$
"""

# ╔═╡ 23be1362-266f-401f-9436-b92b7feb41c6
md"""
### Example

Imagine $X$ counts the number of trials until the first success, then $Y$ counts the number of trials from the first success to the second success.

So $Z = X + Y$ is the number of trials overall to get to second success.
"""

# ╔═╡ 3ebb9fb2-c1ed-4e82-8b56-e8599bf27ced
md"""
### Question

Write a formula for $P(\text{2nd success is on trial } 6)$

### Follow-up

Replace 6 with $m$.

### Follow-up

Then replace 2nd with $k$th.
"""

# ╔═╡ 1e08de06-152a-4763-bcf2-5bb7b3e00a17
md"""
$Z = X + Y$

$P(Z = 6) = (6 - 1) p^2 (1 - p)^{6 - 2} = 5p^2 (1 - p)^4$

Where $5$ represents 5 sequences of 6 trials with 2nd success in trial 6 and $p^2 (1 - p)^4$ is the probability of a particular sequence of 6 trials with 2 successes.

$P(Z = m) = (m - 1) p^2 (1 - p)^{m - 2}$

Where $(m - 1)$ represents the number of sequences with the second success at trial $m$ and $p^2 (1 - p)^{m - 2}$ represents the probability of a particular sequence of trials.

$P(X_1 + X_2 + ⋯ + X_k = m) = \begin{pmatrix} m - 1 \\ k - 1 \end{pmatrix} p^k (1 - p)^{m - k}$ 
"""

# ╔═╡ b96053ad-8a33-4cf4-a153-8fcc8eff3f18
md"""
### Definition

Let $X_1, …, X_k$ be independent random variables geometrically distributed with parameter $p$.
Then, let $S_k = X_1 + ⋯ + X_k$.

$P(S_k = m) = \begin{pmatrix} m - 1 \\ k - 1 \end{pmatrix} p^k (1 - p)^{m - k}$

This distribution is called the **negative binomial distribution** with parameters $k$ and $p$.
"""

# ╔═╡ 4f116738-c5fc-4990-8e80-9233a736d935
md"""
### Discrete

$X,Y \quad Z = X + Y$

$P(Z = m) \sum_{k = -∞}^∞ P(X = k) P(Y = m - k)$
"""

# ╔═╡ a1dfbb28-252e-4027-aec2-71d8e5069606
md"""
### Continuous

$X,Y \qquad Z = X + Y$

$f_Z(t) = (f_X ∗ f_Y)(t) = ∫_{-∞}^∞ f_X(x) f_Y(t - x) \;dx$
"""

# ╔═╡ f00f2229-a507-4f11-b356-5f31d712708f
md"""
### Example

Suppose $X,Y$ uniform in $[0,1]$

$f_X(x) = f_Y(x) = \begin{cases}
0 &x < 0 \\
1 &0 ≤ x ≤ 1 \\
0 &x > 1
\end{cases}$

$(f_X ∗ f_Y)(x) = \begin{cases}
0 &x < 0 \\
x &0 ≤ x ≤ 1 \\
2 - x &1 ≤ x ≤ 2 \\
0 &x > 2
\end{cases}$

$P(X + Y ≤ 1.5) = 1 - \frac{1}{8} = \frac{7}{8}$
"""

# ╔═╡ 5a6bc962-d3b9-465a-88da-5e1535209eaa
md"""
### Definition

The function

$f(x) = \frac{1}{\sqrt{2\pi} \sigma} e^{-\frac{(x - \mu)^2}{2\sigma^2}}$

is called the **normal density** with mean $\mu$ and variance $\sigma^2$.
"""

# ╔═╡ 939c5b80-2cfa-40ea-85ce-0c9006ad76ac
md"""
### Fact

If $X$ is normal $(\mu_1, {\sigma_1}^2)$ and $Y$ is normal $(\mu_2, {\sigma_2}^2)$, then $X + Y$ is normal $\left(\mu_1 + \mu_2, {\sigma_1}^2 + {\sigma_2}^2\right)$.
"""

# ╔═╡ 9054fcf2-a006-45e5-99c4-69c37e02ee5b
md"""
### Definition

If $\mu = 0$, $\sigma^2 = 1$, then we say $X$ has the **standard normal distribution**.
"""

# ╔═╡ 86589651-4ad1-4fee-a362-14fc0c42fe78
md"""
### Chebyshev Inequality

Let $X$ be discrete with $E(X) = \mu$, and let $\epsilon > 0$.
Then:

$P\left(\left|X - \mu\right| ≥ \epsilon\right) ≤ \frac{V(X)}{\epsilon^2}$
"""

# ╔═╡ 520ed718-545c-4406-be90-276eccce31fc
md"""
### Proof

$\begin{align*}
V(X) &= E\left((X - \mu)^2\right) \\
&= \sum_x (x - \mu)^2 P(X = x) \\
&≥ \sum_{|x - \mu| ≥ \epsilon} (x - \mu)^2 P(X = x) \\
&≥ \sum_{|x - \mu| ≥ \epsilon} \epsilon^2 P(X = x) \\
&= \epsilon^2 \sum_{|x - \mu| ≥ \epsilon} P(X = x) \\
&= \epsilon^2 P(|X - \mu| ≥ \epsilon)
\end{align*}$

$\implies P(|X - \mu| ≥ \epsilon) ≤ \frac{V(X)}{\epsilon^2}$
"""

# ╔═╡ c07f6a3a-7a7d-4c4d-87a2-c9d37d27469e
md"""
### Example

Let $X$ be binomially distributed with parameters $n$ and $p$.
Then:

$\begin{align*}
E(X) &= np \\
V(X) &= npq = np(1 - p)
\end{align*}$

By Chebyshev's Inequality:

$P(|X - np| ≥ \epsilon) ≤ \frac{npq}{\epsilon^2}$

Reading assignment:

$p = 1/3, \quad \epsilon = 0.1$

What is the minimum $n$ such that

$P\left(\left|\frac{S_n}{n} - \frac{1}{3}\right| ≥ 0.1\right) ≤ 0.1?$

$S_n = X$

$E\left(\frac{X}{n}\right) = \frac{1}{n} E(X) = \frac{1}{n} ⋅ np = p$

$V\left(\frac{X}{n}\right) = \left(\frac{1}{n}\right)^2 V(X) = \frac{1}{n^2} ⋅ npq = \frac{pq}{n} = \frac{\left(\frac{1}{3}\right)\left(\frac{2}{3}\right)}{n} = \frac{2}{9n}$

So:

$\begin{align*}
P\left(\left|\frac{X}{n} - \frac{1}{3}\right| ≥ 0.1\right) &≤ \frac{\left(\frac{2}{9n}\right)}{(0.1)^2} \\
&= \frac{2}{0.09n}
\end{align*}$

$\begin{align*}
\frac{2}{0.09n} &≤ 0.01 \\
2 &≤ 0.009n \\
\frac{2000}{9} &≤ n
\end{align*}$
"""

# ╔═╡ e9f40e96-27ef-43b3-ac58-49480d90f5fa
md"""
### Law of Large Numbers

Let $X_1, …, X_n$ have $E(X_i) = \mu$, $V(X_i) = \sigma^2$.
Then:

$P\left(\left|\frac{S_n}{n} - \mu\right| ≥ \epsilon\right) → 0$

as $n → ∞$

where $S_n = X_1 + ⋯ + X_n$.
"""

# ╔═╡ fdda8946-ab96-49c7-83f7-d509a08ba9e3
let
	# 6-sided die roll
	μ = sum(1:6) / 6
	
	n = 1000000
	rolls = rand(1:6, n)
	sum(rolls) / n - μ
end

# ╔═╡ 4f9d3e50-7b31-4ba5-a777-7ad0eb9d7248
md"""
$E\left(\frac{S_n}{n}\right) = \frac{n\mu}{n} = \mu$

$V\left(\frac{S_n}{n}\right) = \frac{1}{n^2} V(S_n) = \frac{1}{n^2} n\sigma^2 = \frac{\sigma^2}{n}$

By Chebyshev:

$P\left(\left|\frac{S_n}{n} - \mu\right| ≥ \epsilon\right) ≤ \frac{V\left(\frac{S_n}{n}\right)}{\epsilon^2} = \frac{\left(\frac{\sigma^2}{n}\right)}{\epsilon^2} = \frac{\sigma^2}{n\epsilon^2} \overset{\text{as }n→∞}{⟶} 0$
"""

# ╔═╡ 42e44352-322a-4339-bbeb-539372e8d1f1
md"""
### Chebyshev Inequality

Suppose $X$ is a continuous random variable with $E(X) = \mu$.
Then:

$P(|X - \mu| ≥ \epsilon) ≤ \frac{V(X)}{\epsilon^2} = \frac{\sigma^2}{\epsilon^2}$
"""

# ╔═╡ e3717880-cab8-469c-8fbc-e24e416b7781
md"""
### Example

Let $X_1, …, X_{100}$ be uniformly chosen from $[0,20]$.
Let $S_{100} = X_1 + ⋯ + X_{100}$.

1. What are $E(X_i)$, $V(X_i)$?

2. What are $E(S_{100})$, $V(S_{100})$?

3. ``P(|S_{100} - E(S_{100})| ≥ 100) ≤ ?``
"""

# ╔═╡ 1cef3197-b05b-4f26-930d-30e0e2a95d06
md"""
#### 1

$\mu = E(X_i) = ∫_0^{20} x ⋅ \frac{1}{20} \;dx = \frac{1}{20} ⋅ \frac{20^2}{2} = 10$

$\sigma^2 = V(X_i) = ∫_0^{20} x^2 ⋅ \frac{1}{20} \;dx - μ^2 = \frac{1}{20} ⋅ \frac{20^3}{3} - 100 = \frac{100}{3}$
"""

# ╔═╡ 403adb0e-3d48-4d49-958b-636d52d70187
md"""
#### 2

$\mu = E(S_{100}) = 100 E(X_i) = 1000$

$\sigma^2 = V(S_{100}) = 100 V(X_i) = \frac{(100)^2}{3}$
"""

# ╔═╡ 73c89355-bb82-480f-804c-dcb8b63c1bb8
md"""
#### 3

$P(|S_{100} - 1000| ≥ 100) ≤ \frac{(100)^2}{3(100)^2} = \frac{1}{3}$
"""

# ╔═╡ a4e4b5ce-9731-4fa9-be31-7b85807caf1a
md"""
### Example

Let $X$ = uniform in $[0,1]$.
Let $\displaystyle f(\epsilon) = P\left(\left|X - \frac{1}{2}\right| ≥ \epsilon\right)$.
Let $g(\epsilon) =$ Chebyshev bound on $\displaystyle P\left(\left|X - \frac{1}{2}\right| ≥ \epsilon\right)$.
"""

# ╔═╡ 3ee3152f-a023-4a69-824b-360740ea45af
md"""
$E(X) = \frac{1}{2}$

$V(X) = ∫_0^1 x^2 ⋅ \frac{1}{2} \;dx - \frac{1}{4} = \frac{1}{3} - \frac{1}{4} = \frac{1}{12}$

$P\left(\left|X - \frac{1}{2}\right| ≥ \epsilon\right) = P\left(X ≥ \epsilon + \frac{1}{2}\right) + P\left(X ≤ -\epsilon - \frac{1}{2}\right) = \frac{1 - 2\epsilon}{1}$

$f(\epsilon) = P\left(\left|X - \frac{1}{2}\right| ≥ \epsilon\right) = \begin{cases}
1 &\epsilon < 0 \\
1 - 2\epsilon &0 ≤ \epsilon ≤ \frac{1}{2} \\
0 &\epsilon > \frac{1}{2}
\end{cases}$

$g(\epsilon) = \begin{cases}
1 &\epsilon ≤ 0 \\
\frac{1}{12\epsilon^2} &\epsilon > 0
\end{cases}$
"""

# ╔═╡ b59ca9ff-0d62-49c1-bc2b-7580c394efa6
let
	f(ϵ) = if ϵ < 0
		1
	elseif 0 ≤ ϵ ≤ 1/2
		1 - 2ϵ
	else
		0
	end
	
	g(ϵ) = if ϵ ≤ 0
		1
	else
		1 / 12ϵ^2
	end
	
	plot(f, label="f(x)")
	plot!(g, xlim=[0,1], ylim=[0,1], label="g(x)")
end

# ╔═╡ d5697257-7bd3-470f-8773-95fe0d344ed8
md"""
### Example

Let $X, Y ∈ [0,1]$ uniform, $Z = X + Y$.
Find $f(\epsilon) = P(|Z - 1| ≥ \epsilon)$, $g(\epsilon) =$ Chebyshev upper bound on $P(|Z - 1| ≥ \epsilon)$.
"""

# ╔═╡ 928393d0-efa7-42f9-af9f-f6ddc6d36b13


# ╔═╡ ba397b51-a046-48ca-b182-398337369962
let
	ϵ = 1/4
	plot([x -> 1 - x], xlim=[0,1], ylim=[0,1], label=false)
	plot!(x -> (1 - ϵ) - x, fillrange = 0)
	plot!(x -> (1 + ϵ) - x, fillrange = 1)
end

# ╔═╡ d10005ea-572c-4d7e-bebb-4502d8b9be94
md"""
$P(Z = k) = \begin{cases}
0 &k ≤ 0 \\
\frac{k^2}{2} &0 ≤ k ≤ 1 \\
\frac{2 - k^2}{2} &1 ≤ k ≤ 2 \\
1 &k ≥ 1
\end{cases}$
"""

# ╔═╡ 78d40d3a-f960-401f-b009-9c8cc1b71a92
md"""
$V(Z) = V(X) + V(Y) = \frac{1}{12} + \frac{1}{12} = \frac{1}{6}$

$g(\epsilon) = \begin{cases}
1 &\epsilon ≤ 0 \\
\frac{1}{6\epsilon^2} &\epsilon > 0
\end{cases}$
"""

# ╔═╡ b128ed51-5d00-49ad-8d1c-ad2aa5c872f9
md"""
### Theorem

Let $X_1, …, X_n$ be Bernoulli random variables with probability $p$ of success, and $S_n = X_1 + ⋯ + X_n$.
Then:

$\lim_{n → ∞} \sqrt{npq} \; b(n,p,⟨np + x\sqrt{npq}⟩) ≈ \phi(x) = \frac{1}{\sqrt{2\pi}} e^{-\frac{x^2}{2}}$
"""

# ╔═╡ 957bbdd0-0804-4320-b1d9-06763a527670
let
	N = 20000
	n = 100
	p = 0.5
	q = 0.5
	histogram([(Sn - n*p) / sqrt(n*p*q) for Sn ∈ [sum(rand(Bernoulli(), n)) for i ∈ 1:N]], legend = false, normalized=true)
end

# ╔═╡ a602334a-b955-4c08-bc89-7d6fc8118cc3
md"""
### Observation

1. Drift problem is solved, spike graphs for $S_n^*$ are centered at 0 ($E(S_n^*) = 0$)

2. Spread issue is solved

$\begin{align*}
V(S_n) &= npq \\
\implies V(\hat{S}_n) &= npq \\
\implies V(S_n^*) &= V\left(\frac{\hat{S}_n}{\sqrt{npq}}\right) \\
&= \frac{V(\hat{S}_n)}{npq} \\
&= \frac{npq}{npq} \\
&= 1
\end{align*}$

3. Spikes still get shorter, since they represent probabilities, not densities (like $\phi(x)$)

   ``Δx`` between subsequent spikes =

$x_{j+1} - x_j = \frac{j + 1 - np}{\sqrt{npq}} - \frac{j - np}{\sqrt{npq}}$

$Δx = \frac{1}{\sqrt{npq}}$
"""

# ╔═╡ fa4cc0be-b1eb-486a-90a7-4f79567418bc
md"""
### Example

Let $n = 100, \; p = 0.5$ so $\sqrt{npq} = \sqrt{(100)\left(\frac{1}{4}\right)} = 5$
Then:

$\sqrt{npq} \;b(n,p,j) ≈ \phi(x_j) = \phi\left(\frac{j - np}{\sqrt{npq}}\right)$

$5 b(100, 0.5, j) ≈ \phi\left(\frac{j - 50}{5}\right)$
"""

# ╔═╡ 4a26e1c5-fee8-4535-be11-a19759e40b78
let
	f(x) = 1/5sqrt(2π) * exp(-x^2 / 2)
	f((53 - 50) / 5)
end

# ╔═╡ fb5482ac-423f-4258-9ef9-488ac197066d
md"""
### Theorems

$\lim_{n → ∞} \sqrt{n\sigma^2} P(S_n^* = x_j) = \phi(x_j)$

$\lim_{n → ∞} P(a < S_n^* < b) = ∫_a^b \phi(x) \;dx$

OR for large $n$:

$P(S_n^* = x_j) ≈ \frac{\phi(x_j)}{\sqrt{n\sigma^2}}$

$P(a < S_n^* < b) ≈ ∫_a^b \phi(x) \;dx$
"""

# ╔═╡ 7971c81b-6095-44f5-9cdb-dabd7e8465d1
md"""
### Why the 0.5 shift?

Estimate of $P(x_j ≤ S_n^* ≤ x_{j + 1})$ should be the sum of the areas of the two rectangles under the Normal curve but $\displaystyle ∫_{x_j}^{x_{j + 1}} \phi(x) \;dx$ is approximately one rectangle.
"""

# ╔═╡ 19102a21-34b5-4dd6-be96-218c57c96304
md"""
### Sample Mean and Variance

Given a sample of values $x_1, …, x_n$ the **sample mean** is

$\bar{\mu} = \frac{x_1 + x_2 + ⋯ + x_n}{n}$

the **sample variance** is

$\bar{\sigma}^2 = \frac{(x_1 - \bar{\mu})^2 + (x_2 - \bar{\mu})^2 + ⋯ + (x_n - \bar{\mu})^2}{n}$
"""

# ╔═╡ 4d4c5534-f56a-4cb5-ab21-c751cc83a2b6
md"""
### Recall

The Large of Large Numbers says:

$\lim_{n → ∞} P\left(\left|\frac{S_n}{n} - \mu\right| < \epsilon\right) → 1$
"""

# ╔═╡ 7b069595-e024-4a14-9185-798d4a0c5052
md"""
### Example

Suppose $\displaystyle A_n = \frac{S_n}{n}$ is the average of $X_1, …, X_n$, with $E(X_i) = \mu, V(X_i) = \sigma^2$ unknown.

$P(A_n - \epsilon ≤ \mu ≤ A_n + \epsilon)$

$\begin{align*}
&= P(\mu - \epsilon ≤ A_n ≤ \mu + \epsilon) \\
&= P\left(\mu - \epsilon ≤ \frac{S_n}{n} ≤ \mu + \epsilon\right) \\
&= P\left((\mu - \epsilon) \frac{\sqrt{n}}{\sigma} ≤ \frac{S_n}{\sqrt{n\sigma^2}} ≤ (\mu + \epsilon) \frac{\sqrt{n}}{\sigma}\right) \\
&= P\left(\frac{\mu \sqrt{n}}{\sigma} - \frac{\epsilon \sqrt{n}}{\sigma} ≤ \frac{S_n}{\sqrt{n\sigma^2}} ≤ \frac{\mu \sqrt{n}}{\sigma} + \frac{\epsilon \sqrt{n}}{\sigma}\right) \\
&= P\left(\frac{\mu \sqrt{n}}{\sigma} - \frac{\epsilon \sqrt{n}}{\sigma} - \frac{n\mu}{\sqrt{n\sigma^2}} ≤ S_n^* ≤ \frac{\mu \sqrt{n}}{\sigma} + \frac{\epsilon \sqrt{n}}{\sigma} - \frac{n\mu}{\sqrt{n\sigma^2}}\right) \\
&= P\left(-\frac{\epsilon \sqrt{n}}{\sigma} ≤ S_n^* ≤ \frac{\epsilon \sqrt{n}}{\sigma}\right) \\
&\overset{\text{CLT}}{≈} ∫_a^b \phi(x) \;dx = ∫_{-b}^b \phi(x) \;dx = 2 ∫_0^b \phi(x) \;dx = 2 \text{NA}(0, b)
\end{align*}$
"""

# ╔═╡ 6324e9b9-5ba6-4710-9b2d-9798d63f1389
md"""
### Example

Suppose we mesasure something 100 times and the sample mean and variance of our measurements are 2 and 3.
What is $\epsilon$ so that there is 95% confidence that the true mean $\mu$ is  in $(2 - \epsilon, 2 + \epsilon)$?

$0.95 = 2\text{NA}(0,b) \implies \text{NA}(0,b) = 0.475$

**Q:** What is $b$ such that $\displaystyle \text{NA}(0, b) = \frac{0.95}{2} = 0.475?$

**A:** $1.96$

Want: $\displaystyle \frac{\epsilon \sqrt{n}}{\sigma} = 1.96.$ Best we can do is $\displaystyle \frac{\epsilon \sqrt{n}}{\bar{\sigma}} = 1.96$
So $\displaystyle \epsilon = \frac{1.96 \sqrt{3}}{10} ≈ 0.339$.

``(2 - \epsilon, 2 + \epsilon)`` is our 95% chance interval.
"""

# ╔═╡ cf6df8e6-70a0-4a3c-9ca4-c8fefb25912a
md"""
### Example

Let

$X : \begin{pmatrix} 1 & 2 & 3 & 4 & 5 \\ 1/3 & 0 & 0 & 2/3 & 0 \end{pmatrix}$
$Y : \begin{pmatrix} 1 & 2 & 3 & 4 & 5 \\ 0 & 2/3 & 0 & 0 & 1/3 \end{pmatrix}$

$\mu = 3$
$\sigma^2 = 2$

$g_X(t) = E(e^{tX}) = \sum_{j = 1}^5 e^{tx_j} P(X = x_j) = \frac{1}{3} e^{t} + \frac{2}{3} e^{4t}$

${g_X}'(t) = \frac{1}{3} e^{t} + \frac{8}{3} e^{4t},\; {g_X}'(0) = 3 = E(X) = \mu_1$

${g_X}''(t) = \frac{1}{3} e^{t} + \frac{32}{3} e^{4t},\; {g_X}''(0) = 11 = E(X) = \mu_2$

${g_X}^{(3)}(t) = \frac{1}{3} e^{t} + \frac{64}{3} e^{4t},\; {g_X}^{(3)}(0) = \frac{65}{3} = E(X) = \mu_3$

${g_X}^{(4)}(t) = \frac{1}{3} e^{t} + \frac{128}{3} e^{4t},\; {g_X}^{(4)}(0) = 43 = E(X) = \mu_4$

$g_Y(t) = E(e^{tY}) = \sum_{j = 1}^5 e^{ty_j} P(Y = y_j) = \frac{2}{3} e^{2t} + \frac{1}{3} e^{5t}$

${g_Y}'(t) = \frac{4}{3} e^{2t} + \frac{5}{3} e^{5t}, \;{g_Y}'(0) = 3 = E(Y) = \mu_1$

${g_Y}''(t) = \frac{8}{3} e^{2t} + \frac{25}{3} e^{5t}, \;{g_Y}''(0) = 11 = E(Y) = \mu_2$

${g_Y}^{(3)}(t) = \frac{16}{3} e^{2t} + \frac{125}{3} e^{5t}, \;{g_Y}^{(3)}(0) = 47 = E(Y) = \mu_3$

${g_Y}^{(4)}(t) = \frac{32}{3} e^{2t} + \frac{625}{3} e^{5t}, \;{g_Y}^{(4)}(0) = 219 = E(Y) = \mu_4$
"""

# ╔═╡ 4238aa19-9d78-4743-a70b-e5018d435d73
md"""
### Theorem 6.1

$E(g(X)) = \sum_x g(x) P(X = x)$
"""

# ╔═╡ 1d040116-10f6-4607-9381-59e917263a81
md"""
### Define

The $k^{\text{th}}$ moment of $X$ is $E(X^k) = \mu_k$.
E.g., mean = $\mu_1$ variance $= \mu_2 - {\mu_1}^2$
"""

# ╔═╡ 3c736c26-577f-424d-a842-2b5f2785e5ab
md"""
### Define

The **moment generating function (m.g.f.)**

$g(t) = E(e^{tX}) = \sum_{j = 1}^∞ e^{tx_j} P(X = x_j)\;,$


where $X$ has range $\{x_1, x_2, …, x_n, …\}$

Or:

$E\left(e^{tX}\right) = E\left(\sum_{k = 0}^∞ \frac{(tX)^k}{k!}\right) = E\left(\sum_{k = 0}^∞ \frac{t^k}{k!} X^k\right) = \sum_{k = 0}^∞ \frac{t^k}{k!} \underbrace{E(X^k)}_{\mu_k}$
"""

# ╔═╡ 4d63139e-dd7c-4c43-b064-c2e7b032f40d
md"""
### Fact

If $g(t)$ is the m.g.f. for $X$, then

$g^{(k)}(0) = \mu_k$
"""

# ╔═╡ 7f4389ae-ee03-4cdd-9c2a-71f0e8931fda
md"""
### Example

Let $X$ be Bernoulli with probability $p$ of success.

$P(X = 0) = 1 - p = q$

$P(X = 1) = p$

So:

$g(t) = e^{0⋅t} P(X = 0) + e^{1 + t}P(X = 1) = q + pe^t$

$\begin{align*} \\
g(t) &= q + pe^t &\implies &&g'(0) &= p = \mu_1 \\
g'(t) &= pe^t &\implies &&g''(0) &= p = \mu_2 \\
g''(t) &= pe^t &\implies &&g''(0) &= p = \mu_3 \\
g'''(t) &= pe^t &\implies &&g'''(0) &= p = \mu_4 \\
&⋮ &&&&⋮ \\
g^{(k)}(t) &= pe^t &\implies &&g^{(k)}(0) &= p = \mu_5
\end{align*}$
"""

# ╔═╡ afbf1632-5de2-4056-af13-cd0027d91335
md"""
### Example

Let $Y$ be binomially distributed on $\{0, 1, …, n\}$ with probability $p$ of success.

$\begin{align*}
g_Y(t) &= \sum_{j = 0}^n e^{jt} P(Y = j) \\
&= \sum_{j = 0}^n e^{jt} \begin{pmatrix} n \\ j \end{pmatrix} p^j q^{n - j} \\
&= \sum_{j = 0}^n \begin{pmatrix} n \\ j \end{pmatrix} (pe^t)^j q^{n - j} \\
&= (pe^t + q)^n
\end{align*}$
"""

# ╔═╡ a9c8ebba-3a28-43aa-889f-8133768c0083
md"""
### Properties

If $Y = X + a$, $Z = bX$, then:

$\begin{align*}
g_Y(t) &= e^{at} g_X(t) \\
g_Z(t) &= g_X(bt)
\end{align*}$

If $X,Y$ are independent and $Z = X + Y$, then

$g_Z(t) = g_X(t) g_Y(t)$
"""

# ╔═╡ 464b9380-2215-4c89-a889-562e8f7df32e
md"""
### Warm-up

If $X$ has m.g.f.

$g(t) = \left(\frac{1}{5} + \frac{4}{5} e^t\right)^{20}$

then what is $P(X = 10)$?
"""

# ╔═╡ 8757fbc3-c70c-4bc4-ae27-2e50aceda64b
md"""
Let

$h(t) = \frac{1}{5} + \frac{4}{5} e^t$

Find $Y$ so that $h(t)$ is the m.g.f. of $Y$.

$h(t) = \sum_y e^{ty} P(Y = y) = \frac{1}{5} e^{0 ⋅ t} + \frac{4}{5} e^{1 ⋅ t}$

So $Y ∈ \{0,1\}$ with $P(Y = 1) = \frac{4}{5}$.

``Y`` is Bernoulli with probability $p = \frac{4}{5}$ of success.
Then $X$ "represents" the sum of 20 independent trials each with distribution of $Y$.

So $X$ is binomially distributed is:

$P(X = 10) = \begin{pmatrix} 20 \\ 10 \end{pmatrix} \left(\frac{1}{5}\right)^{10} \left(\frac{4}{5}\right)^{10}$
"""

# ╔═╡ 9b6d82d3-7382-44b4-a14f-b88d6d720e0c
md"""
### Define

Let $X$ be continuous.
The $k^{\text{th}}$ moment of $X$ is

$\mu_k = E(X^k) = ∫_{-∞}^{+∞} x^n f_X(x) \;dx$

if $\displaystyle ∫_{-∞}^{+∞} |x^n| f_X(x) \;dx$ exists.

The m.g.f. is

$g(t) = E(e^{tx}) = ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx = \sum_{k = 0}^∞ \frac{\mu_k t^k}{k!}$
"""

# ╔═╡ 0b9cd0d1-1b92-4983-a106-129022f04dcc
md"""
### Properties

1. Given $X$, if $Y = X + a$ and $Z = bX$, then

   $\begin{align*}
   g_Y(t) &= e^{at} g_X(t) \\
   g_Z(t) &= g_X(bt)
   \end{align*}$

2. If $X, Y$ are independent, then

   $g_{X + Y}(t) = g_X(t) g_Y(t).$
"""

# ╔═╡ 866fc60d-27cb-4775-b25d-9caebf80bf21
md"""
### Example

Let $X$ be uniform in $[0,1]$, $Y$ uniform in $[a,b]$.
Find $g_X$ and $g_Y$.
"""

# ╔═╡ 02b3bec6-1171-4898-a1e4-23bf6cc2a1f9
md"""
$u = tx \implies ∫_0^1 → ∫_0^t$

$du = t \;dx \implies dx = \frac{du}{t}$

$g_X(t) = E(e^{tx}) = ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx = ∫_0^1 e^{tx} \;dx = \frac{1}{t} ∫_0^t e^u \;du = \frac{e^t - 1}{t}$

For $Y$, stretch then shift:

$Y = (b - a) X + a$

$g_Y(t) = e^{at} g_X((b - a) t) = e^{at} \left(\frac{e^{(b - a)t} - 1}{(b - a)t}\right) = \frac{e^{bt} - e^{at}}{(b - a)t}$

Alternatively, just take the integral again:

$u = tx \implies ∫_a^b → ∫_{at}^{bt}$

$g_Y(t) = E(e^{tx}) = ∫_a^b e^{tx} ⋅ \frac{1}{b - a} \;dx = \frac{1}{(b - a)t} ∫_{at}^{bt} e^u \;du = \frac{e^{bt} - e^{at}}{(b - a)t}$
"""

# ╔═╡ c7418848-d637-44d9-8e89-c9ead98fc04c
md"""
### Example

Let

$f_X(x) = \begin{cases} \lambda e^{-\lambda x} &x ≥ 0 \\ 0 & x < 0 \end{cases}$

(exponential density with parameter $\lambda$.)
Find $g_X(t)$.
"""

# ╔═╡ 8e275e71-bd89-4fc3-af6b-18e22b76e372
md"""
$\begin{align*}
g_X(t) &= E(e^{tx}) \\
&= ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx \\
&= ∫_0^∞ e^{tx} \lambda e^{-\lambda x} \;dx &t < \lambda \\
&= \lim_{b → ∞} \int_0^b \lambda e^{(t - \lambda)x} \;dx \\
&= \lim_{b → ∞} \left[\frac{\lambda e^{(t - \lambda)x}}{t - \lambda} \right]_0^b \\
&= \lim_{b → ∞} \left(\frac{\lambda e^{(t - \lambda)b}}{t - \lambda} - \frac{\lambda}{t - \lambda}\right) \\
&= -\frac{\lambda}{t - \lambda} \\
&= \frac{\lambda}{\lambda - t}
\end{align*}$
"""

# ╔═╡ 6934a5a6-e222-4baa-82d5-1ba8109a0095
md"""
### Define

A graph $G = (V, E)$ where $V$ is a set whose elements are called *vertices* and $E$ is a set of ordered pairs from $V$ called *edges*.
"""

# ╔═╡ 6ab50f97-f438-4df2-b728-2fdb71847fc6
md"""
### Examples

- Undirected

- Directed

- Simple (no loops, no parallel edges)

- Not simple (has loops or parallel edges)
"""

# ╔═╡ eccdf153-ca77-40bc-9da0-c7f0e7e696df
let
	path_graph(5)
end

# ╔═╡ 09e9a0ce-ff88-4140-90fb-55d5ca560444
md"""
### Define

If $x,y$ are vertices in $G$, the **distance** $d(x,y)$ is the number of edges in a shortest path from $x$ to $y$.
"""

# ╔═╡ b0f8ea13-5823-4fb8-a9fc-f569e5f68649
md"""
### Define

The **random graph** $RG$ has $V = \{1,2,3,…\}$ and an edge $\{a,b\}$ if a coin comes up heads (with probability $p$).

$(0 < p < 1)$

### Question

What is the **diameter** (i.e., greatest distance between 2 vertices) of $RG$?

### Claim

The diameter of $RG$ is 2 with probability 1.

$P\left(z ↦ \begin{cases} x \\ y \end{cases}\;\right) = p^2$

So

$P\left(z ↦̸ \begin{cases} x \\ y \end{cases}\;\right) = 1 - p^2$

So

$P\left(\text{there is no } z ↦ \begin{cases} x \\ y \end{cases}\;\right) = \lim_{k → ∞} (1 - p^2)^k = 0$

$∎$
"""

# ╔═╡ 0ac44089-ec0b-408a-bd4f-adf99d27c82d
md"""
### Definition

A **matrix** is an $m × n$ grid of numbers:

$A = (a_{ij}) = \begin{bmatrix} a_{11} & a_{12} & ⋯ & a_{1n} \\ a_{21} & a_{22} & ⋯ & a_{2n} \\ ⋮ & ⋮ & ⋱ & ⋮ \\ a_{m1} & a_{m2} & ⋯ & a_{mn} \end{bmatrix}$
"""

# ╔═╡ f8d76c65-23ff-49d4-b1f9-efbd196438be
md"""
### Definition

If $A$ is $m × n$, and $B$ is $n × k$, then $AB$ is $m × k$, with the $i,j$ entry equal to:

$a_{i1} b_{1j} + a_{i2} b_{2j} + ⋯ + a_{in} b_{nj}$
"""

# ╔═╡ 379e2182-9eb5-44f0-807c-8a225fb83260
md"""
### Fact

If $A$ is $m × n$ and $𝐱$ is $n × 1$, then

$A𝐱 = \text{the linear combination of columns of } A \text{ with coefficients from } 𝐱.$
"""

# ╔═╡ f0e8ee0f-a294-4351-a7b0-eb54473958eb
md"""
### Example


$A = \begin{bmatrix} 1 & 2 & 1 \\ 0 & -1 & 1 \\ 2 & 1 & 1 \end{bmatrix} \begin{bmatrix} 1 \\ -1 \\ 2 \end{bmatrix} = (1) \begin{bmatrix} 1 \\ 0 \\ 2 \end{bmatrix} + (-1) \begin{bmatrix} 2 \\ -1 \\ 1 \end{bmatrix} + (2) \begin{bmatrix} 1 \\ 1 \\ 1 \end{bmatrix} = \begin{bmatrix} 1 \\ 3 \\ 3 \end{bmatrix}$
"""

# ╔═╡ 0d201c84-672e-47b7-9b50-dd3a7731bbf2
let
	A = [1 2 1
		 0 -1 1
		 2 1 1]
	
	x = [1; -1; 2]
	
	A*x
end

# ╔═╡ 827c3523-08fb-4d5c-bfbe-0e345d36ea1b
md"""
### Fact

Let $A,B$ be matrices, with

$B = \begin{bmatrix} B_1 & B_2 & ⋯ & B_k \end{bmatrix}$

where $B_k$ is the $k$th column of $B$.
Then

$AB = \begin{bmatrix} AB_1 & AB_2 & ⋯ & AB_k \end{bmatrix}$
"""

# ╔═╡ 9eda903d-e91a-4906-bcb1-511479f11de9
md"""
### Fact:

In general, $AB ≠ BA$.
"""

# ╔═╡ fa3c7081-2702-4550-b18f-23403b9f92f5
md"""
### Fact

$A(BC) = (AB)C$

(if the dimensions make sense)
"""

# ╔═╡ 102af541-f518-4352-9da2-087ac0463d90
md"""
### Definition

$I_n = \begin{bmatrix} 1 & 0 & ⋯ & 0 \\ 0 & 1 & ⋯ & 0 \\ ⋮ & ⋮ & ⋱ & ⋮ \\ 0 & 0 & ⋯ & 1 \end{bmatrix}$
"""

# ╔═╡ 929561ca-f65f-4259-b34e-192465cf9a28
md"""
### Fact

If $A$ is $m × n$,

$\begin{align*}
AI_n &= A \\
I_m A &= A
\end{align*}$
"""

# ╔═╡ 93303152-0e45-45d5-916f-ac3aab48b844
md"""
### Define

If $A$ is $n × n$, an $n × n$ $B$ is an *inverse* for $A$ if

$AB = BA = I_n.$

If $B$ exists, it's called *the* inverse and written $A^{-1}$.
"""

# ╔═╡ 6d9958e7-cbd5-4c00-949a-659678a26ef9
md"""
### Claim

If $A$ is $n × n$, then $A$ has an inverse if and only if 

$A𝐱 = 𝟎$

has only $𝐱 = 𝟎$ as a solution.
"""

# ╔═╡ 73b12828-f83f-4662-8231-5b9acf5f000a
md"""
### Definition

The **adjacency matrix** $A$ for a graph $G$ has

$a_{ij} = \begin{cases} 1 &\text{if } v_i, v_j \text{ connected} \\ 0 &\text{otherwise} \end{cases}$
"""

# ╔═╡ 5ba6b609-d105-4076-8111-93eb23760729
md"""
### Definition

A **markov chain** is a collection of states $S = \{s_1, …, s_r\}$ of **states** and **transition probabilities** betwen states:

$p_{ij} = P(\text{transition from } s_i \text{ to } s_j)$
"""

# ╔═╡ f9d7ba16-71b5-4ed0-9962-5f3c4814e107
md"""
### Observation

1) Arrows out of any particular vertex have labels that sum to 1.

$\sum_{j = 1}^r p_{ij} = 1$

2) We can record the transition probabilities in a **transition matrix**.

$P = (p_{ij})$

3) ``p_{ij}^{(n)} = `` probability of going from state $s_i$ to $s_j$ in exactly $n$ steps

4) Each row of $P^n$ sums to 1.
"""

# ╔═╡ ba7f0272-3ab8-454f-9a04-c9c733b42955
md"""
### Definition

A **probability vector** $𝐮$ is any row vector with nonnegative entries summing to 1.
"""

# ╔═╡ ff3c1b4a-bfe0-4f35-9759-d4cb58f5fc7c
md"""
### Theorem

If $𝐮$ is a probability vector and $𝐏$ is a transition matrix, then

$𝐮^{(n)} = 𝐮𝐏^n$

has entries giving probabilities of being at each state after $n$ steps.
"""

# ╔═╡ c3dacda2-2a92-4929-a9a7-c6d332dd2784
md"""
### Definition

An **absorbing state** is one that can't be left.
A state that's not absorbing is **transient**.
A Markov chain is **absorbing** if every state can eventually lead to an absorbing state.
"""

# ╔═╡ 91a708d4-d27a-44a7-8007-b67636b7e03a
md"""
### Theorem

``(𝐈 - 𝐐)`` is invertible, with inverse $𝐍 = 𝐈 + 𝐐 + 𝐐^2 + ⋯$, and entry $n_{ij}$ of $𝐍$ tells the expected number of times we would be in state $s_j$ if we started in $s_i$ before absorbing.
"""

# ╔═╡ 2d8a14f5-84db-4e49-a716-2ccef12de5f2
md"""
### Theorem

If $A = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$ then

$A^{-1} = \frac{1}{ad - bc} \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}$

if and only if $ad - bc ≠ 0$.
"""

# ╔═╡ 5f519a29-5dcc-427a-9b8c-769c47a4658e
md"""
### Setup

An absorbing Markov chain has canonical form transition matrix


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
"""

# ╔═╡ d910865b-2c6f-41e6-a51e-6827afb046b4
md"""
### Facts

1) ``q_{ij}^{(n)} = ij`` entry of $𝐐^n$ gives the probability of going from $s_i → s_j$ in $n$ steps ($s_i, s_j$ transient)

2) The **fundamental matrix** $𝐍 = (𝐈 - 𝐐)^{-1}$ has entries $n_{ij}$ that give the expected number of times the process will be in state $s_j$ if it started in $s_i$, before absorbing.

3) Sum of row $i$ of matrix $𝐍$ gives the expected total number of steps before absorbing if starting in state $s_i$.
   So:

   $𝐍 = \begin{bmatrix} ⋮ \\ ⋮ \end{bmatrix} = 𝐭$

   is a vector whose entries give expected number of steps before absorption.

4) ``𝐁 = 𝐍𝐑`` has entries $b_{ij}$ which give the probabilities of absorbing into state $s_j$ given that we start in (transient) state $s_i$.
"""

# ╔═╡ c881ab12-b9eb-4039-998b-ce4f3d7b9e67
md"""
### Example (Tennis)

Player $A$ wins a point with probability 0.6.
Write a transition matrix with the states in this order:
{deuce, ad A, ad B, A wins, B wins}
Probability that A wins from deuce and the number of points they expect to play.
"""

# ╔═╡ 0add1790-72bd-419c-98d3-8589998ee676
md"""

$𝐏 = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c c c c}
\text{deuce} & \text{ad } A & \text{ad } B & A \text{ win} & B \text{ win}
\end{array} \\
\begin{array}{c}
\text{deuce} \\ \text{ad } A \\ \text{ad } B \\ A \text{ wins} \\ B \text{ wins}
\end{array}\hspace{-0.8em} &
\left(
\begin{array}{c c c c c}
0 & 0.6 & 0.4 & 0 & 0 \\
0.4 & 0 & 0 & 0.6 & 0 \\
0.6 & 0 & 0 & 0 & 0.4 \\
0 & 0 & 0 & 1 & 0 \\
0 & 0 & 0 & 0 & 1 \\
\end{array}
\right). \\
\end{array}$

"""

# ╔═╡ 6a72c293-06c8-4686-8bbd-98088e9772f8
let
	P = [0   0.6 0.4   0   0
		 0.4   0   0 0.6   0
		 0.6   0   0   0 0.4
		   0   0   0   1   0
		   0   0   0   0   1]
	Q = P[1:3, 1:3]
	R = P[1:3, 4:end]
	N = inv(I - Q)
	c = ones(3)
	B = N*R
	t = N*c
	
	B, t
end

# ╔═╡ 81530b1c-e153-4f58-bf8e-99255e9eb3a7
let
	probAwins(a, b) = a^2 / (1 - 2a*b)
	probAwins(0.6, 0.4)
end

# ╔═╡ 0b47edf3-b74c-456c-8905-3f7f649abec3
md"""
### Definition

A Markov chain is **ergodic** if you can get from any state to any state (eventually).

It's **regular** if $𝐏^n$ has strictly positive entries for some $n$.
"""

# ╔═╡ ab1acee6-2346-4433-8038-1673dfd39810
md"""
### Theorem

If $𝐏$ is regular then $\displaystyle \lim_{n → \infty} 𝐏^n = 𝐖$, where all rows of $𝐖$ are the row vector $𝐰$ having strictly positive entries.
"""

# ╔═╡ 46d1d351-d333-4408-b2fb-dcdfebfa0070
md"""
### Examples

$A = \begin{bmatrix} 1 & 1 \\ 1 & 1 \end{bmatrix} \quad B = \begin{bmatrix} 1 & 1 \\ 1 & -1 \end{bmatrix} \quad C = \begin{bmatrix} 1/2 & 1/2 \\ 0 & 1 \end{bmatrix} \quad D = \begin{bmatrix} 1/4 & 3/4 \\ 3/4 & 1/4 \end{bmatrix}$

$A^n = \begin{bmatrix} 2^{n - 1} & 2^{n - 1} \\ 2^{n - 1} & 2^{n - 1} \end{bmatrix} \underset{n → ∞}{\longrightarrow} \text{DNE}$

$B^n \underset{n → ∞}{\longrightarrow} \text{DNE}$

$C^n = \begin{bmatrix} \frac{1}{2^n} & 1 - \frac{1}{2^n} \\ 0 & 1 \end{bmatrix} \quad \lim_{n → ∞} C^n = \begin{bmatrix} 0 & 1 \\ 0 & 1 \end{bmatrix}$

$\lim_{n → ∞} D^n = \begin{bmatrix} 1/2 & 1/2 \\ 1/2 & 1/2 \end{bmatrix}$
"""

# ╔═╡ 40056baa-f80e-4eab-837b-19b092cec517
let
	A = [1 1; 1 1]
	B = [1 1; 1 -1]
	C = [1/2 1/2; 0 1]
	D = [1//4 3//4; 3//4 1//4]

	k = 8
	(A^k, B^k, C^k, D^k)
end

# ╔═╡ f030b592-a305-46ab-ac70-f59106c76017
md"""
### Theorem

If $𝐏$ is regular, then $𝐰𝐏 = 𝐰$, and if $𝐯𝐏 = 𝐯$, then $𝐯 = \alpha𝐰$.
"""

# ╔═╡ caf9c662-8eca-4d89-a541-26df4c639a4a
md"""
### Example

$\begin{align*}
\begin{pmatrix} w_1 & w_2 \end{pmatrix} \begin{bmatrix} 1/4 & 3/4 \\ 3/4 & 1/4 \end{bmatrix} &= \begin{pmatrix} w_1 & w_2 \end{pmatrix} \\
\begin{pmatrix} \frac{w_1}{4} + \frac{3w_2}{4} & \frac{3w_1}{4} + \frac{w_2}{4} \end{pmatrix} &= \begin{pmatrix} w_1 & w_2 \end{pmatrix}
\end{align*}$

$\begin{align*}
\frac{w_1}{4} + \frac{3w_2}{4} &= w_1 \\
\frac{3w_1}{4} + \frac{w_2}{4} &= w_2
\end{align*}$

Pretend $w_1 = 1$.

Then the first equation becomes

$\frac{1}{4} + \frac{3w_2}{4} = 1 \implies \frac{3w_2}{4} = \frac{3}{4} \implies w_2 = 1$

Then:

$\frac{\begin{pmatrix} 1 & 1 \end{pmatrix}}{2} = \begin{pmatrix}\frac{1}{2} & \frac{1}{2}\end{pmatrix}$
"""

# ╔═╡ e228f399-0cab-4a5e-99c2-a1d6e712b179
md"""
### Warm-up problem

Find $𝐰$ such that

$𝐰 \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix} = 𝐰.$

Is $𝐏 = \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix}$ regular?

**Solution.**

$𝐰 = \begin{bmatrix} w_1 & w_2 \end{bmatrix}$

$\begin{bmatrix} w_1 & w_2 \end{bmatrix} \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix} = \begin{bmatrix} w_2 & w_1 \end{bmatrix}$

$\begin{align*}
w_2 &= w_1 \\
w_1 &= w_2
\end{align*}$

Assume that $w_1 = 1$.
Then $w_2 = 1$.
So $𝐯 = \begin{bmatrix} 1 & 1 \end{bmatrix}$ is a fixed row vector for $P$.
Let

$𝐰 = \frac{𝐯}{2} = \begin{bmatrix} \frac{1}{2} & \frac{1}{2} \end{bmatrix}$.

Every power $𝐏^n$ is either:

$\begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix} \text{ or } \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}$

Never strictly positive entries, so $P$ is *not* regular.
"""

# ╔═╡ 16357e8c-bde9-43ca-b9d2-83abee8e5a79
md"""
### Theorem

If $𝐏$ is ergodic, then there is a unique probability vector $𝐰$ such that $𝐰𝐏 = 𝐰$, and any row vector $𝐯$ such that $𝐯𝐏 = 𝐯$ is a scalar multiple of $𝐰$.
"""

# ╔═╡ 6dcebfd9-fa02-4b8f-899a-9ee2d5ec3aaa
md"""
### Reminder

In Theorem 11.8 $𝐏$ is regular, and $\displaystyle \lim_{n → ∞} 𝐏^n = 𝐖$, where every row of $𝐖$ is $𝐰$.
"""

# ╔═╡ f48d33c2-c01b-49b7-91cf-095130795abb
md"""
### Theorem

Let $𝐏$ be ergodic, and let

$𝐀_n = \frac{𝐈 + 𝐏 + 𝐏^2 + ⋯ + 𝐏^n}{n + 1}$

Then:

$\lim_{n → ∞} 𝐀_n = 𝐖,$

where the rows of $𝐖$ are all $𝐰$.

The $ij$ entry of $𝐀_n$ tells the average time spent in state $s_j$ if we started in state $s_i$ and took $n$ steps.
"""

# ╔═╡ 9d6ab847-1855-4085-86c7-aa5a07f12738
md"""
### Example (Ehrenfest)

We have 2 urns $U_1$ and $U_2$, and 4 balls.
At any time, pick a ball uniformly at random and switch the urn it's in.
States 0, 1, ..., 4 will keep track of the number of balls in $U_1$.

$𝐏 = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c c c c}
0 && 1 && 2 && 3 && 4
\end{array} \\
\begin{array}{c}
0 \\ 1 \\ 2 \\ 3 \\ 4
\end{array}\hspace{-0.8em} &
\left[
\begin{array}{c c c c c}
0 & 1 & 0 & 0 & 0 \\
1/4 & 0 & 3/4 & 0 & 0 \\
0 & 1/2 & 0 & 1/2 & 0 \\
0 & 0 & 3/4 & 0 & 1/4 \\
0 & 0 & 0 & 1 & 0 \\
\end{array}
\right]. \\
\end{array}$

$𝐰𝐏 = \begin{bmatrix} \frac{w_2}{4} & w_1 + \frac{w_3}{2} & \frac{3w_2}{4} + \frac{3w_4}{4} & \frac{w_3}{2} + w_5 & \frac{w_4}{4} \end{bmatrix}$

$𝐰 = \begin{bmatrix} 1 & 4 & 6 & 4 & 1 \end{bmatrix}$
"""

# ╔═╡ 847b3196-fb63-48cf-a222-092cb841ed91
md"""
### Fact

If $𝐏$ is ergodic, then $𝐀_n$ is regular for $n ≥ 2$, and $𝐏, 𝐀_n$ all have the same fixed probability vector.
"""

# ╔═╡ 749a26f8-aea6-4e6b-88d5-6b0a1be9490c
md"""
### Question

Why is $𝐰$ positive?

**Setup.**
$P$ is ergodic, $𝐰𝐏 = 𝐰$ where $𝐰$ is a probability.

**Solution.**
Suppose $𝐰_j = 0$ for some $j$.
Suppose $p_{ij} > 0$.
Then $𝐰_i 𝐏_{ij}$ is a lower bound on $𝐰_j$.

$\implies 𝐰_i = 0$

By an analogous argument, every entry of $𝐰$ would be zero.
"""

# ╔═╡ 1b29c700-cfe1-417f-ad61-3c9d491e1fbb
md"""
### Definition

Let $P$ be ergodic.
The **mean first passage time** $m_{ij}$ from $s_i$ to $s_j$ $(i ≠ j)$ is the expected number of steps to take before hitting $s_j$ if starting in $s_i$. $(m_{ii} = 0)$
"""

# ╔═╡ 56114e91-0682-4048-9853-032e90fac51e
md"""
### Method to find $m_{ij}$

Form $\hat{𝐏}$ which represents the same Markov process but with $s_j$ made into an absorbing state.
(Note: More $s_j$ to the end of the ordering of states so $\hat{𝐏}$ is canonical form.)
"""

# ╔═╡ f5b4fda8-16b4-4e2a-bb39-a3f780a10688
md"""
### Example

Flip a fair coin over and over, keeping track of the last flip(s) with states called $h_1, t_1, h_2, t_2$.

$𝐏 = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c c c}
h_1 && t_1 && h_2 && t_2
\end{array} \\
\begin{array}{c}
h_1 \\ t_1 \\ h_2 \\ t_2
\end{array}\hspace{-0.8em} &
\left[
\begin{array}{c c c c}
0 & 1/2 & 1/2 & 0 \\
1/2 & 0 & 0 & 1/2 \\
0 & 1/2 & 1/2 & 0 \\
1/2 & 0 & 0 & 1/2
\end{array}
\right]. \\
\end{array}$

**Q:** What is the mean first passage time to $h_2$ from the other states?
"""

# ╔═╡ 67bcefbb-d43e-4844-96f8-18dfa9d66358
md"""
$\hat{𝐏} = \hspace{0.2em}\begin{array}{c c}
& \begin{array} {c c c c}
h_1 && t_1 && t_2 && h_2
\end{array} \\
\begin{array}{c}
h_1 \\ t_1 \\ t_2 \\ h_2
\end{array}\hspace{-0.8em} &
\left[
\begin{array}{c c c c}
0 & 1/2 & 0 & 1/2 \\
1/2 & 0 & 1/2 & 0 \\
1/2 & 0 & 1/2 & 0 \\
0 & 0 & 0 & 1
\end{array}
\right]. \\
\end{array}$
"""

# ╔═╡ f4a7e902-1e0d-41d6-888f-e7d63e748a13
let
	P = [0 0.5 0 0.5; 0.5 0 0.5 0; 0.5 0 0.5 0; 0 0 0 1]
	Q = P[1:3, 1:3]
	N = inv(I - Q)
	N * ones(3)
end

# ╔═╡ 10b68a42-ba7e-4266-bbf6-28cad9a21796
md"""
The mean time until absorbing is 4 steps from $h_1$, or 6 steps from $t_1$ or $t_2$.
"""

# ╔═╡ be678a68-5e66-414e-8de5-35915f060d1d
md"""
### Observation

1) We have to repeat this process for each state $s_j$ to find all mean first passage times $m_{ij}$.

2) **Definition:** The **mean recurrence time** $r_i$ is the expected number of steps to go from $s_i$ back to $s_i$.

   The method just described can't tell us about $r_{ij}$ since $s_i$ can't be both transient and absorbing in $\hat{𝐏}$.

   To find $r_i$ given that we know all $m_{ji}$:
   $r_i = \sum_j p_{ij} (m_{ji} + 1) = 1  + \sum_j p_{ij} m_{ji}$
"""

# ╔═╡ 5089cd6f-10ac-4eb0-8267-5ce1aae578c4
md"""
### Example

Mean recurrence time for $h_2$.

$\begin{align*}
&= 1 + \sum_j p_{ij} m_{ji}\\
&= 1 + (p_{h_2 t_1} m_{t_1 h_2} + p_{h_2 h_2} m_{h_2 h_2}) \\
&= 1 + (0.5 ⋅ 6 + 0) \\
&= 1 + 3 \\
&= 4
\end{align*}$
"""

# ╔═╡ a8bbd6be-c26b-49e9-ab55-affa5d72e729
md"""
### Definition

Let $X_i$ take values $±1$ with equal probability and let $S_n = X_1 + ⋯ + X_n$.
This is a **random walk on $ℝ$**.

Define

- ``u_{2m}`` = probability of returning to $0$ at time $2m$

- ``f_{2m}`` = probability that $2m$ is the first return time
"""

# ╔═╡ 4a3c8262-1004-40ce-9fea-68eaba5caf10
md"""
### Theorem 12.1

For $m ≥ 1$, $u_{2m} = \begin{pmatrix} 2m \\ m \end{pmatrix} 2^{-2m}$
"""

# ╔═╡ d194c16f-185f-48fb-acfa-5e9e651229bb
md"""
### Theorem 12.2

$u_{2m} = f_0 u_{2m} + f_2 u_{2m - 2} + ⋯ + f_{2m} u_0\;.$

(Note: $u_0 = 1$, $f_0 = 0$)
"""

# ╔═╡ ae7350b7-d4b0-4557-af56-3552101f820c
md"""
### Theorem 12.3

$f_{2m} = \frac{u_{2m}}{2m - 1}$

#### Proof

Let

$U(x) = \sum_{m = 0}^∞ u_{2m} x^m$

$F(x) = \sum_{m = 0}^∞ f_{2m} x^m$

Then:

$\begin{align*}
U(x) F(x) &= f_0 u_0 x^0 + (f_0 u_2 + f_2 u_0) x^1 \\
&⋯ + (f_0 u_4 + f_2 u_2 + f_4 u_0) x^2 \\
&⋯ + ⋯ \\
&⋯ + (f_0 u_{2m} + f_2 u_{2m - 2} + ⋯ + f_{2m} u_0) x^m \\
&⋯ + ⋯ \\
&= U(x) - 1
\end{align*}$

That is,

$U(x) F(x) = U(x) - 1 \implies F(x) = \frac{U(x) - 1}{U(x)}$

By magic:

$\frac{1}{\sqrt{1 - 4y}} = \sum_{m = 0}^∞ \begin{pmatrix} 2m \\ m \end{pmatrix} y^m$

Plug in $y = \frac{1}{4} x$:

$U(x) = \frac{1}{\sqrt{1 - x}} = \sum_{m = 0}^∞ \begin{pmatrix} 2m \\ m \end{pmatrix} \left(\frac{1}{4}\right)^m x^m = \sum_{m = 0}^∞ \begin{pmatrix} 2m \\ m \end{pmatrix} 2^{-2m} x^m$

Now:

$\begin{align*}
F(x) &= \frac{(1 - x)^{-1/2} - 1}{(1 - x)^{-1/2}} \\
&= \frac{(1 - x)^{-1/2}}{(1 - x)^{-1/2}} - \frac{1}{(1 - x)^{-1/2}} \\
&= 1 - (1 - x)^{1/2}
\end{align*}$

$F'(x) = 0 - \frac{1}{2} (1 - x)^{-1/2} ⋅ (-1) = \frac{1}{2 \sqrt{1 - x}} = \frac{U(x)}{2}$

``\displaystyle ∫ \frac{U(x)}{2}`` to find $F(x)$ coefficients.
"""

# ╔═╡ 3a3daa1b-ba3c-45dd-ade0-1164a6874ce3
md"""
### Question

What if $X_i = 1$ with probability $p$ and $X_i = -1$ with probability $q = 1 - p$?

Then $u_{2m} = \begin{pmatrix} 2m \\ m \end{pmatrix} p^m q^m$

Theorem 12.2 is unchanged.

Then plug $y = pqx$ into Wilf's formula:

$\frac{1}{\sqrt{1 - 4pqx}} = \sum_{m = 0}^∞ \begin{pmatrix} 2m \\ m \end{pmatrix} p^m q^m x^m = \text{ new } U(x)$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"
Graphs = "86223c79-3864-5bf0-83f7-82e725a168b6"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
StatsPlots = "f3b207a7-027a-5e70-b257-86293d7955fd"
Turing = "fce5fe82-541a-59a6-adf8-730c64b5f9a0"

[compat]
Distributions = "~0.25.16"
Graphs = "~1.4.1"
PlutoUI = "~0.7.9"
StatsBase = "~0.33.10"
StatsPlots = "~0.14.28"
Turing = "~0.18.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "485ee0867925449198280d4af84bdb46a2a404d0"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.0.1"

[[AbstractMCMC]]
deps = ["BangBang", "ConsoleProgressMonitor", "Distributed", "Logging", "LoggingExtras", "ProgressLogging", "Random", "StatsBase", "TerminalLoggers", "Transducers"]
git-tree-sha1 = "db0a7ff3fbd987055c43b4e12d2fa30aaae8749c"
uuid = "80f14c24-f653-4e6a-9b94-39d6b0f70001"
version = "3.2.1"

[[AbstractPPL]]
deps = ["AbstractMCMC"]
git-tree-sha1 = "15f34cc635546ac072d03fc2cc10083adb4df680"
uuid = "7a57a42e-76ec-4ea3-a279-07e840d6d9cf"
version = "0.2.0"

[[AbstractTrees]]
git-tree-sha1 = "03e0550477d86222521d254b741d470ba17ea0b5"
uuid = "1520ce14-60c1-5f80-bbc7-55ef81b5835c"
version = "0.3.4"

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[AdvancedHMC]]
deps = ["AbstractMCMC", "ArgCheck", "DocStringExtensions", "InplaceOps", "LinearAlgebra", "ProgressMeter", "Random", "Requires", "Setfield", "Statistics", "StatsBase", "StatsFuns", "UnPack"]
git-tree-sha1 = "c71d9da0b0e5183a3410066e6b85670b0ae2bdbe"
uuid = "0bf59076-c3b1-5ca4-86bd-e02cd72cde3d"
version = "0.3.1"

[[AdvancedMH]]
deps = ["AbstractMCMC", "Distributions", "Random", "Requires"]
git-tree-sha1 = "0e09520d3e1b8601cdfc5149672337a45d86025b"
uuid = "5b7e9947-ddc0-4b3f-9b55-0d8042f74170"
version = "0.6.5"

[[AdvancedPS]]
deps = ["AbstractMCMC", "Distributions", "Libtask", "Random", "StatsFuns"]
git-tree-sha1 = "06da6c283cf17cf0f97ed2c07c29b6333ee83dc9"
uuid = "576499cb-2369-40b2-a588-c64705576edc"
version = "0.2.4"

[[AdvancedVI]]
deps = ["Bijectors", "Distributions", "DistributionsAD", "DocStringExtensions", "ForwardDiff", "LinearAlgebra", "ProgressMeter", "Random", "Requires", "StatsBase", "StatsFuns", "Tracker"]
git-tree-sha1 = "130d6b17a3a9d420d9a6b37412cae03ffd6a64ff"
uuid = "b5ca4192-6429-45e5-a2d9-87aec30a685c"
version = "0.1.3"

[[ArgCheck]]
git-tree-sha1 = "dedbbb2ddb876f899585c4ec4433265e3017215a"
uuid = "dce04be8-c92d-5529-be00-80e4d2c0e197"
version = "2.1.0"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[ArnoldiMethod]]
deps = ["LinearAlgebra", "Random", "StaticArrays"]
git-tree-sha1 = "62e51b39331de8911e4a7ff6f5aaf38a5f4cc0ae"
uuid = "ec485272-7323-5ecc-a04f-4719b315124d"
version = "0.2.0"

[[Arpack]]
deps = ["Arpack_jll", "Libdl", "LinearAlgebra"]
git-tree-sha1 = "2ff92b71ba1747c5fdd541f8fc87736d82f40ec9"
uuid = "7d9fca2a-8960-54d3-9f78-7d1dccf2cb97"
version = "0.4.0"

[[Arpack_jll]]
deps = ["Libdl", "OpenBLAS_jll", "Pkg"]
git-tree-sha1 = "e214a9b9bd1b4e1b4f15b22c0994862b66af7ff7"
uuid = "68821587-b530-5797-8361-c406ea357684"
version = "3.5.0+3"

[[ArrayInterface]]
deps = ["IfElse", "LinearAlgebra", "Requires", "SparseArrays", "Static"]
git-tree-sha1 = "d84c956c4c0548b4caf0e4e96cf5b6494b5b1529"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "3.1.32"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "a4d07a1c313392a77042855df46c5f534076fab9"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.0"

[[AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "d127d5e4d86c7680b20c35d40b503c74b9a39b5e"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.4"

[[BangBang]]
deps = ["Compat", "ConstructionBase", "Future", "InitialValues", "LinearAlgebra", "Requires", "Setfield", "Tables", "ZygoteRules"]
git-tree-sha1 = "e239020994123f08905052b9603b4ca14f8c5807"
uuid = "198e06fe-97b7-11e9-32a5-e1d131e6ad66"
version = "0.3.31"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Baselet]]
git-tree-sha1 = "aebf55e6d7795e02ca500a689d326ac979aaf89e"
uuid = "9718e550-a3fa-408a-8086-8db961cd8217"
version = "0.1.1"

[[Bijectors]]
deps = ["ArgCheck", "ChainRulesCore", "Compat", "Distributions", "Functors", "IrrationalConstants", "LinearAlgebra", "LogExpFunctions", "MappedArrays", "NonlinearSolve", "Random", "Reexport", "Requires", "SparseArrays", "Statistics"]
git-tree-sha1 = "dca5e02c9426b2f8ce86d8e723d0702ff33df234"
uuid = "76274a88-744f-5084-9051-94815aaf08c4"
version = "0.9.8"

[[BitTwiddlingConvenienceFunctions]]
deps = ["Static"]
git-tree-sha1 = "652aab0fc0d6d4db4cc726425cadf700e9f473f1"
uuid = "62783981-4cbd-42fc-bca8-16325de8dc4b"
version = "0.1.0"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[CPUSummary]]
deps = ["Hwloc", "IfElse", "Static"]
git-tree-sha1 = "ed720e2622820bf584d4ad90e6fcb93d95170b44"
uuid = "2a0fbf3d-bb9c-48f3-b0a9-814d99fd7ab9"
version = "0.1.3"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "f2202b55d816427cd385a9a4f3ffb226bee80f99"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+0"

[[ChainRules]]
deps = ["ChainRulesCore", "Compat", "LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "d88340ab502af66cfffc821e70ae72f7dbdce645"
uuid = "082447d4-558c-5d27-93f4-14fc19e9eca2"
version = "1.11.5"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "4ce9393e871aca86cc457d9f66976c3da6902ea7"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.4.0"

[[CloseOpenIntervals]]
deps = ["ArrayInterface", "Static"]
git-tree-sha1 = "ce9c0d07ed6e1a4fecd2df6ace144cbd29ba6f37"
uuid = "fb6a15b2-703c-40df-9091-08a04967cfa9"
version = "0.1.2"

[[Clustering]]
deps = ["Distances", "LinearAlgebra", "NearestNeighbors", "Printf", "SparseArrays", "Statistics", "StatsBase"]
git-tree-sha1 = "75479b7df4167267d75294d14b58244695beb2ac"
uuid = "aaaa29a8-35af-508c-8bc3-b662a17a0fe5"
version = "0.14.2"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "a851fec56cb73cfdf43762999ec72eff5b86882a"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.15.0"

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

[[Combinatorics]]
git-tree-sha1 = "08c8b6831dc00bfea825826be0bc8336fc369860"
uuid = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
version = "1.0.2"

[[CommonSolve]]
git-tree-sha1 = "68a0743f578349ada8bc911a5cbd5a2ef6ed6d1f"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.0"

[[CommonSubexpressions]]
deps = ["MacroTools", "Test"]
git-tree-sha1 = "7b8a93dba8af7e3b42fecabf646260105ac373f7"
uuid = "bbf7d656-a473-5ed7-a52c-81e309532950"
version = "0.3.0"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "4866e381721b30fac8dda4c8cb1d9db45c8d2994"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.37.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[CompositionsBase]]
git-tree-sha1 = "455419f7e328a1a2493cabc6428d79e951349769"
uuid = "a33af91c-f02d-484b-be07-31d278c5ca2b"
version = "0.1.1"

[[ConsoleProgressMonitor]]
deps = ["Logging", "ProgressMeter"]
git-tree-sha1 = "3ab7b2136722890b9af903859afcf457fa3059e8"
uuid = "88cd18e8-d9cc-4ea6-8889-5259c0d15c8b"
version = "0.1.2"

[[ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f74e9d5388b8620b4cee35d4c5a618dd4dc547f4"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.0"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[Crayons]]
git-tree-sha1 = "3f71217b538d7aaee0b69ab47d9b7724ca8afa0d"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.0.4"

[[DataAPI]]
git-tree-sha1 = "bec2532f8adb82005476c141ec23e921fc20971b"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.8.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[DataValues]]
deps = ["DataValueInterfaces", "Dates"]
git-tree-sha1 = "d88a19299eba280a6d062e135a43f00323ae70bf"
uuid = "e7dc6d0d-1eca-5fa6-8ad6-5aecde8b7ea5"
version = "0.4.13"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DefineSingletons]]
git-tree-sha1 = "77b4ca280084423b728662fe040e5ff8819347c5"
uuid = "244e2a9f-e319-4986-a169-4d1fe445cd52"
version = "0.1.1"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[DiffResults]]
deps = ["StaticArrays"]
git-tree-sha1 = "c18e98cba888c6c25d1c3b048e4b3380ca956805"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.0.3"

[[DiffRules]]
deps = ["NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "3ed8fa7178a10d1cd0f1ca524f249ba6937490c0"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.3.0"

[[Distances]]
deps = ["LinearAlgebra", "Statistics", "StatsAPI"]
git-tree-sha1 = "9f46deb4d4ee4494ffb5a40a27a2aced67bdd838"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.4"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Distributions]]
deps = ["ChainRulesCore", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns"]
git-tree-sha1 = "f4efaa4b5157e0cdb8283ae0b5428bc9208436ed"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.16"

[[DistributionsAD]]
deps = ["Adapt", "ChainRules", "ChainRulesCore", "Compat", "DiffRules", "Distributions", "FillArrays", "LinearAlgebra", "NaNMath", "PDMats", "Random", "Requires", "SpecialFunctions", "StaticArrays", "StatsBase", "StatsFuns", "ZygoteRules"]
git-tree-sha1 = "e1703f8c9ec58c7f6a4e97a811079c31cbbb7168"
uuid = "ced4e74d-a319-5a8a-b0ac-84af2272839c"
version = "0.6.31"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "a32185f5428d3986f47c2ab78b1f216d5e6cc96f"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.5"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[DynamicPPL]]
deps = ["AbstractMCMC", "AbstractPPL", "BangBang", "Bijectors", "ChainRulesCore", "Distributions", "MacroTools", "Random", "ZygoteRules"]
git-tree-sha1 = "532397f64ad49472fb60e328369ecd5dedeff02f"
uuid = "366bfd00-2699-11ea-058f-f148b4cae6d8"
version = "0.15.1"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[EllipsisNotation]]
deps = ["ArrayInterface"]
git-tree-sha1 = "8041575f021cba5a099a456b4163c9a08b566a02"
uuid = "da5c29d0-fa7d-589e-88eb-ea29b0a81949"
version = "1.1.0"

[[EllipticalSliceSampling]]
deps = ["AbstractMCMC", "ArrayInterface", "Distributions", "Random", "Statistics"]
git-tree-sha1 = "254182080498cce7ae4bc863d23bf27c632688f7"
uuid = "cad2338a-1db2-11e9-3401-43bc07c9ede2"
version = "0.4.4"

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
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[FFTW]]
deps = ["AbstractFFTs", "FFTW_jll", "LinearAlgebra", "MKL_jll", "Preferences", "Reexport"]
git-tree-sha1 = "463cb335fa22c4ebacfd1faba5fde14edb80d96c"
uuid = "7a1cc6ca-52ef-59f5-83cd-3a7055c09341"
version = "1.4.5"

[[FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c6033cc3892d0ef5bb9cd29b7f2f0331ea5184ea"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.10+0"

[[FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "caf289224e622f518c9dbfe832cdafa17d7c80a6"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.4"

[[FiniteDiff]]
deps = ["ArrayInterface", "LinearAlgebra", "Requires", "SparseArrays", "StaticArrays"]
git-tree-sha1 = "8b3c09b56acaf3c0e581c66638b85c8650ee9dca"
uuid = "6a86dc24-6348-571c-b903-95158fe2bd41"
version = "2.8.1"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "NaNMath", "Printf", "Random", "SpecialFunctions", "StaticArrays"]
git-tree-sha1 = "b5e930ac60b613ef3406da6d4f42c35d8dc51419"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.19"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[Functors]]
git-tree-sha1 = "e2727f02325451f6b24445cd83bfa9aaac19cbe7"
uuid = "d9f16b24-f501-4c13-a1f2-28368ffc5196"
version = "0.2.5"

[[Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "0c603255764a1fa0b61752d2bec14cfbd18f7fe8"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+1"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "d189c6d2004f63fd3c91748c458b09f26de0efaa"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.61.0"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "cafe0823979a5c9bff86224b3b8de29ea5a44b2e"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.61.0+0"

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

[[Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[Graphs]]
deps = ["ArnoldiMethod", "DataStructures", "Distributed", "Inflate", "LinearAlgebra", "Random", "SharedArrays", "SimpleTraits", "SparseArrays", "Statistics"]
git-tree-sha1 = "92243c07e786ea3458532e199eb3feee0e7e08eb"
uuid = "86223c79-3864-5bf0-83f7-82e725a168b6"
version = "1.4.1"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "14eece7a3308b4d8be910e265c724a6ba51a9798"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.16"

[[HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[HostCPUFeatures]]
deps = ["BitTwiddlingConvenienceFunctions", "IfElse", "Libdl", "Static"]
git-tree-sha1 = "3169c8b31863f9a409be1d17693751314241e3eb"
uuid = "3e5b6fbb-0976-4d2c-9146-d79de83f2fb0"
version = "0.1.4"

[[Hwloc]]
deps = ["Hwloc_jll"]
git-tree-sha1 = "92d99146066c5c6888d5a3abc871e6a214388b91"
uuid = "0e44f5e4-bd66-52a0-8798-143a42290a1d"
version = "2.0.0"

[[Hwloc_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3395d4d4aeb3c9d31f5929d32760d8baeee88aaf"
uuid = "e33a78d0-f292-5ffc-b300-72abe9b543c8"
version = "2.5.0+0"

[[IfElse]]
git-tree-sha1 = "28e837ff3e7a6c3cdb252ce49fb412c8eb3caeef"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.0"

[[Inflate]]
git-tree-sha1 = "f5fc07d4e706b84f72d54eedcc1c13d92fb0871c"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.2"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InitialValues]]
git-tree-sha1 = "26c8832afd63ac558b98a823265856670d898b6c"
uuid = "22cec73e-a1b8-11e9-2c92-598750a2cf9c"
version = "0.2.10"

[[InplaceOps]]
deps = ["LinearAlgebra", "Test"]
git-tree-sha1 = "50b41d59e7164ab6fda65e71049fee9d890731ff"
uuid = "505f98c9-085e-5b2c-8e89-488be7bf1f34"
version = "0.3.0"

[[IntelOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d979e54b71da82f3a65b62553da4fc3d18c9004c"
uuid = "1d5cc7b8-4909-519e-a0f8-d0f5ad9712d0"
version = "2018.0.3+2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[Interpolations]]
deps = ["AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "61aa005707ea2cebf47c8d780da8dc9bc4e0c512"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.13.4"

[[IntervalSets]]
deps = ["Dates", "EllipsisNotation", "Statistics"]
git-tree-sha1 = "3cc368af3f110a767ac786560045dceddfc16758"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.5.3"

[[InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[IrrationalConstants]]
git-tree-sha1 = "f76424439413893a832026ca355fe273e93bce94"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.0"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[IterativeSolvers]]
deps = ["LinearAlgebra", "Printf", "Random", "RecipesBase", "SparseArrays"]
git-tree-sha1 = "1a8c6237e78b714e901e406c096fc8a65528af7d"
uuid = "42fd0dbc-a981-5370-80f2-aaf504508153"
version = "0.9.1"

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

[[KernelDensity]]
deps = ["Distributions", "DocStringExtensions", "FFTW", "Interpolations", "StatsBase"]
git-tree-sha1 = "591e8dc09ad18386189610acafb970032c519707"
uuid = "5ab0869b-81aa-558d-bb23-cbf5423bbe9b"
version = "0.6.3"

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
git-tree-sha1 = "95d36f32dde312e694c1de5714821efc4b010815"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.7"

[[LayoutPointers]]
deps = ["ArrayInterface", "LinearAlgebra", "ManualMemory", "SIMDTypes", "Static"]
git-tree-sha1 = "d2bda6aa0b03ce6f141a2dc73d0bcb7070131adc"
uuid = "10f19ff3-798f-405d-979b-55457f8fc047"
version = "0.1.3"

[[LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

[[LeftChildRightSiblingTrees]]
deps = ["AbstractTrees"]
git-tree-sha1 = "71be1eb5ad19cb4f61fa8c73395c0338fd092ae0"
uuid = "1d6d02ad-be62-4b6b-8a6d-2f90e265016e"
version = "0.1.2"

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

[[Libtask]]
deps = ["Libtask_jll", "LinearAlgebra", "Statistics"]
git-tree-sha1 = "90c6ed7f9ac449cddacd80d5c1fca59c97d203e7"
uuid = "6f1fad26-d15e-5dc8-ae53-837a1d7b8c9f"
version = "0.5.3"

[[Libtask_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "901fc8752bbc527a6006a951716d661baa9d54e9"
uuid = "3ae2931a-708c-5973-9c38-ccf7496fb450"
version = "0.4.3+0"

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

[[LogExpFunctions]]
deps = ["ChainRulesCore", "DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "34dc30f868e368f8a17b728a1238f3fcda43931a"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.3"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "dfeda1c1130990428720de0024d4516b1902ce98"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "0.4.7"

[[LoopVectorization]]
deps = ["ArrayInterface", "CPUSummary", "CloseOpenIntervals", "DocStringExtensions", "HostCPUFeatures", "IfElse", "LayoutPointers", "LinearAlgebra", "OffsetArrays", "PolyesterWeave", "Requires", "SLEEFPirates", "Static", "ThreadingUtilities", "UnPack", "VectorizationBase"]
git-tree-sha1 = "d469fcf148475a74c221f14d42ee75da7ccb3b4e"
uuid = "bdcacae8-1622-11e9-2a5c-532679323890"
version = "0.12.73"

[[MCMCChains]]
deps = ["AbstractMCMC", "AxisArrays", "Compat", "Dates", "Distributions", "Formatting", "IteratorInterfaceExtensions", "KernelDensity", "LinearAlgebra", "MCMCDiagnosticTools", "MLJModelInterface", "NaturalSort", "OrderedCollections", "PrettyTables", "Random", "RecipesBase", "Serialization", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "TableTraits", "Tables"]
git-tree-sha1 = "04c3fd6da28ebd305120ffb05f0a3b8f9baced0a"
uuid = "c7f686f2-ff18-58e9-bc7b-31028e88f75d"
version = "5.0.1"

[[MCMCDiagnosticTools]]
deps = ["AbstractFFTs", "DataAPI", "Distributions", "LinearAlgebra", "MLJModelInterface", "Random", "SpecialFunctions", "Statistics", "StatsBase", "Tables"]
git-tree-sha1 = "f6ab1e254e51ddebf9bcb45301625224291ca8e0"
uuid = "be115224-59cd-429b-ad48-344e309966f0"
version = "0.1.0"

[[MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "5455aef09b40e5020e1520f551fa3135040d4ed0"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2021.1.1+2"

[[MLJModelInterface]]
deps = ["Random", "ScientificTypesBase", "StatisticalTraits"]
git-tree-sha1 = "1b780b191a65dbefc42d2a225850d20b243dde88"
uuid = "e80e1ace-859a-464e-9ed9-23947d8ae3ea"
version = "1.3.0"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "5a5bc6bf062f0f95e62d0fe0a2d99699fed82dd9"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.8"

[[ManualMemory]]
git-tree-sha1 = "9cb207b18148b2199db259adfa923b45593fe08e"
uuid = "d125e4d3-2237-4719-b19c-fa641b8a4667"
version = "0.1.6"

[[MappedArrays]]
git-tree-sha1 = "e8b359ef06ec72e8c030463fe02efe5527ee5142"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.1"

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

[[MicroCollections]]
deps = ["BangBang", "Setfield"]
git-tree-sha1 = "e991b6a9d38091c4a0d7cd051fcb57c05f98ac03"
uuid = "128add7d-3638-4c79-886c-908ea0c25c34"
version = "0.1.0"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[MultivariateStats]]
deps = ["Arpack", "LinearAlgebra", "SparseArrays", "Statistics", "StatsBase"]
git-tree-sha1 = "8d958ff1854b166003238fe191ec34b9d592860a"
uuid = "6f286f6a-111f-5878-ab1e-185364afe411"
version = "0.8.0"

[[NNlib]]
deps = ["Adapt", "ChainRulesCore", "Compat", "LinearAlgebra", "Pkg", "Requires", "Statistics"]
git-tree-sha1 = "5203a4532ad28c44f82c76634ad621d7c90abcbd"
uuid = "872c559c-99b0-510c-b3b7-b6c96a88d5cd"
version = "0.7.29"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NamedArrays]]
deps = ["Combinatorics", "DataStructures", "DelimitedFiles", "InvertedIndices", "LinearAlgebra", "Random", "Requires", "SparseArrays", "Statistics"]
git-tree-sha1 = "2fd5787125d1a93fbe30961bd841707b8a80d75b"
uuid = "86f7a689-2022-50b4-a561-43c23ac3c673"
version = "0.9.6"

[[NaturalSort]]
git-tree-sha1 = "eda490d06b9f7c00752ee81cfa451efe55521e21"
uuid = "c020b1a1-e9b0-503a-9c33-f039bfc54a85"
version = "1.0.0"

[[NearestNeighbors]]
deps = ["Distances", "StaticArrays"]
git-tree-sha1 = "16baacfdc8758bc374882566c9187e785e85c2f0"
uuid = "b8a86587-4115-5ab1-83bc-aa920d37bbce"
version = "0.4.9"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[NonlinearSolve]]
deps = ["ArrayInterface", "FiniteDiff", "ForwardDiff", "IterativeSolvers", "LinearAlgebra", "RecursiveArrayTools", "RecursiveFactorization", "Reexport", "SciMLBase", "Setfield", "StaticArrays", "UnPack"]
git-tree-sha1 = "e9ffc92217b8709e0cf7b8808f6223a4a0936c95"
uuid = "8913a72c-1f9b-4ce2-8d82-65094dcecaec"
version = "0.3.11"

[[Observables]]
git-tree-sha1 = "fe29afdef3d0c4a8286128d4e45cc50621b1e43d"
uuid = "510215fc-4207-5dde-b226-833fc4488ee2"
version = "0.4.0"

[[OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "c870a0d713b51e4b49be6432eff0e26a4325afee"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.10.6"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

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

[[PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "4dd403333bcf0909341cfe57ec115152f937d7d8"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.1"

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
git-tree-sha1 = "b084324b4af5a438cd63619fd006614b3b20b87b"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.15"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs"]
git-tree-sha1 = "ba43b248a1f04a9667ca4a9f782321d9211aa68e"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.22.6"

[[PlutoUI]]
deps = ["Base64", "Dates", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "44e225d5837e2a2345e69a1d1e01ac2443ff9fcb"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.9"

[[Polyester]]
deps = ["ArrayInterface", "BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "ManualMemory", "PolyesterWeave", "Requires", "Static", "StrideArraysCore", "ThreadingUtilities"]
git-tree-sha1 = "74d358e649e0450cb5d3ff54ca7c8d806ed62765"
uuid = "f517fe37-dbe3-4b94-8317-1923a5111588"
version = "0.5.1"

[[PolyesterWeave]]
deps = ["BitTwiddlingConvenienceFunctions", "CPUSummary", "IfElse", "Static", "ThreadingUtilities"]
git-tree-sha1 = "371a19bb801c1b420b29141750f3a34d6c6634b9"
uuid = "1d0040c9-8b98-4ee7-8388-3f51789ca0ad"
version = "0.1.0"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "0d1245a357cc61c8cd61934c07447aa569ff22e6"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.1.0"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[ProgressLogging]]
deps = ["Logging", "SHA", "UUIDs"]
git-tree-sha1 = "80d919dee55b9c50e8d9e2da5eeafff3fe58b539"
uuid = "33c8b6b6-d38a-422a-b730-caa89a2f386c"
version = "0.1.4"

[[ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "afadeba63d90ff223a6a48d2009434ecee2ec9e8"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.1"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "78aadffb3efd2155af139781b8a8df1ef279ea39"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.4.2"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[Ratios]]
deps = ["Requires"]
git-tree-sha1 = "7dff99fbc740e2f8228c6878e2aad6d7c2678098"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.1"

[[RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "7ad0dfa8d03b7bcf8c597f59f5292801730c55b8"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.4.1"

[[RecursiveArrayTools]]
deps = ["ArrayInterface", "ChainRulesCore", "DocStringExtensions", "LinearAlgebra", "RecipesBase", "Requires", "StaticArrays", "Statistics", "ZygoteRules"]
git-tree-sha1 = "00bede2eb099dcc1ddc3f9ec02180c326b420ee2"
uuid = "731186ca-8d62-57ce-b412-fbd966d074cd"
version = "2.17.2"

[[RecursiveFactorization]]
deps = ["LinearAlgebra", "LoopVectorization", "Polyester", "StrideArraysCore", "TriangularSolve"]
git-tree-sha1 = "575c18c6b00ce409f75d96fefe33ebe01575457a"
uuid = "f2c3362d-daeb-58d1-803e-2bc74f2840b4"
version = "0.2.4"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[SIMDTypes]]
git-tree-sha1 = "330289636fb8107c5f32088d2741e9fd7a061a5c"
uuid = "94e857df-77ce-4151-89e5-788b33177be4"
version = "0.1.0"

[[SLEEFPirates]]
deps = ["IfElse", "Static", "VectorizationBase"]
git-tree-sha1 = "947491c30d4293bebb00781bcaf787ba09e7c20d"
uuid = "476501e8-09a2-5ece-8869-fb82de89a1fa"
version = "0.6.26"

[[SciMLBase]]
deps = ["ArrayInterface", "CommonSolve", "ConstructionBase", "Distributed", "DocStringExtensions", "IteratorInterfaceExtensions", "LinearAlgebra", "Logging", "RecipesBase", "RecursiveArrayTools", "StaticArrays", "Statistics", "Tables", "TreeViews"]
git-tree-sha1 = "ff686e0c79dbe91767f4c1e44257621a5455b1c6"
uuid = "0bca4576-84f4-4d90-8ffe-ffa030f20462"
version = "1.18.7"

[[ScientificTypesBase]]
git-tree-sha1 = "9c1a0dea3b442024c54ca6a318e8acf842eab06f"
uuid = "30f210dd-8aff-4c5f-94ba-8e64358c1161"
version = "2.2.0"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "54f37736d8934a12a200edea2f9206b03bdf3159"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.7"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "Requires"]
git-tree-sha1 = "fca29e68c5062722b5b4435594c3d1ba557072a3"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "0.7.1"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

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

[[SpecialFunctions]]
deps = ["ChainRulesCore", "LogExpFunctions", "OpenSpecFun_jll"]
git-tree-sha1 = "a322a9493e49c5f3a10b50df3aedaf1cdb3244b7"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.6.1"

[[SplittablesBase]]
deps = ["Setfield", "Test"]
git-tree-sha1 = "edef25a158db82f4940720ebada14a60ef6c4232"
uuid = "171d559e-b47b-412a-8079-5efa626c420e"
version = "0.1.13"

[[Static]]
deps = ["IfElse"]
git-tree-sha1 = "a8f30abc7c64a39d389680b74e749cf33f872a70"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "0.3.3"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3240808c6d463ac46f1c1cd7638375cd22abbccb"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.12"

[[StatisticalTraits]]
deps = ["ScientificTypesBase"]
git-tree-sha1 = "730732cae4d3135e2f2182bd47f8d8b795ea4439"
uuid = "64bff920-2084-43da-a3e6-9bb72801c0c9"
version = "2.1.0"

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

[[StatsFuns]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "46d7ccc7104860c38b11966dd1f72ff042f382e4"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.10"

[[StatsPlots]]
deps = ["Clustering", "DataStructures", "DataValues", "Distributions", "Interpolations", "KernelDensity", "LinearAlgebra", "MultivariateStats", "Observables", "Plots", "RecipesBase", "RecipesPipeline", "Reexport", "StatsBase", "TableOperations", "Tables", "Widgets"]
git-tree-sha1 = "eb007bb78d8a46ab98cd14188e3cec139a4476cf"
uuid = "f3b207a7-027a-5e70-b257-86293d7955fd"
version = "0.14.28"

[[StrideArraysCore]]
deps = ["ArrayInterface", "CloseOpenIntervals", "IfElse", "LayoutPointers", "ManualMemory", "Requires", "SIMDTypes", "Static", "ThreadingUtilities"]
git-tree-sha1 = "1258e25e171aec339866f283a11e7d75867e77d7"
uuid = "7792a7ef-975c-4747-a70f-980b88e8d1da"
version = "0.2.4"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "2ce41e0d042c60ecd131e9fb7154a3bfadbf50d3"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.3"

[[SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableOperations]]
deps = ["SentinelArrays", "Tables", "Test"]
git-tree-sha1 = "019acfd5a4a6c5f0f38de69f2ff7ed527f1881da"
uuid = "ab02a1b2-a7df-11e8-156e-fb1833f50b87"
version = "1.1.0"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "1162ce4a6c4b7e31e0e6b14486a6986951c73be9"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.5.2"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[TerminalLoggers]]
deps = ["LeftChildRightSiblingTrees", "Logging", "Markdown", "Printf", "ProgressLogging", "UUIDs"]
git-tree-sha1 = "d620a061cb2a56930b52bdf5cf908a5c4fa8e76a"
uuid = "5d786b92-1e48-4d6f-9151-6b4477ca9bed"
version = "0.1.4"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[ThreadingUtilities]]
deps = ["ManualMemory"]
git-tree-sha1 = "03013c6ae7f1824131b2ae2fc1d49793b51e8394"
uuid = "8290d209-cae3-49c0-8002-c8c24d57dab5"
version = "0.4.6"

[[Tracker]]
deps = ["Adapt", "DiffRules", "ForwardDiff", "LinearAlgebra", "MacroTools", "NNlib", "NaNMath", "Printf", "Random", "Requires", "SpecialFunctions", "Statistics"]
git-tree-sha1 = "bf4adf36062afc921f251af4db58f06235504eff"
uuid = "9f7883ad-71c0-57eb-9f7f-b5c9e6d3789c"
version = "0.2.16"

[[Transducers]]
deps = ["Adapt", "ArgCheck", "BangBang", "Baselet", "CompositionsBase", "DefineSingletons", "Distributed", "InitialValues", "Logging", "Markdown", "MicroCollections", "Requires", "Setfield", "SplittablesBase", "Tables"]
git-tree-sha1 = "34f27ac221cb53317ab6df196f9ed145077231ff"
uuid = "28d57a85-8fef-5791-bfe6-a80928e7c999"
version = "0.4.65"

[[TreeViews]]
deps = ["Test"]
git-tree-sha1 = "8d0d7a3fe2f30d6a7f833a5f19f7c7a5b396eae6"
uuid = "a2a6695c-b41b-5b7d-aed9-dbfdeacea5d7"
version = "0.3.0"

[[TriangularSolve]]
deps = ["CloseOpenIntervals", "IfElse", "LayoutPointers", "LinearAlgebra", "LoopVectorization", "Polyester", "Static", "VectorizationBase"]
git-tree-sha1 = "ed55426a514db35f58d36c3812aae89cfc057401"
uuid = "d5829a12-d9aa-46ab-831f-fb7c9ab06edf"
version = "0.1.6"

[[Turing]]
deps = ["AbstractMCMC", "AdvancedHMC", "AdvancedMH", "AdvancedPS", "AdvancedVI", "BangBang", "Bijectors", "DataStructures", "Distributions", "DistributionsAD", "DocStringExtensions", "DynamicPPL", "EllipticalSliceSampling", "ForwardDiff", "Libtask", "LinearAlgebra", "MCMCChains", "NamedArrays", "Printf", "Random", "Reexport", "Requires", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Tracker", "ZygoteRules"]
git-tree-sha1 = "e22a11c2029137b35adf00a0e4842707c653938c"
uuid = "fce5fe82-541a-59a6-adf8-730c64b5f9a0"
version = "0.18.0"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[VectorizationBase]]
deps = ["ArrayInterface", "CPUSummary", "HostCPUFeatures", "Hwloc", "IfElse", "LayoutPointers", "Libdl", "LinearAlgebra", "SIMDTypes", "Static"]
git-tree-sha1 = "39c6e517759c70eebb1963f729243ac0ebdeb750"
uuid = "3d5dd08c-fd9d-11e8-17fa-ed2836048c2f"
version = "0.21.8"

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

[[Widgets]]
deps = ["Colors", "Dates", "Observables", "OrderedCollections"]
git-tree-sha1 = "80661f59d28714632132c73779f8becc19a113f2"
uuid = "cc8bc4a8-27d6-5769-a93b-9d913e69aa62"
version = "0.6.4"

[[WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "59e2ad8fd1591ea019a5259bd012d7aee15f995c"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.3"

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

[[ZygoteRules]]
deps = ["MacroTools"]
git-tree-sha1 = "9e7a1e8ca60b742e508a315c17eef5211e7fbfd7"
uuid = "700de1a5-db45-46bc-99cf-38207098b444"
version = "0.2.1"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

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
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─4fd14263-e23a-40af-bd26-560a557d9958
# ╟─74bd45a0-a70d-41dc-a861-b58c3fcfea4d
# ╟─738cd501-3ef5-47fe-9877-e9d7274dfc26
# ╟─dcfd90f2-7166-4c32-b9b4-c9f5d6ea06e5
# ╟─7747ba8e-6739-4735-a0c0-0f60d152320a
# ╟─0d04dd73-578c-49f5-bc93-934a0484f877
# ╟─e3241831-8e6f-4113-9886-80a13ad9c24b
# ╟─3ef25269-1f20-4d06-8cd6-12497374a268
# ╟─4d547011-5ab7-4fee-996d-79be10b9ea7e
# ╟─eada22fa-d2f6-42b1-9fad-f121bde7b4f2
# ╟─d0f67f5b-e9f3-4ce0-bfa8-f7ebbd11eea8
# ╟─cb4f684c-4716-46cf-b8c7-5dfa5f59e82b
# ╟─546840f0-757f-4a79-af85-dafa4bdb20bc
# ╟─6c12e369-5d92-4f2d-9e58-e86aef4ceaa4
# ╟─2b928c78-326a-4359-8aee-47f2a5fb6b2b
# ╟─dcca9c09-2477-4cf3-9ace-d3960da2647e
# ╟─3fe4496b-77de-4f63-8d51-55da786f2d41
# ╟─bf93a4e4-fe01-49be-963b-b89200a58ecc
# ╟─b4441b33-13cd-48ae-b5ef-841f2b4c3404
# ╟─18729755-5a19-4a63-8edc-cf73a8cf84c3
# ╠═9d745575-0b48-46db-bb25-88213fb5da40
# ╟─672f02cd-d9ee-4f88-8ac0-0f31d825a7dd
# ╠═a09cb20f-2c46-4611-8051-b2a95df8d6c4
# ╟─07f25a09-1726-40f8-a29c-4d3bb39501f9
# ╠═5d566dc2-cc91-4224-a800-a23a657aad23
# ╟─aa1be24e-e516-42de-8cd5-42a2a253a1a3
# ╟─5f4aa98e-2a86-4e5a-9cdf-6e8b995384c3
# ╟─a1f878da-60e3-4071-a37e-3a9f9504e189
# ╟─7f6d0210-15dc-4ded-8acb-abff9a41ef8f
# ╟─cd021f2b-5f94-45a6-b7f4-893488639d79
# ╟─aa99031e-f015-4611-862d-af9f8c04238e
# ╟─3cd4694a-3557-40b1-9e23-6c244f0dc1ca
# ╟─acc59503-608c-4296-a014-f4196cb2ba78
# ╠═60be6148-b310-4e9d-b409-587116bfdd56
# ╟─fd4bd85e-0a40-4d3b-ac17-2aab421a7e53
# ╟─9e8e4ab9-df33-40ba-bbba-5252150ef7d3
# ╟─2d4a4881-1f82-46ca-bfc3-e652ebfe270f
# ╟─702200c3-061c-46a2-a2b8-25dd8308b71b
# ╟─e5d63fb2-4269-421a-af62-cb251e944dad
# ╟─ee02b7b5-23ae-4e6d-9de0-f929bfe5d468
# ╟─f0c12aeb-caf4-4a31-87ac-289728d8c02f
# ╟─a783612e-80c3-4e94-8144-49785508752b
# ╟─8a77d3c9-6793-4984-b3a7-6670f64fa906
# ╟─33cb0291-29bd-4c91-9e66-7723ba6dfeb8
# ╟─9d3634a4-887e-4f29-ab37-e02ec36a7018
# ╟─73d1be03-401a-418e-acda-67f9e377d45d
# ╟─74183c27-1dec-45ce-aa84-0e613ecc8143
# ╟─089bfad6-8407-4f40-bef9-f9a6fdee6e86
# ╟─58065c15-333d-4044-a666-1254d59b1f7b
# ╟─a9d58e9e-03f5-413a-a6a3-fbce6e717f73
# ╟─889cbadd-54a0-4fe7-8062-73b8e64d4045
# ╟─46473ebc-40bd-4406-a667-e5f4a5a81d33
# ╟─a671fe7f-0ddb-4136-96ae-5d2f6735d5fa
# ╠═4eca57d2-b3ee-4314-81c2-3b0c38e83904
# ╠═895646b1-6109-4498-b40f-29a8413cb247
# ╠═7ffb646b-7ea8-42e7-937b-aef5cd2cc013
# ╠═5214f0c7-fe6c-4ad0-8f37-72477102d37c
# ╠═15d8d803-07db-4f6f-825c-06dafc4d7ef4
# ╠═f8ba2c86-c691-4266-a06c-0fd2fc80c0da
# ╠═0b75eac8-13b1-4263-86b7-8b3c0bc202a1
# ╠═c79ca4a4-89ff-4bc7-a3be-bc147eb7f3e5
# ╟─82c03bd2-89df-42f7-a832-c14e52e0ec0d
# ╠═51558f28-d3e8-48b1-b484-aaf000f9f1eb
# ╟─d64ca3bc-8d1c-44bf-9380-9bee00870594
# ╟─87341e1a-c742-4895-a207-7a133f499f0e
# ╟─a8080744-7f74-478f-bf98-6c598fca4ab4
# ╠═be96b973-22b2-496f-bd8a-d82e4862c2a4
# ╟─a8a4593d-8ed0-407b-9306-011d82cb9dd7
# ╟─edad4144-5bec-4cfd-b1fe-7fdd45b302cc
# ╟─b1fc24c7-ac2e-44f4-930b-7161541bfe6c
# ╟─301d5354-2fb9-4726-8230-76189a742139
# ╟─7772f73c-48d8-44d8-a810-9452520b9f35
# ╟─b7c86d6a-2542-46d5-89ba-8032d626720b
# ╟─896fe8f1-f227-48af-b88d-4086425d49a9
# ╟─bc19a731-f8b3-4822-b691-73215509862f
# ╟─cbeb2753-ccd1-42df-9f5a-5d31d2f87371
# ╟─c25e33fd-e00f-47ee-a526-21039f392e9e
# ╟─855ca197-bc37-4841-a1b0-90b8665b400a
# ╟─c5ba6590-831e-43d0-b159-fe01ef5679d9
# ╟─d9441f6c-768b-4163-9d0d-3f0c25f8abe9
# ╟─e239a3c7-f4f6-4e0f-901b-df72fc3dfd38
# ╠═45f354fd-5957-4d78-b188-dc69a4499794
# ╟─81da8f90-44c2-47e5-84e4-f80cc3c0dbb6
# ╟─f8603ea3-93cf-4e98-87d9-f57365d1bfa4
# ╟─60ea9da7-6bf8-49cd-8876-a440b3ca3555
# ╟─59bca935-3b8e-4d7b-ab32-00e15e0b26e8
# ╟─a822bba7-f2d6-4f67-8d5f-fe846eef78ee
# ╟─46131ff8-6fe1-4e66-800e-870198d70f56
# ╟─d9054d10-3cee-4e49-8f7f-456d46217e90
# ╟─2481521c-7946-4df4-8ab4-320dda05cde0
# ╟─ef2c975e-a18f-4044-80ba-ed571104784c
# ╟─0e0cd48b-8e1b-4522-9a9d-ca3b14a98bfd
# ╟─859c93c6-d10f-479c-9fc9-4176c7bd7907
# ╟─5677c379-2ab7-48d4-bfb9-b30a6498b89f
# ╟─13374113-e298-46f5-9807-b80d6af2c2fb
# ╟─8df13432-d099-4486-bed9-f27a8bd17bd6
# ╟─60dbe8b2-5b06-4f91-894a-2e3ba03572cc
# ╟─6aeea501-c22e-433e-93ba-57d6aa29b2ed
# ╟─dd9f9fa8-fd01-4cbd-99a2-edce4ae3235f
# ╟─0bd1e837-999c-4237-8dc6-47c6156371b3
# ╟─13561c55-033b-420e-bc15-42e91ae24bdc
# ╠═ea0a83fd-598a-4a24-9b52-cae5d5da28f9
# ╟─58c11093-bc86-4a1d-b4c1-2ddaab55bf39
# ╟─11116492-2901-44ef-8685-6221769f8166
# ╟─f90705e7-0d65-43be-86a9-060f199b4093
# ╟─91defb2a-f044-4d8f-b787-6067b363617b
# ╟─d08c14ac-00e0-428a-9e65-ed8ebabdf52a
# ╟─8e7d9976-5567-40c1-9d29-252bad248746
# ╟─32967ad2-1f93-411e-8fc6-d30c88d94bc8
# ╟─7277240a-c31a-483d-b20f-76f795b009e9
# ╟─1b978621-22cb-4f3b-954b-d00de1af338d
# ╟─30f5b48b-e6fb-4303-8d2a-06025282dd25
# ╟─bb6eef03-d318-4a75-a15e-657531a14ecc
# ╟─09f3087b-1d65-4eda-8812-5287a68d97d0
# ╟─b7a4bf78-90aa-4154-bb71-b41a798cf103
# ╟─4c4f60f2-a056-4531-8ca4-155faabc131a
# ╟─138ba885-4f7d-4c09-b5ef-e62f88062f5b
# ╟─80abe510-bc12-42c6-b15f-84810f5ecc6b
# ╟─3c3b7359-61b7-4523-883e-4f525bb6a0f9
# ╟─d38a793e-cb92-4365-a389-ec5433ec2980
# ╟─8dc2fd31-a871-46d7-91a5-de028ee7deff
# ╟─13e2d6e8-7c7c-4236-8ec2-a93827e5b0c5
# ╟─2e071eaa-4806-4e8e-b743-5fd7ffa65416
# ╟─0a2b57db-e107-47ba-8abd-9d267f41635b
# ╟─b0bb489e-3d53-43e3-a5c9-4809f7d3eae1
# ╟─b8b22e76-91c9-4bff-ad39-e63c2a111464
# ╟─6d21aba5-7de9-4f06-9b0e-3e56eb1e9ebb
# ╟─6f429112-f86d-48af-bcee-9576a9dff25f
# ╟─efb8ea4f-ba3a-4992-9b17-b89ec786b6b4
# ╟─23be1362-266f-401f-9436-b92b7feb41c6
# ╟─3ebb9fb2-c1ed-4e82-8b56-e8599bf27ced
# ╟─1e08de06-152a-4763-bcf2-5bb7b3e00a17
# ╟─b96053ad-8a33-4cf4-a153-8fcc8eff3f18
# ╟─4f116738-c5fc-4990-8e80-9233a736d935
# ╟─a1dfbb28-252e-4027-aec2-71d8e5069606
# ╟─f00f2229-a507-4f11-b356-5f31d712708f
# ╟─5a6bc962-d3b9-465a-88da-5e1535209eaa
# ╟─939c5b80-2cfa-40ea-85ce-0c9006ad76ac
# ╟─9054fcf2-a006-45e5-99c4-69c37e02ee5b
# ╟─86589651-4ad1-4fee-a362-14fc0c42fe78
# ╟─520ed718-545c-4406-be90-276eccce31fc
# ╟─c07f6a3a-7a7d-4c4d-87a2-c9d37d27469e
# ╟─e9f40e96-27ef-43b3-ac58-49480d90f5fa
# ╠═fdda8946-ab96-49c7-83f7-d509a08ba9e3
# ╟─4f9d3e50-7b31-4ba5-a777-7ad0eb9d7248
# ╟─42e44352-322a-4339-bbeb-539372e8d1f1
# ╟─e3717880-cab8-469c-8fbc-e24e416b7781
# ╟─1cef3197-b05b-4f26-930d-30e0e2a95d06
# ╟─403adb0e-3d48-4d49-958b-636d52d70187
# ╟─73c89355-bb82-480f-804c-dcb8b63c1bb8
# ╟─a4e4b5ce-9731-4fa9-be31-7b85807caf1a
# ╟─3ee3152f-a023-4a69-824b-360740ea45af
# ╟─b59ca9ff-0d62-49c1-bc2b-7580c394efa6
# ╟─d5697257-7bd3-470f-8773-95fe0d344ed8
# ╠═928393d0-efa7-42f9-af9f-f6ddc6d36b13
# ╠═ba397b51-a046-48ca-b182-398337369962
# ╠═d10005ea-572c-4d7e-bebb-4502d8b9be94
# ╟─78d40d3a-f960-401f-b009-9c8cc1b71a92
# ╟─b128ed51-5d00-49ad-8d1c-ad2aa5c872f9
# ╠═957bbdd0-0804-4320-b1d9-06763a527670
# ╟─a602334a-b955-4c08-bc89-7d6fc8118cc3
# ╟─fa4cc0be-b1eb-486a-90a7-4f79567418bc
# ╠═4a26e1c5-fee8-4535-be11-a19759e40b78
# ╟─fb5482ac-423f-4258-9ef9-488ac197066d
# ╟─7971c81b-6095-44f5-9cdb-dabd7e8465d1
# ╟─19102a21-34b5-4dd6-be96-218c57c96304
# ╟─4d4c5534-f56a-4cb5-ab21-c751cc83a2b6
# ╟─7b069595-e024-4a14-9185-798d4a0c5052
# ╟─6324e9b9-5ba6-4710-9b2d-9798d63f1389
# ╟─cf6df8e6-70a0-4a3c-9ca4-c8fefb25912a
# ╟─4238aa19-9d78-4743-a70b-e5018d435d73
# ╟─1d040116-10f6-4607-9381-59e917263a81
# ╟─3c736c26-577f-424d-a842-2b5f2785e5ab
# ╟─4d63139e-dd7c-4c43-b064-c2e7b032f40d
# ╟─7f4389ae-ee03-4cdd-9c2a-71f0e8931fda
# ╟─afbf1632-5de2-4056-af13-cd0027d91335
# ╟─a9c8ebba-3a28-43aa-889f-8133768c0083
# ╟─464b9380-2215-4c89-a889-562e8f7df32e
# ╟─8757fbc3-c70c-4bc4-ae27-2e50aceda64b
# ╟─9b6d82d3-7382-44b4-a14f-b88d6d720e0c
# ╟─0b9cd0d1-1b92-4983-a106-129022f04dcc
# ╟─866fc60d-27cb-4775-b25d-9caebf80bf21
# ╟─02b3bec6-1171-4898-a1e4-23bf6cc2a1f9
# ╟─c7418848-d637-44d9-8e89-c9ead98fc04c
# ╟─8e275e71-bd89-4fc3-af6b-18e22b76e372
# ╟─6934a5a6-e222-4baa-82d5-1ba8109a0095
# ╟─6ab50f97-f438-4df2-b728-2fdb71847fc6
# ╠═eccdf153-ca77-40bc-9da0-c7f0e7e696df
# ╟─09e9a0ce-ff88-4140-90fb-55d5ca560444
# ╟─b0f8ea13-5823-4fb8-a9fc-f569e5f68649
# ╟─0ac44089-ec0b-408a-bd4f-adf99d27c82d
# ╟─f8d76c65-23ff-49d4-b1f9-efbd196438be
# ╟─379e2182-9eb5-44f0-807c-8a225fb83260
# ╟─f0e8ee0f-a294-4351-a7b0-eb54473958eb
# ╠═0d201c84-672e-47b7-9b50-dd3a7731bbf2
# ╟─827c3523-08fb-4d5c-bfbe-0e345d36ea1b
# ╟─9eda903d-e91a-4906-bcb1-511479f11de9
# ╟─fa3c7081-2702-4550-b18f-23403b9f92f5
# ╟─102af541-f518-4352-9da2-087ac0463d90
# ╟─929561ca-f65f-4259-b34e-192465cf9a28
# ╟─93303152-0e45-45d5-916f-ac3aab48b844
# ╟─6d9958e7-cbd5-4c00-949a-659678a26ef9
# ╟─73b12828-f83f-4662-8231-5b9acf5f000a
# ╟─5ba6b609-d105-4076-8111-93eb23760729
# ╟─f9d7ba16-71b5-4ed0-9962-5f3c4814e107
# ╟─ba7f0272-3ab8-454f-9a04-c9c733b42955
# ╟─ff3c1b4a-bfe0-4f35-9759-d4cb58f5fc7c
# ╟─c3dacda2-2a92-4929-a9a7-c6d332dd2784
# ╟─91a708d4-d27a-44a7-8007-b67636b7e03a
# ╟─2d8a14f5-84db-4e49-a716-2ccef12de5f2
# ╟─5f519a29-5dcc-427a-9b8c-769c47a4658e
# ╟─d910865b-2c6f-41e6-a51e-6827afb046b4
# ╟─c881ab12-b9eb-4039-998b-ce4f3d7b9e67
# ╟─0add1790-72bd-419c-98d3-8589998ee676
# ╠═6a72c293-06c8-4686-8bbd-98088e9772f8
# ╠═81530b1c-e153-4f58-bf8e-99255e9eb3a7
# ╟─0b47edf3-b74c-456c-8905-3f7f649abec3
# ╟─ab1acee6-2346-4433-8038-1673dfd39810
# ╟─46d1d351-d333-4408-b2fb-dcdfebfa0070
# ╠═40056baa-f80e-4eab-837b-19b092cec517
# ╟─f030b592-a305-46ab-ac70-f59106c76017
# ╟─caf9c662-8eca-4d89-a541-26df4c639a4a
# ╟─e228f399-0cab-4a5e-99c2-a1d6e712b179
# ╟─16357e8c-bde9-43ca-b9d2-83abee8e5a79
# ╟─6dcebfd9-fa02-4b8f-899a-9ee2d5ec3aaa
# ╟─f48d33c2-c01b-49b7-91cf-095130795abb
# ╟─9d6ab847-1855-4085-86c7-aa5a07f12738
# ╟─847b3196-fb63-48cf-a222-092cb841ed91
# ╟─749a26f8-aea6-4e6b-88d5-6b0a1be9490c
# ╟─1b29c700-cfe1-417f-ad61-3c9d491e1fbb
# ╟─56114e91-0682-4048-9853-032e90fac51e
# ╟─f5b4fda8-16b4-4e2a-bb39-a3f780a10688
# ╟─67bcefbb-d43e-4844-96f8-18dfa9d66358
# ╠═f4a7e902-1e0d-41d6-888f-e7d63e748a13
# ╟─10b68a42-ba7e-4266-bbf6-28cad9a21796
# ╟─be678a68-5e66-414e-8de5-35915f060d1d
# ╟─5089cd6f-10ac-4eb0-8267-5ce1aae578c4
# ╟─a8bbd6be-c26b-49e9-ab55-affa5d72e729
# ╟─4a3c8262-1004-40ce-9fea-68eaba5caf10
# ╟─d194c16f-185f-48fb-acfa-5e9e651229bb
# ╟─ae7350b7-d4b0-4557-af56-3552101f820c
# ╟─3a3daa1b-ba3c-45dd-ade0-1164a6874ce3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
