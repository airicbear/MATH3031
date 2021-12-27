### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ b8f4a4c2-052f-11ec-3ee3-cd29309f073a
begin
	using PlutoUI
	using Plots
	using LaTeXStrings
	using Combinatorics
	using StatsBase
	using Primes
	using Distributions
	using QuadGK
	using LinearAlgebra
	
	md"# Reading 1"
end

# ╔═╡ 0b5fd691-21f0-47c7-8821-8268a342399f
md"""
### Question 1

An experiment consists of flipping a fair coin 4 times.
What is the probability that we end up with more heads than tails?
(Enter your answer as a number between 0 and 1 in decimal form.)
"""

# ╔═╡ 6344c2b4-d586-4721-8434-bc73795181b1
md"""
$\begin{align*}\Omega = \begin{cases}
\text{HHHH}, \\
\text{HHHT},
\text{HHTH},
\text{HTHH},
\text{THHH}, \\
\text{HHTT},
\text{HTTH},
\text{TTHH},
\text{THHT},
\text{THTH},
\text{HTHT}, \\
\text{HTTT},
\text{THTT},
\text{TTHT},
\text{TTTH}, \\
\text{TTTT}
\end{cases}
\end{align*}$

$P(\text{more heads than tails}) = 5/16$
"""

# ╔═╡ f4fb16d7-119b-4522-aa0c-d86bb9e0688f
5/16

# ╔═╡ c153361c-d7b3-4072-8b11-d7659ec74871
md"""
### Question 2

An experiment consists of rolling two 6-sided dice, each of which having an equal probability of landing on any particular face. What is the probability that the second die shows a larger value than the first? (Enter your answer as a number between 0 and 1 in decimal form, rounded to 4 decimal places.)
"""

# ╔═╡ c6ebfb60-74ed-4108-b6bc-75556d02f25d
md"""
$\Omega = \{1, 2, 3, 4, 5, 6\}$

$\begin{align*}
1 &= P(\text{larger}) + P(\text{smaller}) + P(\text{same}) \\
1 &= 2P(\text{larger}) + \frac{1}{6} \\
\frac{5}{6} &= 2P(\text{larger}) \\
P(\text{larger}) &= \frac{5}{12}
\end{align*}$
"""

# ╔═╡ 2ba8f044-ff5e-4777-917f-6308a6c964a0
round(5/12, digits = 4)

# ╔═╡ 2960e37d-1e87-418b-b90f-6f0eba7db0d8
md"# Reading 2"

# ╔═╡ e8e87d64-b31b-44fc-85e0-e75a712aaf0d
md"""
### Question 1

Suppose the real number $C$ is chosen uniformly from the interval $[0,4]$, and consider the polynomial $x^2 - 2x + C$.
What is the probability that this polynomial has *no* real roots?
(Enter your answer as a number between 0 and 1 in decimal form.)
"""

# ╔═╡ 3ca18b1d-2411-466b-8bc7-15a2035a5491
md"""
$\begin{align*}
P(0 \geq (-2)^2 - 4C) &= P(0 \geq 4 - 4C) \\
&= P(4C \geq 4) \\
&= P(C \geq 1)
\end{align*}$

$\begin{align*}
P(E) &= \frac{\int_1^4 \;dx}{\int_0^4 \;dx} \\
&= \frac{3}{4}
\end{align*}$
"""

# ╔═╡ 8e15df4c-cca6-4a85-9448-f0d9340343d6
md"""
### Question 2

Suppose we pick two numbers uniformly from the interval $[0,1]$ and add them together.
Let the random variable $Z$ give the sum of the chosen numbers.
What is $P\left(\frac{1}{2} \leq Z \leq \frac{3}{2}\right)$?

(Note: See Example 2.14 in the textbook. Enter your answer as a number between 0 and 1 in decimal form.)
"""

# ╔═╡ 2afd6183-cbc1-4312-af30-bc235ff38b2a
md"""
$\Omega = [0,2]$

*From Example 2.14*

$F_Z(z) = \begin{cases}
0 &\text{if } z \leq 0 \\
\frac{z^2}{2} &\text{if } 0 \leq z \leq 1 \\
1 - \frac{(2 - z)^2}{2} &\text{if } 1 \leq z \leq 2 \\
1 &\text{if } 2 \leq z
\end{cases}$

$\begin{align*}
P\left(\frac{1}{2} \leq Z \leq \frac{3}{2}\right) &= P\left(Z \leq \frac{3}{2}\right) - P\left(Z \leq \frac{1}{3}\right) \\
&= F_Z \left(\frac{3}{2}\right) - F_Z \left(\frac{1}{2}\right) \\
&= \frac{7}{8} - \frac{1}{8} \\
&= \frac{6}{8} \\
&= \frac{3}{4}
\end{align*}$
"""

# ╔═╡ c06b366c-39ee-48e9-a20a-626b92598aab
let
	plot(x -> 3//2 - x, xlims=[0,1], ylims=[0,1], fillrange = x->1//2-x, fillalpha = 0.2, label = L"y = \frac{3}{2} - x")
	p = plot!(x -> 1//2 - x, xlims=[0,1], ylims=[0,1], fillrange = x->3//2-x, fillalpha = 0.2, label = L"y = \frac{1}{3} - x")
	
	md"""
	**A graphical approach**
	
	Let the square bounded by the origin and the point (1,1) represent the sample space of the random variable $Z$.
	
	Subtract the probability $P\left(x + y \leq \frac{1}{2}\right)$ from $P\left(x + y \leq \frac{3}{2}\right)$ where the probabilities are given by the bounded regions as shown in the graph.
	
	The remaining area (the difference) is the probability $P\left(\frac{1}{2} < Z < \frac{3}{2}\right)$
	
	$p"""
end

# ╔═╡ 33b37c29-cbf3-4f85-9e32-e72118376049
md"# Reading 3"

# ╔═╡ de4b1fc5-5053-4003-bb2e-ce348d6cd8a4
md"""
### Question 1

Suppose I own 10 different books, but my bookshelf is only large enough to hold 6 of them.
In how many different ways can I arrange 6 out of my 10 books on the shelf?
"""

# ╔═╡ abf21c78-0846-44b3-a211-c870465becd6
let
	n = 10
	k = 6
	
	prod([n - i + 1 for i ∈ 1:k])
end

# ╔═╡ 1e161e0a-6fef-44f0-9445-968c0a1c2062
factorial(10) / factorial(4)

# ╔═╡ d106535a-a04a-4e2f-b1fe-e35ca2800d02
md"""
### Question 2

Suppose I own 10 different books, $\{𝐁_1, 𝐁_2, …, 𝐁_{10}\}$ and the book $𝐁_2$ is the sequel to $𝐁_1$.
My bookshelf only has space for 6 books, and I want to keep the books $𝐁_1$ and $𝐁_2$ together.
That is, they either both go on the shelf or neither of them will, and when they're on the shelf they must be next to each other and in order.
In how many ways can I arrange my shelf?

(Hint: consider a few cases.)
"""

# ╔═╡ 32704247-140d-4ca9-a028-7f817403ecb5
let
	N = 10000
	count = 0
	Ω = (:B1, :B2, :B3, :B4, :B5, :B6, :B7, :B8, :B9, :B10)
	P = collect(permutations(Ω, 6))
	
	while !isempty(P)
		X = pop!(P)
		
		if :B1 in X
			if findfirst(x -> x == :B2, X) == findfirst(x -> x == :B1, X) + 1
				count += 1
			end
		elseif :B2 ∉ X
			count += 1
		end
	end
	
	count
end

# ╔═╡ 683d56ce-8435-43d5-a8da-274b83159511
(factorial(8) / factorial(4) * 5) + factorial(8) / factorial(2)

# ╔═╡ 38514ac2-d6d6-4b73-b30b-fe1cd0bd77f0
prod(5:8) * 5 + prod(3:8)

# ╔═╡ 0a0d27fb-e2e9-4048-bf0e-dd4802494b35
md"# Reading 1"

# ╔═╡ c336d7b9-7f62-443a-9104-7d9c579d165e
md"""
### Question 1

In how many ways can we form a length-6 list of English letters (A-Z) that has exactly three A's?
"""

# ╔═╡ 2a839af0-d24a-4931-bbcc-ce62b15bd52a
md"""
$\begin{pmatrix} 6 \\ 3 \end{pmatrix} ⋅ 25^3 = 312500$
"""

# ╔═╡ b071a778-c7d9-490e-8038-c3df0e2d5308
binomial(6, 3) * 25^3

# ╔═╡ d85dd4dd-c3d5-4c16-b618-57edb4ef9ebe
md"""
### Question 2

Suppose a biased coin comes up heads 40% of the time and tails 60% of the time.
What is the probability of getting exactly 5 heads in 10 flips?
(Enter your answer as a number between 0 and 1 in decimal places.)
"""

# ╔═╡ 2343cd96-5e03-48d6-95f7-2cee1c5e7225
md"""
$b(10, 2/5, 5) = \begin{pmatrix} 10 \\ 5 \end{pmatrix} \left(\frac{2}{5}\right)^5 \left(\frac{3}{5}\right)^5 ≈ 0.2007$
"""

# ╔═╡ d68ee6b9-8050-473b-8b83-d20a49c09547
md"# Reading 6"

# ╔═╡ aca0116a-5b94-47fc-91a8-ee5855588875
md"""
### Question 1

For any events $A$ and $B$, $P(A ∣ B) = P(B ∣ A)$.
"""

# ╔═╡ d957854a-ac6d-4f55-a17e-c3f6806242a4
false

# ╔═╡ d5a0339a-b380-4c9d-9a04-1029aa6f535a
md"""
### Question 2

Suppose we flip a fair coin four times and record the sequence of results.
Let $A$ be the event that we've flipped exactly two heads.
Which of the following events is independent with $A$?

``B``: The first flip is heads.

``C``: The second and third flips are the same.

``D``: The sequence of heads and tails alternates every flip.
"""

# ╔═╡ 5ce93677-56d2-403f-8582-7ff369629d5f
md"Event ``B`` since $P(B ∣ A) = P(B)$"

# ╔═╡ ca050825-6f19-4655-9e07-be1125d5f098
md"# Reading 7"

# ╔═╡ 1b237d28-f34e-4590-ac96-3a0bf6aaa71f
md"""
### Question 1

Suppose an experiment consists of flipping a fair coin three times and recording the results.
Let $A$ be the event that the first and third flips match.
Let $B$ be the event that the second and third flips match.
Then $A$ and $B$ are independent.
"""

# ╔═╡ a0d74a88-3f95-4c97-b631-513ca8f4704a
md"""
$P(A ∩ B) ≟ P(A)P(B)$

$P(A) = \frac{1}{2} ⋅ \frac{1}{2} = \frac{1}{4}$

$P(B) = \frac{1}{2} ⋅ \frac{1}{2} = \frac{1}{4}$

$P(A ∩ B) = P(\text{HHH} ∪ \text{TTT}) = P(A)P(B)$
"""

# ╔═╡ ce24bfd9-3ef7-43d2-a177-0b7179462827
md"""
### Question 2

Suppose the probability of there being a fire in a particular area is 0.01, and the probability of seeing smoke in that area is 0.1.
Furthermore, suppose the probability that a fire causes visible smoke is 0.9.
If you see smoke in that area, what is the probability that there's a fire?
(Enter your answer as a number between 0 and 1 in decimal form.)
"""

# ╔═╡ 554a0922-540e-41f3-b641-883c06d0f7f0
md"""
$P(\text{fire}) = 0.01$

$P(\text{smoke}) = 0.1$

$P(\text{smoke} ∣ \text{fire}) = 0.9$

$P(\text{fire} ∣ \text{smoke}) = \frac{P(\text{smoke} ∣ \text{fire}) P(\text{fire})}{P(\text{smoke})} = \frac{(0.9)(0.01)}{0.1} = 0.09$
"""

# ╔═╡ d634b934-d53e-4d2b-a68f-9ad14a2f2f27
md"# Reading 8"

# ╔═╡ 922ca9e5-985b-4c1f-8b58-ad38a7b08d01
md"""
### Question 1

Suppose two numbers $X$ and $Y$ are chosen uniformly from the interval $[0,1]$.
What is the conditional probability that $Y ≤ X^2$ given that $X ≥ \frac{1}{2}$?
(Enter your answer as a reduced fraction with no spaces.)
"""

# ╔═╡ 31d196c1-3de5-4982-a4a4-e1f2cebf1554
md"""
$P\left(Y ≤ X^2 ∩ X ≥ \frac{1}{2}\right) = ∫_{1/2}^1 x^2 \;dx = \left[\frac{1}{3} x^3\right]_{1/2}^1 = \frac{1}{3} - \frac{1}{3} \left(\frac{1}{2}\right)^3 = \frac{1}{3} - \frac{1}{24} = \frac{7}{24}$

$P\left(Y ≤ X^2 ∣ X ≥ \frac{1}{2}\right) = \frac{P\left(Y ≤ X^2 ∩ X ≥ \frac{1}{2}\right)}{P\left(X ≥ \frac{1}{2}\right)} = \frac{\frac{7}{24}}{\frac{1}{2}} = \frac{7}{12}$
"""

# ╔═╡ 3a0f9dc7-cfe6-4dc6-8efd-1cf1e97ceddc
md"""
# Reading 11: Expected Value
"""

# ╔═╡ 6018ccae-ca62-4495-acc1-391b2f08297c
md"""
### Question 1

Let $A$ be the set of prime numbers between 1 and 20.
What is the expected value of a number selected uniformly at random from $A$?
(Enter your answer in decimal form.)
"""

# ╔═╡ c36cc9fb-ffe0-44e0-b47c-fa42b5e08dc7
md"""
$A = \{2, 3, 5, 7, 11, 13, 17, 19\}$

$m(x) = \frac{1}{8}$

$E(X) = \sum_{x ∈ Ω} xm(x) = \frac{\sum A}{8} = \frac{77}{8} = 9.625$
"""

# ╔═╡ c51bff51-1fda-4dee-982e-fb3d751d3862
let
	pri = primes(20)
	pri, sum(pri), sum(pri) / 8
end

# ╔═╡ 4509c982-c842-45b8-9770-ab7020955223
md"""
### Question 2

Suppose we roll a 6-sided die, a 10-sided die, and a 20-sided die.
We record the results with the variables $X$, $Y$, $Z$, respectively.
If all three dice are fair, what is the expected value of $X + Y + Z$?
(Enter your answer as a reduced fraction.)
"""

# ╔═╡ 2061ed89-a9bf-48b0-9cc7-7806da519683
md"""
$E(X_1 + X_2 + X_3) = E(X_1) + E(X_2) + E(X_3)$

$E(X_1) = \sum_{x ∈ Ω_1} xm(x) = \frac{1}{6} + \frac{2}{6} + ⋯ + \frac{6}{6} = \frac{7}{2}$

$E(X_2) = \sum_{x ∈ Ω_2} xm(x) = \frac{1}{10} + \frac{2}{10} + ⋯ + \frac{10}{10} = \frac{11}{2}$

$E(X_3) = \sum_{x ∈ Ω_3} xm(x) = \frac{1}{20} + \frac{2}{20} + ⋯ + \frac{20}{20} = \frac{21}{2}$

$\frac{7}{2} + \frac{11}{2} + \frac{21}{2} = \frac{39}{2}$
"""

# ╔═╡ 1b3916ea-162b-4774-95ec-658733617d65
md"# Reading 12: Variance"

# ╔═╡ 4b2a2b11-923b-45da-ba62-9c966515b6d5
md"""
### Question 1

Suppose $X$ and $Y$ are two random variables with the same variance.
Then $X = Y$.
"""

# ╔═╡ 0d872559-7585-4727-aa41-debf45ad02d9
false

# ╔═╡ d303e3e3-b362-4eec-9b8b-594ffb86c1b5
md"""
### Question 2

Suppose a coin is weighted so that it comes up heads with probability 1/4.
If the coin is flipped 400 times, what is the variance of the number of heads
"""

# ╔═╡ 9ef7be0d-ef75-4be8-95df-8603b2ee57d2
md"""
``X`` = number of heads

$V(S_n) = npq = (400)(1/4)(3/4) = 75$
"""

# ╔═╡ e1311d15-b1ae-4ed5-a271-f41211debecb
400 * (1//4) * (3//4)

# ╔═╡ 2a8c27d0-18e7-4ce9-94ba-515062492092
md"# Reading 13: Continuous Random Variables"

# ╔═╡ 8df7610a-6603-408e-8d81-e492cb688a55
md"""
### Question 1

If $X$ is a continuous random variable which takes values $[0, 1]$ with density function $f(x) = 2x$, what is $E(X)$? (Enter your answer as a reduced fraction.)
"""

# ╔═╡ 9da56a02-d9b7-4ca2-93ed-7a2ddd3482db
md"""
$\begin{align*}
E(X) &= ∫_0^1 x f(x) \;dx \\
&= ∫_0^1 x (2x) \;dx \\
&= 2 ∫_0^1 x^2 \;dx \\
&= 2 \left[\frac{1}{3} x^3\right]_0^1 \\
&= 2 \left[\frac{1}{3} - 0\right] \\
&= 2 \left(\frac{1}{3}\right) \\
&= \frac{2}{3}
\end{align*}$
"""

# ╔═╡ 8ff39d3e-bfda-47ba-b418-6cd7a74f843b
md"""
### Question 2

If $E(X) = 2$ and $V(X) = 1$, what is $E(X^2)$?
"""

# ╔═╡ 828f19f3-e0b4-4cc6-89e4-04afcef1027b
md"""
$\begin{align*}
V(X) &= E(X^2) - E(X)^2 \\
1 &= E(X^2) - (2)^2 \\
1 &= E(X^2) - 4 \\
E(X^2) &= 5
\end{align*}$
"""

# ╔═╡ fc4e3eef-6df7-4696-995c-a278dc948507
md"# Reading 15: Convolution"

# ╔═╡ bdd50995-d47b-4ab0-9bbb-f262e381d142
md"""
### Question 1

Suppose two fair 6-sided dice are rolled.
What is the most likely sum?
"""

# ╔═╡ 488d60c0-f244-43a7-bfb8-c09ff315abf1
md"""
$P(X = k) = \frac{1}{6}$

$Z = X + X ∈ \{2, 3, …, 12\}$

$\begin{align*}
P(Z = k) &= \sum_{i = -∞}^{∞} P(X = i) P(X = k - i) \\
&= \sum_{i = 1}^6 P(X = i) P(X = k - i) \\
&= P(X = 1) P(X = k - 1) + P(X = 2) P(X = k - 2) \\
&\quad+ P(X = 3) P(X = k - 3) + P(X = 4) P(X = k - 4) \\
&\quad+ P(X = 5) P(X = k - 5) + P(X = 6) P(X = k - 6) \\
&= \frac{\sum_{i=1}^6 P(X = k - i)}{6}
\end{align*}$
"""

# ╔═╡ dc276bc2-b367-4440-b224-2a2b10403028
md"""
$\begin{align*}
P(Z = 2) &= \frac{\sum_{i = 1}^6 P(X = 2 - i)}{6} \\
P(Z = 3) &= \frac{\sum_{i = 1}^6 P(X = 3 - i)}{6} \\
P(Z = 4) &= \frac{\sum_{i = 1}^6 P(X = 4 - i)}{6} \\
P(Z = 5) &= \frac{\sum_{i = 1}^6 P(X = 5 - i)}{6} \\
P(Z = 6) &= \frac{\sum_{i = 1}^6 P(X = 6 - i)}{6} \\
P(Z = 7) &= \frac{\sum_{i = 1}^6 P(X = 7 - i)}{6} \\
P(Z = 8) &= \frac{\sum_{i = 1}^6 P(X = 8 - i)}{6} \\
P(Z = 9) &= \frac{\sum_{i = 1}^6 P(X = 9 - i)}{6} \\
P(Z = 10) &= \frac{\sum_{i = 1}^6 P(X = 10 - i)}{6} \\
P(Z = 11) &= \frac{\sum_{i = 1}^6 P(X = 11 - i)}{6} \\
P(Z = 12) &= \frac{\sum_{i = 1}^6 P(X = 12 - i)}{6}
\end{align*}$
"""

# ╔═╡ 9e9573c6-55a5-4dd4-8bdb-a9e5c6c41626
let
	PX(k) = k ∈ 1:6 ? 1/6 : 0
	PZ(k) = sum([PX(k - i) for i ∈ 1:6]) / 6
	Zdist = Dict([i => PZ(i) for i ∈ 2:12])
	argmax(Zdist)
end

# ╔═╡ be0d3a76-8b2f-48df-99ef-76c386b12df3
md"""
### Question 2

Let $X$ and $Y$ be uniformly chosen from the interval $[0,1]$.
What is the probability that $X + Y ≤ 1.5$?
(Note: you could answer this question using a geometric calculation, but instead try to use the p.d.f. of $Z = X + Y$.)
"""

# ╔═╡ 14ce9360-8c22-4716-a1d9-e28c2fe702da
md"""
$Z = X + Y \implies Z ∈ [0, 2]$

$\begin{align*}
f_Z(z) &= (f_X ∗ f_Y) \\
&= ∫_{-∞}^{+∞} f_X(z - y) f_Y(y) \;dy \\
&= \int_0^1 f_X(z - y) \;dy
\end{align*}$

$0 ≤ z - y ≤ 1 \implies 0 ≤ z ≤ 1 \implies f_X(z - y) = 1$

$f_Z(z) = ∫_0^z dy = z \qquad \text{if } 0 ≤ z ≤ 1$

$f_Z(z) = ∫_{z-1}^1 dy = 2 - z \qquad \text{if } 1 < z ≤ 2$

$f_Z(z) = \begin{cases}
z, &\text{if } 0 ≤ z ≤ 1, \\
2 - z, &\text{if } 1 < z ≤ 2, \\
0, &\text{otherwise.}
\end{cases}$
"""

# ╔═╡ ccc4a33a-8850-4fbb-be94-bb9ef3a70179
md"""
$\begin{align*}
F_Z(z) &= \begin{cases}
\frac{z^2}{2}, &\text{if } 0 ≤ z ≤ 1, \\
2z - \frac{z^2}{2} - \left(2 - \frac{1}{2}\right) + F_Z(1), &\text{if } 1 < z ≤ 2, \\
0, &\text{otherwise.}
\end{cases} \\
&= \begin{cases}
\frac{z^2}{2}, &\text{if } 0 ≤ z ≤ 1, \\
2z - \frac{z^2}{2} - 1, &\text{if } 1 < z ≤ 2, \\
0, &\text{otherwise.}
\end{cases}
\end{align*}$

$F_Z(1.5) = 2 \left(\frac{3}{2}\right) - \frac{\left(\frac{3}{2}\right)^2}{2} - 1 = 3 - \frac{\frac{9}{4}}{2} - 1 = \frac{24 - 9 - 8}{8} = \frac{7}{8}$
"""

# ╔═╡ 0a77c193-f4ce-48ea-a89e-f87cc8e5a620
let
	fZ(z) = if 0 ≤ z ≤ 1
		z
	elseif 1 ≤ z ≤ 2
		2 - z
	else
		0
	end
	
	FZ(z) = if 0 ≤ z ≤ 1
		z^2 / 2
	elseif 1 ≤ z ≤ 2
		2z - z^2 / 2 - 1
	else
		0
	end
	
	plot(fZ, xlims=[0,2], lw=2, alpha=0.5, label=L"f_Z(z)")
	plot!(FZ, xlims=[0,2], lw=2, label=L"F_Z(z)")
	plot!(0:0.1:1.5, fZ.(0:0.1:1.5), lw=2, fill=(0,0.5), color=theme_palette(:auto)[1], legend=:topleft, label=false)
end

# ╔═╡ 183261a2-c341-4f0a-b8b0-01a4f12d1107
let	
	fZ(z) = if 0 ≤ z ≤ 1
		z
	elseif 1 ≤ z ≤ 2
		2 - z
	else
		0
	end
	
	answer, error = quadgk(fZ, 0, 1.5)
	rationalize(round(answer, digits = 3))
end

# ╔═╡ e09cfde4-54b5-4ac1-93d1-869d3538e69a
md"# Reading 17: Law of Large Numbers"

# ╔═╡ 96f3b6ba-d314-4aa1-8e53-04574c52ccf4
md"""
### Question 1

Suppose $X_i$ represent the outcome of independent Bernoulli trials with probability $1/3$ of success.
Let $S_n = X_1 + X_2 + ⋯ + X_n$.
What is the minimum value of $n$ so that $P\left(\left|\frac{S_n}{n} - \frac{1}{3}\right| ≥ 0.1\right) ≤ 0.1$?
"""

# ╔═╡ 086f6f88-3b11-4c03-aaa1-ba2e627519fc
md"""
$p = 1/3$

$\epsilon = 0.1$

$V\left(\frac{S_n}{n}\right) = \frac{pq}{n} = \frac{p(1 - p)}{n} = \frac{\left(\frac{1}{3}\right) \left(\frac{2}{3}\right)}{n} = \frac{2}{9n}$

$\begin{align*}
P\left(\left|\frac{S_n}{n} - \mu\right| ≥ \epsilon\right) &≤ \frac{V(X)}{\epsilon^2} \\
P\left(\left|\frac{S_n}{n} - \frac{1}{3}\right| ≥ 0.1\right) &≤ \frac{p(1 - p)}{n\epsilon^2} \\
P\left(\left|\frac{S_n}{n} - \frac{1}{3}\right| ≥ 0.1\right) &≤ \frac{\frac{2}{9}}{\frac{1}{100}n} \\
P\left(\left|\frac{S_n}{n} - \frac{1}{3}\right| ≥ 0.1\right) &≤ \frac{200}{9n}
\end{align*}$

$\begin{align*}
\frac{200}{9n} &= \frac{1}{10} \\
n &= \left\lceil\frac{2000}{9}\right\rceil = 223
\end{align*}$
"""

# ╔═╡ 559dacad-7006-4af8-b870-1571a2884d12
ceil(2000/9)

# ╔═╡ 410a1deb-23e1-44a7-b9bf-5abfba6254f6
md"# Reading 18: Continuous Law of Large Numbers"

# ╔═╡ bbad4f7a-b6a6-44c3-a431-587fa7b45302
md"""
### Question 1

Suppose $X_1, X_2, …, X_{1000}$ are chosen uniformly from $[0, 2]$.
Let $S_{1000} = X_1 + X_2 + ⋯ + X_{1000}$.
What does Chebyshev's Inequality say is the upper bound on the probability $P\left(\left|\frac{S_{1000}}{1000} - 1\right| ≥ 0.1\right)$?
(Enter your answer as a reduced fraction with no spaces.)
"""

# ╔═╡ 251a2c7d-a8c6-4cc7-88ec-e4f2caa962de
md"""
$f(x) = \frac{1}{2}$

$\mu = E(X_i) = ∫_{-∞}^{+∞} xf(x) \;dx = \frac{1}{2} ∫_0^2 x \;dx = \frac{1}{2} ⋅ \frac{2^2}{2} = 1$

$\sigma^2 = V(X_i) = ∫_{-∞}^{+∞} x^2 f(x) \;dx - \mu^2 = \frac{1}{2} ∫_0^2 x^2 \;dx - 1 = \frac{1}{2} ⋅ \frac{2^3}{3} - 1 = \frac{1}{3}$

$E\left(\frac{S_n}{n}\right) = 1$

$V\left(\frac{S_n}{n}\right) = \frac{1}{3n}$

$n = 1000$

$\epsilon = 0.1$

$\begin{align*}
P\left(\left|\frac{S_{1000}}{1000} - 1\right| ≥ 0.1\right) &≤ \frac{\sigma^2}{\epsilon^2} \\
&= \frac{\frac{1}{3n}}{(0.1)^2} \\
&= \frac{\frac{1}{3(1000)}}{0.01} \\
&= \frac{1}{0.03(1000)} \\
&= \frac{1}{30}
\end{align*}$
"""

# ╔═╡ 0265e7b1-dbf1-4ea8-b75f-f89e6cb97315
md"# Reading 19: Central Limit Theorem (Bernoulli Trials)"

# ╔═╡ eb6915b6-c611-497e-bfb1-0d6c3c3abb70
md"""
### Question 1

Let $S_{100}$ be the number of heads that turn up in 100 tosses of a fair coin.
Use the Central Limit Theorem to estimate $P(45 ≤ S_{100} ≤ 65)$.
(Enter your answer as a number between 0 and 1 in decimal form, rounded to 4 decimal places.)
"""

# ╔═╡ 3f0b44d4-497b-4723-b9fb-adc0fdd7308b
md"""
$\begin{align*}
P\left(a ≤ \frac{S_n - np}{\sqrt{npq}} ≤ b\right) &≈ P\left(\frac{44.5 - 50}{5} ≤ S_{100}^* ≤ \frac{65.5 - 50}{5}\right) \\
&= P\left(-1.1 ≤ S_{100}^* ≤ 3.1\right) \\
&≈ \text{NA}(-1.1, 3.1) \\
&= \text{NA}(0,1.1) + \text{NA}(0,3.1) \\
&= .3643 + .4990 \\
&= 0.8633
\end{align*}$
"""

# ╔═╡ 772995be-3d96-4351-814d-2e0d168d4240
# Simulation

let
	N = 10000
	sum([45 <= sum(rand(Bernoulli(), 100)) <= 65 for i ∈ 1:N]) / N
end

# ╔═╡ 05e2ecac-11e6-40bb-b668-903f39c2602a
md"# Reading 20: Central Limit Theorem (Discrete Trials)"

# ╔═╡ 69bedc9f-60fc-41f0-ad5f-b2afdd15992f
md"""
### Question 1

Suppose $X_1, …, X_n$ are independent random variables which each take on the values 1 or -1 with a probability of 0.5 for each value.
Let $S_n$ represent the sum.
Use the Central Limit Theorem to estimate $P(-5 ≤ S_{100} ≤ 5)$.
(Enter your answer as a number between 0 and 1 in decimal form, rounded to 4 decimal places.)
"""

# ╔═╡ 5220ed49-01f0-423b-a131-68a924e01c4b
# Exact calculation

let
	X = [-1,1]
	E(X) = sum([x/2 for x ∈ X])
	μ = E(X)
	μ = 100μ
	σ² = E(X.^2) - μ^2
	σ² = 100σ²
	σ = sqrt(σ²)
	a = -5
	b = 5
	α = (a - μ) / σ
	β = (b - μ) / σ
	cdf(Normal(), β) - cdf(Normal(), α)
	σ
end

# ╔═╡ ab44a863-1b97-4f9e-a774-34875a3a4571
# Simulation

let
	N = 10000
	sum([-5 <= sum(rand([-1, 1], 100)) <= 5 for i ∈ 1:N]) / N
end

# ╔═╡ 7a1a1f40-a3d2-451e-8d4b-f885b3eb8b50
# Table calculation

2 * (0.1915)

# ╔═╡ df494973-245b-4261-a0da-1bc83724275b
md"# Reading 22: Moment Generating Functions"

# ╔═╡ e31bb374-e36f-472d-b567-324f627b182e
md"""
### Question 1

If $X$ and $Y$ are discrete random variables whose first 10 moments are equal, then they have the same distribution function.

- True

- False
"""

# ╔═╡ 9ad39115-4cda-483d-b9f5-96932ffb9bee
false

# ╔═╡ 331e8bf2-ac6c-4719-b098-9eb010560626
let
	n = 2
	f(t) = (exp(3t) / (n + 1)) * sum([exp(t*j) for j ∈ 0:n])
	g(t) = (exp(3t) / (n + 1)) * ((exp((n + 1)*t) - 1) / (exp(t) - 1))
	f(2), g(2)
end

# ╔═╡ 9ba6206d-f032-4c80-9b34-4f1ecd1a14f2
md"""
### Question 2

Match the following random variables with their moment generating functions.

- ``X`` is uniform with range $\{3, 4, 5, …, n + 3\}$.

- ``Y`` gives twice the number of heads in $n$ flips of a fair coin.

- ``Z`` is Poisson-distributed with mean 2.


- ``\displaystyle f(t) = \frac{(e^{2t} + 1)^n}{2^n}``

- ``\displaystyle g(t) = \frac{e^{3t}(e^{nt} - 1)}{n(e^t - 1)}``

- ``\displaystyle h(t) = e^{2e^t - 2}`` 
"""

# ╔═╡ 7e0d004e-5dbd-4c77-b875-7b930b2c21a9
md"""
$\begin{align*}
g_X(t) &= \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) \\
&= \sum_{j = 0}^n e^{t(j + 3)} \frac{1}{n + 1} \\
&= \frac{e^{3t}}{n + 1} \sum_{j = 0}^n e^{tj} \\
&= \frac{e^{3t}}{n + 1} \left(\frac{e^{t(n + 1)} - 1}{e^t - 1}\right) \\
&= \frac{e^{3t}(e^{t(n + 1)} - 1)}{(n + 1)(e^t - 1)}
\end{align*}$
"""

# ╔═╡ de26dc77-2966-4476-8f7a-b380255b8465
let
	# Parameters
	n = 10
	a = 3
	b = n + 3
	t = 1
	
	# X Distribution
	X = Uniform(a, b)
	
	# Our calculated mgf
	g(t) = (exp(3t) / (n + 1)) * ((exp(t * (n + 1)) - 1) / (exp(t) - 1))
	
	# Comparison with actual mgf
	mgf(X, t), g(t)
	
	# ...FAIL!
end

# ╔═╡ c1823c18-b710-4209-b55d-6856d9ab98a4
md"""
$\begin{align*}
g_Y(t) = g_X(2t) &= \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) \\
&= \sum_{j = 0}^n e^{2tj} \begin{pmatrix} n \\ j \end{pmatrix} p^{j} q^{n - j} \\
&= \sum_{j = 0}^n \begin{pmatrix} n \\ j \end{pmatrix} (pe^{2t})^j q^{n - j} \\
&= (pe^{2t} - q)^n \\
&= \left(\frac{1}{2} e^{2t} - \frac{1}{2}\right)^n \\
&= \frac{(e^{2t} - 1)^n}{2^n}
\end{align*}$
"""

# ╔═╡ 3eb6f194-bd7f-426d-aa78-90479ceca05a
let
	# Parameters
	n = 10
	p = 0.5
	j = 2
	t = 1
	
	# X Distribution
	X = Binomial(n, p)
	
	# Our calculated mgf
	f(t) = (exp(2t) + 1)^n / 2^n
	
	# Comparison with actual mgf
	gY(t) = mgf(X, 2t)
	gY(t), f(t)
end

# ╔═╡ 7c1a670f-798d-4e67-8bf7-a5d430ac2402
md"""
$\begin{align*}
g_Z(t) &= \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) \\
&= \sum_{j = 0}^∞ e^{tj} \frac{\lambda^j}{j!} e^{-\lambda} \\
&= e^{-\lambda} \sum_{j = 0}^∞ \frac{(\lambda e^t)^j}{j!} \\
&= e^{-\lambda} e^{\lambda e^t} \\
&= e^{\lambda e^t - \lambda} \\
&= e^{2e^t - 2}
\end{align*}$
"""

# ╔═╡ 473ab822-e3fc-4fd6-a00c-91f5c35142a1
let
	# Parameters
	λ = 2
	t = 1
	
	# Z Distribution
	Z = Poisson(λ)
	
	# Our calculated mgf
	h(t) = exp(2exp(t) - 2)
	
	# Comparison with actual mgf
	mgf(Z, t), h(t)
end

# ╔═╡ 277333d5-e821-474f-92ac-a3b805b48bcd
md"""
$\begin{align*}
X &\implies g(t) \\
Y &\implies f(t) \\
Z &\implies h(t)
\end{align*}$
"""

# ╔═╡ 616feb12-fb9b-4088-8f30-b38c6c513c97
md"# Reading 23: Continuous Moment Generating Functions"

# ╔═╡ 00e0c5d5-2385-47fd-b421-caf639c8a459
md"""
### Question 1

Match the following random variables with their moment generating functions.

- ``X`` is uniform in the interval $[2, 5]$.
- ``Y`` is normally distributed with mean 1 and variance 2.
- ``Z`` has exponentially density with parameter 2.


- ``f(t) = \frac{2}{2 - t}``
- ``g(t) = \frac{e^{5t} - e^{2t}}{3t}``
- ``h(t) = e^{t + 2t^2}``
"""

# ╔═╡ cc633129-77ef-46e9-a0b9-7b6d2915d63c
md"""
$X:$

$u = tx \implies ∫_2^5 → \int_{2t}^{5t}$

$du = t \;dx \implies dx = \frac{du}{t}$

$g_X(t) = ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx = \frac{1}{3} ∫_2^5 e^{tx} \;dx = \frac{1}{3t} ∫_{2t}^{5t} e^u \;du = \frac{e^{5t} - e^{2t}}{3t} = g(t)$
"""

# ╔═╡ a52dd510-91b8-42c0-b011-78d578abcde7
let
	# Parameters
	a = 2
	b = 5
	t = 1
	
	# X Distribution
	X = Uniform(a, b)
	
	# Our calculated mgf
	g(t) = (exp(5t) - exp(2t)) / 3t
	
	# Comparison with actual mgf
	mgf(X, t), g(t)
end

# ╔═╡ 95e85ba0-eb99-4224-afef-7f9d893afadf
md"""
$Y:$

$g_Y(t) = e^{\mu t + (\sigma^2 / 2) t^2} = e^{t + t^2} = h(t)$
"""

# ╔═╡ 8de8edbc-3f7f-4e56-96ed-0fb9d35e6e2c
let
	# Parameters
	μ = 1
	σ² = 2
	σ = sqrt(σ²)
	t = 1
	
	# Y Distribution
	Y = Normal(μ, σ)
	
	# Our calculated mgf
	h(t) = exp(t + t^2)
	
	# Comparison with actual mgf
	mgf(Y, t), h(t)
end

# ╔═╡ 4a8220d8-3cf9-44a6-b2c5-fec3becd4036
md"""
$Z:$

$g(t) = \frac{\lambda}{\lambda - t} = \frac{2}{2 - t} = f(t)$
"""

# ╔═╡ 77006cfe-df0e-49c8-9c61-a8380544d560
let
	# Parameters
	λ = 2
	t = 1
	
	# Y Distribution
	Z = Exponential(inv(λ))
	
	# Our calculated mgf
	f(t) = 2 / (2 - t)
	
	# Comparison with actual mgf
	mgf(Z, t), f(t)
end

# ╔═╡ 82af0551-692a-4bdb-a0ca-c1b1b1a91398
md"# Reading 25: Matrix Algebra"

# ╔═╡ c00a6dd7-4e43-44c3-9f32-52a8a860e771
md"""
### Question 1

Calculate the matrix product below:

$\begin{bmatrix} 1 & -1 & 2 & 0 \\ 2 & 1 & 1 & -1 \\ 0 & 1 & 2 & 1 \end{bmatrix} \begin{bmatrix} 1 & 2 \\ 1 & 1 \\ -1 & 1 \\ 0 & 1 \end{bmatrix}=$
"""

# ╔═╡ 57aaa030-30ad-4002-b3d3-8bb6a15f344d
let
	A = [1 -1 2 0
		 2 1 1 -1
		 0 1 2 1]
	B = [ 1 2
		  1 1
		 -1 1
		  0 1]
	A * B
end

# ╔═╡ 87f3580e-648c-4fba-a6f5-0b6be9e9b8cf
md"""
### Question 2

An adjacency matrix $A$ for an undirected graph must have $a_{ij} = a_{ji}$ for all $i, j$.
"""

# ╔═╡ bf5b5cd6-2c71-4efb-aa26-bdfa57868b01
true

# ╔═╡ c5a38bf2-a579-4b02-8444-065bf5fc62f0
md"# Reading 26: Markov Chains"

# ╔═╡ a0401965-b0f6-4e04-ab49-195c979b2981
md"""
### Question 1

Given the transition matrix $𝐏 = \begin{bmatrix} 0.2 & 0.8 \\ 0.4 & 0.6 \end{bmatrix}$ and the initial probability vector $𝐮 = \begin{bmatrix} 0.5 & 0.5 \end{bmatrix}$, find $𝐏^2$ and $𝐮^{(2)}$.
(Enter each value in decimal form.)
"""

# ╔═╡ bee31e17-1f81-4ad5-9ac3-afc865c5226b
let
	P = [0.2 0.8
		 0.4 0.6]
	u = [0.5 0.5]
	P^2, u*P^2
end

# ╔═╡ c94ad487-15b2-41e7-b700-8ce021bfc86b
md"# Reading 27: Absorbing Markov Chains"

# ╔═╡ 05d1faca-9ddb-4fa8-b3bb-0da5bd6652ef
md"""
### Question 1

Give an example of a transition matrix for an absorbing Markov chain with two states.
(Note: Canvas will not be able to automatically grade this question, so it will probably show your answer as wrong. I'll grade these by hand afterwards.)
"""

# ╔═╡ d1892e9d-b653-4fad-9b04-ea00cfd222e9
[0.5 0.5
 0   1]

# ╔═╡ 12d9f13e-dd3e-4631-aa11-8040c7bcff31
md"""
### Question 2

Find the fundamental matrix $𝐍$ for the transition matrix shown below.
(Enter your answers as integers or in decimal form.)

$𝐏 = \begin{bmatrix} 0.1 & 0.3 & 0.6 \\ 0.3 & 0.4 & 0.3 \\ 0 & 0 & 1 \end{bmatrix}$
"""

# ╔═╡ 9b068d12-eac4-4ea5-9cc4-46ec34b4d288
let
	P = [0.1 0.3 0.6
		 0.3 0.4 0.3
		   0   0   1]
	
	Q = P[1:2, 1:2]
	
	N = inv(I - Q)
end

# ╔═╡ 5423a16c-7c3a-4d23-87cb-e6aaee63b493
md"# Reading 28: Time to Absorption"

# ╔═╡ 5380dc68-d3c5-4329-97d8-9da74c56572a
md"""
### Question 1

Given the transition matrix below for an aborbing Markov chain, what is the expected number of steps before absorption when starting in state $s_2$?
(Enter your answer in decimal form.)
"""

# ╔═╡ 5e615f54-6be1-41b7-82f7-f6c2eb11b478
let
	P = [0.4 0.5 0.1
		 0.1 0.5 0.4
		 0   0   1  ]
	
	t = 2
	Q = P[1:t, 1:t]
	
	N = inv(I - Q)
	
	c = ones(t)
	
	N*c
end

# ╔═╡ 06c78b82-df9e-4045-a02b-0acfc5eb13d4
md"$\text{Answer} = 2.8$"

# ╔═╡ 3992b2c7-8648-4dcf-a509-4d704d116dbd
md"# Reading 31: Equilibrium"

# ╔═╡ 1350e2c1-2034-4a70-af94-54001af88307
md"""
### Question 1

Find the fixed probability vector for the Markov chain given below.
(Enter your answers as reduced fractions.)

$𝐏 = \begin{bmatrix}
1/3 & 1/3 & 1/3 \\
1/2 & 1/4 & 1/4 \\
0 & 1 & 0
\end{bmatrix}$
"""

# ╔═╡ 3251e92d-3fdd-458a-9277-128d514af59f
let
	P = [1/3 1/3 1/3
	     1/2 1/4 1/4
	     0 1 0]

	P^15
end

# ╔═╡ c3f3ea9d-12f8-4772-90dc-b4a98466f6db
md"""
$𝐰𝐏 = 𝐰$

$\begin{pmatrix} w_1 & w_2 & w_3 \end{pmatrix} \begin{bmatrix}
1/3 & 1/3 & 1/3 \\
1/2 & 1/4 & 1/4 \\
0 & 1 & 0
\end{bmatrix} = \begin{pmatrix} w_1 & w_2 & w_3 \end{pmatrix}$

$\begin{align*}
\frac{w_1}{3} + \frac{w_2}{2} &= w_1 \\
\frac{w_1}{3} + \frac{w_2}{4} + w_3 &= w_2 \\
\frac{w_1}{3} + \frac{w_2}{4} &= w_3
\end{align*}$

Let $w_1 = 1$.
Then

$\frac{1}{3} + \frac{w_2}{2} = 1 \implies w_2 = \frac{4}{3}$

$\frac{1}{3} + \frac{1}{3} = w_3 \implies w_3 = \frac{2}{3}$

$𝐰 = \begin{pmatrix} 1 & \frac{4}{3} & \frac{2}{3} \end{pmatrix}$

$\|𝐰\| = \begin{pmatrix} \frac{1}{3} & \frac{4}{9} & \frac{2}{9} \end{pmatrix}$
"""

# ╔═╡ 802ddb8b-e165-458e-aec0-787665df1744
1//3, 4//9, 2//9

# ╔═╡ 6ab2575d-b1ae-432b-b7e7-ed1aeda9d766
md"# Reading 32: Mean First Passage Time"

# ╔═╡ dfb10b58-87c6-4ebc-b348-e161c0fddf28
md"""
### Question 1

Suppose we play Rock-Paper-Scissors with the strategy of throwing rock, paper, or scissors randomly with probabilities determined by what we have just thrown in the previous round of the game according to the following transition matrix (the states are in order R-P-S):

$𝐏 = \begin{bmatrix} 0 & 1/3 & 2/3 \\ 1/2 & 0 & 1/2 \\ 1 & 0 & 0 \end{bmatrix}$

If we have just thrown paper, what is the mean time until we will throw rock?
(Enter your answer as a reduced fraction.)
"""

# ╔═╡ 2d9d7f3b-2588-4a73-be97-ed235e13937f
md"""
$m_{ij} = 1 + \sum_{k ≠ j} p_{ik} m_{kj}$

$\begin{align*}
m_{PR} &= 1 + p_{PP} m_{PR} + p_{PS} m_{SR} \\
&= 1 + (0) m_{PR} + \left(\frac{1}{2}\right) m_{SR} \\
&= 1 + 0 + \frac{1}{2} (1) \\
&= \frac{3}{2}
\end{align*}$

$\begin{align*}
m_{SR} &= 1 + p_{SS} m_{SR} + p_{SP} m_{PR} \\
&= 1 + (0) m_{SR} + (0) m_{PR} \\
&= 1 + 0 + 0 \\
&= 1
\end{align*}$
"""

# ╔═╡ 1e1b21a9-03c9-4e07-a32c-5fbc35b6b101
let
	P = [0 1/2 1/2
		 0 0   1
		 0 0   1]
	Q = P[1:2, 1:2]
	N = inv(I - Q)
	N * ones(2)
	det(N)
end

# ╔═╡ 08058e22-4329-4244-bd71-4ecdf8c8d909
[1 1//3 5//6] .// sum([1 1//3 5//6])

# ╔═╡ c18c9415-f824-4b97-b6b1-42c51f63d5f6


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Combinatorics = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Primes = "27ebfcd6-29c5-5fa9-bf4b-fb8fc14df3ae"
QuadGK = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
Combinatorics = "~1.0.2"
Distributions = "~0.25.20"
LaTeXStrings = "~1.2.1"
Plots = "~1.21.1"
PlutoUI = "~0.7.9"
Primes = "~0.5.0"
QuadGK = "~2.4.2"
StatsBase = "~0.33.10"
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

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "d9e40e3e370ee56c5b57e0db651d8f92bce98fea"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.10.1"

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

[[Combinatorics]]
git-tree-sha1 = "08c8b6831dc00bfea825826be0bc8336fc369860"
uuid = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
version = "1.0.2"

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

[[Distributions]]
deps = ["ChainRulesCore", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns"]
git-tree-sha1 = "9809cf6871ca006d5a4669136c09e77ba08bf51a"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.20"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "a32185f5428d3986f47c2ab78b1f216d5e6cc96f"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.5"

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

[[FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "8756f9935b7ccc9064c6eef0bff0ad643df733a3"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.7"

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

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "f0c6489b12d28fb4c2103073ec7452f3423bd308"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.1"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

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

[[LogExpFunctions]]
deps = ["ChainRulesCore", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "6193c3815f13ba1b78a51ce391db8be016ae9214"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.4"

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

[[OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"

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

[[Primes]]
git-tree-sha1 = "afccf037da52fa596223e5a0e331ff752e0e845c"
uuid = "27ebfcd6-29c5-5fa9-bf4b-fb8fc14df3ae"
version = "0.5.0"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

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

[[SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "2d57e14cd614083f132b6224874296287bfa3979"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.8.0"

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

[[StatsFuns]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "95072ef1a22b057b1e80f73c2a89ad238ae4cfff"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.12"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "1700b86ad59348c0f9f68ddc95117071f947072d"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.1"

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
# ╟─b8f4a4c2-052f-11ec-3ee3-cd29309f073a
# ╟─0b5fd691-21f0-47c7-8821-8268a342399f
# ╟─6344c2b4-d586-4721-8434-bc73795181b1
# ╠═f4fb16d7-119b-4522-aa0c-d86bb9e0688f
# ╟─c153361c-d7b3-4072-8b11-d7659ec74871
# ╟─c6ebfb60-74ed-4108-b6bc-75556d02f25d
# ╠═2ba8f044-ff5e-4777-917f-6308a6c964a0
# ╟─2960e37d-1e87-418b-b90f-6f0eba7db0d8
# ╟─e8e87d64-b31b-44fc-85e0-e75a712aaf0d
# ╟─3ca18b1d-2411-466b-8bc7-15a2035a5491
# ╟─8e15df4c-cca6-4a85-9448-f0d9340343d6
# ╟─2afd6183-cbc1-4312-af30-bc235ff38b2a
# ╟─c06b366c-39ee-48e9-a20a-626b92598aab
# ╟─33b37c29-cbf3-4f85-9e32-e72118376049
# ╟─de4b1fc5-5053-4003-bb2e-ce348d6cd8a4
# ╠═abf21c78-0846-44b3-a211-c870465becd6
# ╠═1e161e0a-6fef-44f0-9445-968c0a1c2062
# ╟─d106535a-a04a-4e2f-b1fe-e35ca2800d02
# ╠═32704247-140d-4ca9-a028-7f817403ecb5
# ╠═683d56ce-8435-43d5-a8da-274b83159511
# ╠═38514ac2-d6d6-4b73-b30b-fe1cd0bd77f0
# ╟─0a0d27fb-e2e9-4048-bf0e-dd4802494b35
# ╟─c336d7b9-7f62-443a-9104-7d9c579d165e
# ╟─2a839af0-d24a-4931-bbcc-ce62b15bd52a
# ╠═b071a778-c7d9-490e-8038-c3df0e2d5308
# ╟─d85dd4dd-c3d5-4c16-b618-57edb4ef9ebe
# ╟─2343cd96-5e03-48d6-95f7-2cee1c5e7225
# ╟─d68ee6b9-8050-473b-8b83-d20a49c09547
# ╟─aca0116a-5b94-47fc-91a8-ee5855588875
# ╟─d957854a-ac6d-4f55-a17e-c3f6806242a4
# ╟─d5a0339a-b380-4c9d-9a04-1029aa6f535a
# ╟─5ce93677-56d2-403f-8582-7ff369629d5f
# ╟─ca050825-6f19-4655-9e07-be1125d5f098
# ╟─1b237d28-f34e-4590-ac96-3a0bf6aaa71f
# ╟─a0d74a88-3f95-4c97-b631-513ca8f4704a
# ╟─ce24bfd9-3ef7-43d2-a177-0b7179462827
# ╟─554a0922-540e-41f3-b641-883c06d0f7f0
# ╟─d634b934-d53e-4d2b-a68f-9ad14a2f2f27
# ╟─922ca9e5-985b-4c1f-8b58-ad38a7b08d01
# ╟─31d196c1-3de5-4982-a4a4-e1f2cebf1554
# ╟─3a0f9dc7-cfe6-4dc6-8efd-1cf1e97ceddc
# ╟─6018ccae-ca62-4495-acc1-391b2f08297c
# ╟─c36cc9fb-ffe0-44e0-b47c-fa42b5e08dc7
# ╠═c51bff51-1fda-4dee-982e-fb3d751d3862
# ╟─4509c982-c842-45b8-9770-ab7020955223
# ╟─2061ed89-a9bf-48b0-9cc7-7806da519683
# ╟─1b3916ea-162b-4774-95ec-658733617d65
# ╟─4b2a2b11-923b-45da-ba62-9c966515b6d5
# ╠═0d872559-7585-4727-aa41-debf45ad02d9
# ╟─d303e3e3-b362-4eec-9b8b-594ffb86c1b5
# ╟─9ef7be0d-ef75-4be8-95df-8603b2ee57d2
# ╠═e1311d15-b1ae-4ed5-a271-f41211debecb
# ╟─2a8c27d0-18e7-4ce9-94ba-515062492092
# ╟─8df7610a-6603-408e-8d81-e492cb688a55
# ╟─9da56a02-d9b7-4ca2-93ed-7a2ddd3482db
# ╟─8ff39d3e-bfda-47ba-b418-6cd7a74f843b
# ╟─828f19f3-e0b4-4cc6-89e4-04afcef1027b
# ╟─fc4e3eef-6df7-4696-995c-a278dc948507
# ╟─bdd50995-d47b-4ab0-9bbb-f262e381d142
# ╟─488d60c0-f244-43a7-bfb8-c09ff315abf1
# ╟─dc276bc2-b367-4440-b224-2a2b10403028
# ╠═9e9573c6-55a5-4dd4-8bdb-a9e5c6c41626
# ╟─be0d3a76-8b2f-48df-99ef-76c386b12df3
# ╟─14ce9360-8c22-4716-a1d9-e28c2fe702da
# ╟─ccc4a33a-8850-4fbb-be94-bb9ef3a70179
# ╟─0a77c193-f4ce-48ea-a89e-f87cc8e5a620
# ╠═183261a2-c341-4f0a-b8b0-01a4f12d1107
# ╟─e09cfde4-54b5-4ac1-93d1-869d3538e69a
# ╟─96f3b6ba-d314-4aa1-8e53-04574c52ccf4
# ╟─086f6f88-3b11-4c03-aaa1-ba2e627519fc
# ╠═559dacad-7006-4af8-b870-1571a2884d12
# ╟─410a1deb-23e1-44a7-b9bf-5abfba6254f6
# ╟─bbad4f7a-b6a6-44c3-a431-587fa7b45302
# ╟─251a2c7d-a8c6-4cc7-88ec-e4f2caa962de
# ╟─0265e7b1-dbf1-4ea8-b75f-f89e6cb97315
# ╟─eb6915b6-c611-497e-bfb1-0d6c3c3abb70
# ╟─3f0b44d4-497b-4723-b9fb-adc0fdd7308b
# ╠═772995be-3d96-4351-814d-2e0d168d4240
# ╟─05e2ecac-11e6-40bb-b668-903f39c2602a
# ╟─69bedc9f-60fc-41f0-ad5f-b2afdd15992f
# ╠═5220ed49-01f0-423b-a131-68a924e01c4b
# ╠═ab44a863-1b97-4f9e-a774-34875a3a4571
# ╠═7a1a1f40-a3d2-451e-8d4b-f885b3eb8b50
# ╟─df494973-245b-4261-a0da-1bc83724275b
# ╟─e31bb374-e36f-472d-b567-324f627b182e
# ╟─9ad39115-4cda-483d-b9f5-96932ffb9bee
# ╠═331e8bf2-ac6c-4719-b098-9eb010560626
# ╟─9ba6206d-f032-4c80-9b34-4f1ecd1a14f2
# ╟─7e0d004e-5dbd-4c77-b875-7b930b2c21a9
# ╠═de26dc77-2966-4476-8f7a-b380255b8465
# ╟─c1823c18-b710-4209-b55d-6856d9ab98a4
# ╠═3eb6f194-bd7f-426d-aa78-90479ceca05a
# ╟─7c1a670f-798d-4e67-8bf7-a5d430ac2402
# ╠═473ab822-e3fc-4fd6-a00c-91f5c35142a1
# ╟─277333d5-e821-474f-92ac-a3b805b48bcd
# ╟─616feb12-fb9b-4088-8f30-b38c6c513c97
# ╟─00e0c5d5-2385-47fd-b421-caf639c8a459
# ╟─cc633129-77ef-46e9-a0b9-7b6d2915d63c
# ╠═a52dd510-91b8-42c0-b011-78d578abcde7
# ╟─95e85ba0-eb99-4224-afef-7f9d893afadf
# ╠═8de8edbc-3f7f-4e56-96ed-0fb9d35e6e2c
# ╟─4a8220d8-3cf9-44a6-b2c5-fec3becd4036
# ╠═77006cfe-df0e-49c8-9c61-a8380544d560
# ╟─82af0551-692a-4bdb-a0ca-c1b1b1a91398
# ╟─c00a6dd7-4e43-44c3-9f32-52a8a860e771
# ╠═57aaa030-30ad-4002-b3d3-8bb6a15f344d
# ╟─87f3580e-648c-4fba-a6f5-0b6be9e9b8cf
# ╠═bf5b5cd6-2c71-4efb-aa26-bdfa57868b01
# ╟─c5a38bf2-a579-4b02-8444-065bf5fc62f0
# ╟─a0401965-b0f6-4e04-ab49-195c979b2981
# ╠═bee31e17-1f81-4ad5-9ac3-afc865c5226b
# ╟─c94ad487-15b2-41e7-b700-8ce021bfc86b
# ╟─05d1faca-9ddb-4fa8-b3bb-0da5bd6652ef
# ╠═d1892e9d-b653-4fad-9b04-ea00cfd222e9
# ╟─12d9f13e-dd3e-4631-aa11-8040c7bcff31
# ╠═9b068d12-eac4-4ea5-9cc4-46ec34b4d288
# ╟─5423a16c-7c3a-4d23-87cb-e6aaee63b493
# ╟─5380dc68-d3c5-4329-97d8-9da74c56572a
# ╠═5e615f54-6be1-41b7-82f7-f6c2eb11b478
# ╟─06c78b82-df9e-4045-a02b-0acfc5eb13d4
# ╟─3992b2c7-8648-4dcf-a509-4d704d116dbd
# ╟─1350e2c1-2034-4a70-af94-54001af88307
# ╠═3251e92d-3fdd-458a-9277-128d514af59f
# ╟─c3f3ea9d-12f8-4772-90dc-b4a98466f6db
# ╠═802ddb8b-e165-458e-aec0-787665df1744
# ╟─6ab2575d-b1ae-432b-b7e7-ed1aeda9d766
# ╟─dfb10b58-87c6-4ebc-b348-e161c0fddf28
# ╟─2d9d7f3b-2588-4a73-be97-ed235e13937f
# ╠═1e1b21a9-03c9-4e07-a32c-5fbc35b6b101
# ╠═08058e22-4329-4244-bd71-4ecdf8c8d909
# ╠═c18c9415-f824-4b97-b6b1-42c51f63d5f6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
