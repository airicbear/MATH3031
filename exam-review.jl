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

# ╔═╡ 1ea52bbe-1fc5-11ec-2690-e3c516d40f3f
begin	
	using PlutoUI
	using StatsPlots
	using StatsBase
	using Turing
	using Distributions
	using LinearAlgebra

	pZ(k, pX::Function, pY::Function, Ω) = sum([pX(i) * pY(k - i) for i ∈ Ω])

	function Ωz(Z::Function, Ωx, Ωy)
		Zs = [Z(X, Y) for X ∈ Ωx for Y ∈ Ωy]
		min(Zs...):max(Zs...)
	end

	function ϕ(x)
		pdf(Normal(), x)
	end

	function NA(a, b)
		cdf(Normal(), b) - cdf(Normal(), a)
	end
	
	md"# Exam Review Problems"
end

# ╔═╡ 72357737-85b1-4f4b-8b60-2ae897174dbe
md"""
## Exam 1 Review Problems
"""

# ╔═╡ 2329f08d-83e7-476b-84be-8a7a9f064f64
md"""
### Problem 1

Suppose a 6-sided die is biased so that each odd number is equally likely to be rolled; but each even number is twice as likely as each odd number to be rolled.

a. Calculate the probability distribution of the outcome $X$ of a single roll.

b. Calculate the probability of the event $A$ that the outcome of a roll is prime.

c. Determine if the events $B = \{2, 3\}$ and $C = \{1, 3, 5\}$ are independent.

d. Calculate $E(X)$ and $V(X)$.
"""

# ╔═╡ ea3964fb-944b-4a24-919e-0b82d179dc39
md"""
**Solution (a).**

$Ω = \{1, 2, 3, 4, 5, 6\}$

$P(X \text{ is even}) = 2P(X \text{ is odd})$

Let ``x = P(X \text{ is odd})`` and ``y = P(X \text{ is even})``.

$\begin{align*}
3x + 3y &= 1 \\
3x + 3(2x) &= 1 \\
9x &= 1 \\
x &= \frac{1}{9} \\
y &= \frac{2}{9}
\end{align*}$

$P(X) = \begin{pmatrix} 1 & 2 & 3 & 4 & 5 & 6 \\ \frac{1}{9} & \frac{2}{9} & \frac{1}{9} & \frac{2}{9} & \frac{1}{9} & \frac{2}{9} \end{pmatrix}$
"""

# ╔═╡ db04f72b-b407-427f-a123-b2bb548fc976
md"""
**Solution (b).**

$A = \{2, 3, 5\}$

$P(A) = P(2) + P(3) + P(5) = \frac{2}{9} + \frac{1}{9} + \frac{1}{9} = \frac{4}{9}$
"""

# ╔═╡ db011268-7925-4bbb-9465-c49c73673aeb
md"""
**Solution (c).**

$P(B) = P(2) + P(3) = \frac{2}{9} + \frac{1}{9} = \frac{1}{3}$

$P(C) = P(1) + P(3) + P(5) = \frac{1}{9} + \frac{1}{9} + \frac{1}{9} = \frac{1}{3}$

$P(B) P(C) = \frac{1}{9}$

$P(B ∩ C) = P(3) = \frac{1}{9}$

$P(B ∩ C) = P(B) P(C) \implies B \text{ and } C \text{ are independent.}$
"""

# ╔═╡ fb37739f-a4b4-4a96-8bc4-2b2e87122082
md"""
**Solution (d).**

$E(X) = \frac{1}{9} (1 + 3 + 5) + \frac{2}{9} (2 + 4 + 6) = \frac{9 + 24}{9} = \frac{33}{9} = \frac{11}{3}$

$E(X^2) = \frac{1}{9} (1 + 9 + 25) + \frac{2}{9} (4 + 16 + 36) = \frac{35 + 112}{9} = \frac{147}{9}$

$E(X)^2 = \frac{121}{9}$

$V(X) = E(X^2) - E(X)^2 = \frac{147}{9} - \frac{121}{9} = \frac{26}{9}$
"""

# ╔═╡ 529d8de1-15a3-42b1-8a2e-64d8ab12f9de
md"""
### Problem 2

An urn contains 5 red balls, 4 green balls, and 7 brown balls.
A sample of 3 balls is selected at random without replacement.
What is the probability of selecting exactly 2 brown balls?
What is the probability of selecting one ball of each color?
(You should express your answers as formulas involving binomial coefficients.
You don't need to simplify them.)
"""

# ╔═╡ d21b799d-3e12-4a37-8aa2-e8c94d892560
md"""
**Solution.**

$P(2 \text{ brown balls}) = \frac{\begin{pmatrix} 7 \\ 2 \end{pmatrix} \begin{pmatrix} 5 \\ 1 \end{pmatrix} + \begin{pmatrix} 7 \\ 2 \end{pmatrix} \begin{pmatrix} 4 \\ 1 \end{pmatrix}}{\begin{pmatrix} 16 \\ 3 \end{pmatrix}}$

$P(1 \text{ of each}) = \frac{\begin{pmatrix} 5 \\ 1 \end{pmatrix} \begin{pmatrix} 4 \\ 1 \end{pmatrix} \begin{pmatrix} 7 \\ 1 \end{pmatrix}}{\begin{pmatrix} 16 \\ 3 \end{pmatrix}}$
"""

# ╔═╡ 0e46fbcc-8b28-45d3-aa59-4012829f913c
md"""
### Problem 3

Two real numbers $X$ and $Y$ are selected uniformly from the interval $[0, 2]$.
Find the cumulative distribution function for $|X - Y|$.
What is the probability that $|X - Y|$ is at least 1?
"""

# ╔═╡ 7a9e8a47-a57a-4f3a-b24c-7610083783ee
md"""
**Solution.**

$F_Z(z) = P(Z ≤ z) = P(|X - Y| ≤ z) \implies y ≤ z + x \text{ and } y ≥ x - z$
"""

# ╔═╡ 4063fbe7-5c11-4c87-8103-0458182d6754
md"""
``z =`` $(@bind z Slider(0:0.01:2, show_value = true))
"""

# ╔═╡ 7a4a7026-672e-409e-bfc9-7f586107dacb
let
	plot(x -> x - z, label=false, xlims=[0,2], ylims=[0,2], fillrange=x -> x + z, fillalpha=0.5)
end

# ╔═╡ 2fe135ef-9db9-4f19-983e-70e4f1d39fe1
md"""
The probability that $Z ≤ z$ is defined as the shaded area over the entire region.
The shaded area is defined by the difference of the area of the entire region, ``4``, and the area of the two unshaded triangles, ``(2 - z)^2``.
So, the probability is

$F_Z(z) = \begin{cases}
0 & \text{if } z < 0 \\
\frac{4 - (2 - z)^2}{4} & \text{if } 0 ≤ z ≤ 2 \\
1 & \text{if } z > 2
\end{cases}$

Then $P(Z ≥ 1) = 1 - P(Z ≤ 1) = 1 - \frac{3}{4} = \frac{1}{4}.$
"""

# ╔═╡ 73ce97cf-caee-4ca4-9279-2de0d545735a
md"""
### Problem 4

Suppose a continuous random variable $X$ has density function

$f(x) = \begin{cases}
0 &x < 0 \\
ax + b &0 ≤ x ≤ 1 \\
0 &x > 1
\end{cases}$

Give values for $a$ and $b$.
"""

# ╔═╡ 0517da82-7be0-4545-a6eb-ffda7a766edf
md"""
**Solution.**

$∫_{-∞}^{+∞} f(x) \;dx = ∫_0^1 ax + b \;dx = \left[\frac{ax^2}{2} + bx\right]_0^1 = \frac{a}{2} + b = 1$

$a = 0, \; b = 1$
"""

# ╔═╡ 9a617928-4149-48e8-9cce-3a5b7636c2c0
md"""
### Problem 5

Let $X$ count the number of successes in $n$ Bernoulli trials with probability of success $p$.
Assume $n ≥ 10$.

a. What is $P(X = 10)$?

b. Write a formula for $P(X ≥ 10)$.
"""

# ╔═╡ c15fc0c8-1870-457b-93d6-8cb26dd8280f
md"""
**Solution (a).**

$P(X = 10) = \begin{pmatrix} n \\ 10 \end{pmatrix} p^{10} (1 - p)^{n - 10}$
"""

# ╔═╡ f8ebbb8a-0cc7-48f3-bfd9-00e43e50eace
md"""
**Solution (b).**

$P(X ≥ 10) = \sum_{k = 10}^n \begin{pmatrix} n \\ k \end{pmatrix} p^k (1 - p)^{n - k}$
"""

# ╔═╡ 6aafa8d2-c2fd-41ce-bca4-bc38a409dc18
md"""
### Problem 6

Give an example of a sample space ``Ω`` and events ``A,B,C`` so that ``P(A ∩ B ∩ C) = P(A)P(B)P(C)``, but ``A,B,C`` are not mutually independent.
"""

# ╔═╡ d3a95372-a81b-40d4-b61d-c1aa8e6c3615
md"""
**Solution.**
We want it so that either $P(A ∩ B) ≠ P(A)P(B)$, $P(B ∩ C) ≠ P(B)P(C)$, or $P(A ∩ C) ≠ P(A)P(C)$.

Let $Ω = \{1, 2, …, 12\}$ be uniform.
Let $A = \{1, 2, …, 6\}$, $B = \{2, 3, …, 7\}$, and $C = \{2, 10, 11, 12\}$.

$P(A) = P(B) = \frac{1}{2}, \; P(C) = \frac{1}{3}, \; P(A ∩ B ∩ C) = \frac{1}{12} = \frac{1}{2} ⋅ \frac{1}{2} ⋅ \frac{1}{3}$

$P(A ∩ B) = \frac{5}{12} ≠ \frac{1}{2} ⋅ \frac{1}{2} = P(A)P(B)$
"""

# ╔═╡ 91e3ef8a-62a5-4078-9ed0-6c08200d76fd
md"""
### Problem 7

Let ``A ⊂ Ω``.
Are the events ``A`` and ``Ω`` independent?
"""

# ╔═╡ d9ab5757-bc8e-4a4b-8606-f842f193fb7f
md"""
**Solution.**

$P(Ω ∩ A) = P(A) = P(Ω)P(A)$

Yes, they are independent assuming that $P(Ω) = 1$.
"""

# ╔═╡ 9bf69e03-782b-4c93-9418-19863098b2db
md"""
### Problem 8

In how many distinct ways can the letters of the word COMBINATORICS be rearranged?
"""

# ╔═╡ 17493b50-b467-483d-985e-ea084f745015
md"""
**Solution.**
There are 13 letters in total and 3 letters that are duplicated twice.
So there are $\displaystyle \frac{13!}{2! 2! 2!}$ ways that the word COMBINATORICS can be rearranged.
"""

# ╔═╡ 1731e525-9cc9-4890-a87f-89fce196ed97
md"""
### Problem 9

If ``X`` is a continuous random variable with density function ``f(x)`` given below, find ``P(0 ≤ X ≤ 1/3)``.
What is the cumulative distribution function ``F(x)`` for ``X``?

$f(x) = \begin{cases}
0 & x < 0 \\
4x^3 & 0 ≤ x ≤ 1 \\
0 & x > 1
\end{cases}$
"""

# ╔═╡ 5002115c-6c82-41e5-bee9-7fef966b1344
md"""
**Solution.**

$F(x) = ∫_{-∞}^{x} f(x) \;dx = ∫_0^x 4x^3 = \left[x^4\right]_0^x \implies F(x) = \begin{cases} 0 & x < 0 \\ x^4 & 0 ≤ x ≤ 1 \\ 1 & x > 1 \end{cases}$

$P(0 ≤ X ≤ 1/3) = F(1/3) - F(0) = \frac{1}{3^4} = \frac{1}{81}$
"""

# ╔═╡ 435a6056-08f4-4f55-a728-93b4fbce4af6
md"""
### Problem 10

Suppose a factory produces an average of 10 defective gadgets each day.
What is the probability of producing only 5 defective gadgets on a particular day?
"""

# ╔═╡ ef63c180-434d-4902-a2db-35a199900b5b
md"""
**Solution.**
Let ``X`` be the number of defective gadgets in a day.
Then ``X`` is Poisson-distributed with ``\lambda = 10``, so

$P(X = 5) = \frac{10^5}{5!} e^{-10}$

*Reminder:* Poisson distribution is given by $P(X = k) = \frac{\lambda^k}{k!} e^{-\lambda}$.
"""

# ╔═╡ 268781ef-b31a-4cbe-b08b-53413ff85c47
md"""
### Problem 11

Suppose a fair 6-sided die is rolled 20 times in a row.
What is the expected number of times consecutive rolls both come up even?
"""

# ╔═╡ f15c8b04-6cfa-40b0-8a00-3b915958f380
md"""
**Solution.**

$X_i = \text{consecutive roll is even}$

$S = X_1 + X_2 + ⋯ + X_{19}$

$E(X_i) = \frac{1}{4}$

$E(S) = 19E(X_i) = \frac{19}{4}$
"""

# ╔═╡ f4abf725-09f6-47e8-8a39-3acd43e932de
md"""
### Problem 12

Suppose a point $(X, Y)$ is chosen uniformly at random from the unit disk.
Find the conditional probability that the distance from the origin is less than $1/2$ given that the distance is at least $1/3$.
"""

# ╔═╡ cdeb09cd-6039-4448-9358-43068de2634c
md"""
**Solution.**

Let $A = X^2 + Y^2 < (1/2)^2$ and $B = X^2 + Y^2 > (1/3)^2$. Then

$P(A) = P(X^2 + Y^2 < (1/2)^2) = \frac{\pi(1/2)^2}{\pi} = \frac{1}{4}$

$P(B) = P(X^2 + Y^2 > (1/3)^2) = \frac{\pi - \pi(1/3)^2}{\pi} = 1 - \frac{1}{9} = \frac{8}{9}$

$P(A ∩ B) = P((1/3)^2 < X^2 + Y^2 < (1/2)^2) = \frac{\pi(1/2)^2 - \pi(1/3)^2}{\pi} = \frac{1}{4} - \frac{1}{9} = \frac{5}{36}$

$P(A ∣ B) = \frac{P(A ∩ B)}{P(B)} = \frac{5}{36} ⋅ \frac{9}{8} = \frac{5}{32}$
"""

# ╔═╡ 2292925c-c6c3-46f2-a86b-de9538e57d01
md"""
### Problem 13

Suppose an urn contains 4 red balls and 3 green balls.
If a sample of two balls is drawn without replacement, what is the conditional probability that both balls are red given that at least one of them is red?
"""

# ╔═╡ 695bae8c-39ed-4cf2-8ed2-7967f4fb7007
md"""
**Solution.**
Let ``A`` be the event that both balls are red and ``B`` the event that at least one is red.
Then ``A ∩ B = A``.

$P(A ∩ B) = P(A) = \frac{\begin{pmatrix} 4 \\ 2 \end{pmatrix}}{\begin{pmatrix} 7 \\ 2 \end{pmatrix}} = \frac{\frac{4!}{2!2!}}{\frac{7!}{2! 5!}} = \frac{6}{21} = \frac{2}{7}$

$P(B) = 1 - P(2 \text{ green}) = 1 - \frac{\begin{pmatrix} 3 \\ 2 \end{pmatrix}}{\begin{pmatrix} 7 \\ 2 \end{pmatrix}} = 1 - \frac{\frac{3!}{2! 1!}}{\frac{7!}{2! 5!}} = 1 - \frac{3}{\frac{7 ⋅ 6}{2}} = 1 - \frac{3}{21} = \frac{6}{7}$

$P(A ∣ B) = \frac{P(A ∩ B)}{P(B)} = \frac{2/7}{6/7} = \frac{1}{3}$
"""

# ╔═╡ e6284c66-1a34-449e-9d42-123370061e42
md"""
### Problem 14

A diagnostic test for a particular condition has sensitivity of 70% and a specificity of 90%.
If 5% of the population has the condition, what is the probability that a particular person has the condition given that they've received a positive test result?
"""

# ╔═╡ 98993bb7-61dd-4a27-992f-9e607c5a5df3
md"""
**Solution.**

$P(C ∣ +) = \frac{P(+ ∣ C)P(C)}{P(+)} = \frac{P(+ ∣ C)P(C)}{P(+ ∣ C)P(C) + P(+ ∣ NC) P(NC)}$

$P(+ ∣ C) = 0.7$

$P(- ∣ NC) = 0.9 \implies P(+ ∣ NC) = 0.1$

$P(C) = 0.05$

$P(NC) = 0.95$

$P(C ∣ +) = \frac{(0.7)(0.05)}{(0.7)(0.05) + (0.1)(0.95)} ≈ 27\%$
"""

# ╔═╡ 94467a32-c548-4ea0-9c8e-501102f0355d
md"""
### Problem 15

Suppose ``X`` represents the result of rolling a fair 10-sided die; ``Y`` represents the result of rolling a fair 6-sided die; and ``Z = X - Y``.
Find ``E(Z)`` and ``V(Z)``.
"""

# ╔═╡ ea8d0431-043a-4483-8364-653746e3d564
md"""
**Solution.**

$E(X) = \frac{1}{10} ⋅ \frac{10(10 + 1)}{2} = \frac{11}{2}$

$E(Y) = \frac{1}{6} ⋅ \frac{6(6 + 1)}{2} = \frac{7}{2}$

$E(Z) = E(X - Y) = E(X) - E(Y) = \frac{11}{2} - \frac{7}{2} = \frac{4}{2} = 2$

$E(X^2) = \frac{1}{10} ⋅ \frac{10(10 + 1)(2(10) + 1)}{6} = \frac{11(21)}{6} = \frac{77}{2}$

$E(Y^2) = \frac{1}{6} ⋅ \frac{6(6 + 1)(2(6) + 1)}{6} = \frac{7(13)}{6} = \frac{91}{6}$

$V(X) = E(X^2) - E(X)^2 = \frac{77}{2} - \frac{121}{4} = \frac{33}{4}$

$V(Y) = E(Y^2) - E(Y)^2 = \frac{91}{6} - \frac{49}{4} = \frac{35}{12}$

$V(Z) = V(X - Y) = V(X) + V(-Y) = V(X) + V(Y) = \frac{33}{4} + \frac{35}{12} = \frac{67}{6}$
"""

# ╔═╡ 8cfaecdd-4e39-4d0a-9be2-73fae96a084c
md"## Exam 2 Review"

# ╔═╡ 4a36cdbf-811e-4a83-8a92-4ac7a8dcab14
md"""
### Problem 1

Let $X_1$ and $X_2$ be independent random variables with common distribution

$p_X = \begin{pmatrix} 0 & 1 & 2 & 3 \\ 1/6 & 1/4 & 1/4 & 1/3 \end{pmatrix}$

Find the distribution of $Y = X_1 + X_2$.
"""

# ╔═╡ b13a773a-0fef-490c-9494-0e75262a80ee
md"""
**Solution.**

$\begin{align*}
p_Y(y) &= p_X ∗ p_X = \sum_{i = 0}^3 p_X(i) p_X(y - i)\\
&= (1/6) p_X(y) + (1/4) p_X(y - 1) + (1/6) p_X(y - 2) + (1/3) p_X(y - 3) \\
&= \begin{pmatrix} 0 & 1 & 2 & 3 & 4 & 5 & 6 \\ \frac{1}{36} & \frac{1}{12} & \frac{7}{48} & \frac{17}{12} & \frac{11}{48} & \frac{1}{6} & \frac{1}{9} \end{pmatrix}
\end{align*}$
"""

# ╔═╡ 752fcbc0-e44b-48b4-9ece-f2126ee79b9a
md"""
### Problem 2

Suppose a coin comes up heads with probability $p$.
Let $S_n$ represent the number of heads in $n$ coin flips.
Find the maximum value of $p$ if Chebyshev's Inequality yields

$P\left(\left|\frac{S_{100}}{100} - p\right| ≥ 0.1\right) ≤ 0.21$
"""

# ╔═╡ 52bc7447-b69c-4d12-8a17-f8b98b2c8b15
md"""
**Solution.**

$P\left(\left|\frac{S_{100}}{100} - p\right| ≥ 0.1\right) ≤ \frac{V\left(\frac{S_{100}}{100}\right)}{(0.1)^2}$

$V\left(\frac{S_{100}}{100}\right) = \left(\frac{1}{100}\right)^2 V(S_{100}) = \frac{V(X)}{100} = \frac{p(1 - p)}{100}$

$\frac{V\left(\frac{S_{100}}{100}\right)}{(0.1)^2} = \frac{p(1 - p)}{100 (0.1)^2} = p(1 - p) = 0.21 \implies p^2 - p + 0.21 = 0$

$p = \frac{1 ± \sqrt{1 - 4(0.21)}}{2} = \frac{1 ± \sqrt{0.16}}{2} = \frac{1 ± 0.4}{2}$

$p = \frac{1.4}{2} = 0.7$
"""

# ╔═╡ 5ce14bd9-8391-44db-9ecd-ceb7e3c828dc
md"""
### Problem 3

Let $X$ be a continuous random variable that's exponentially distributed with parameter $\lambda = 0.2$.
Use Chebyshev's Inequality to find an upper bound for $P(|X - 5| ≥ 2)$.
"""

# ╔═╡ 36b97dc3-3cfc-4239-b136-0d238bfeb3b8
md"""
**Solution.**
$V(X) = 1/(\lambda^2) = 1/(0.2)^2 = 25$

$P(|X - 5| ≥ 2) ≤ \frac{V(X)}{2^2} = \frac{25}{4}$
"""

# ╔═╡ f53a78db-0c42-4bbb-b1fb-fe768321bf64
md"""
### Problem 4

Let $S$ be the number of heads that come up in 100 tosses of a fair coin.
Use the Central Limit Theorem to estimate

$\text{(a) } P(S = 60) \quad\qquad \text{(b) } P(40 ≤ S ≤ 70) \quad\qquad \text{(c) } P(S > 45)$

(Note: Give your answers in terms of the normal density function $\phi(x)$ or the area $\text{NA}(0, b)$ under the standard normal curve from 0 to $b$.)
"""

# ╔═╡ 8bceddb0-6147-43e2-91a8-934a5d1492d6
md"""
**Solution (a).**

$\mu = p = 1/2$

$\sigma^2 = pq = (1/2)(1/2) = 1/4$

$x_{60} = \frac{60 - 100(1/2)}{\sqrt{100(1/4)}} = \frac{10}{5} = 2$

$P(S = 60) = \frac{\phi(x_{60})}{\sqrt{n\sigma^2}} = \frac{\phi(2)}{5}$
"""

# ╔═╡ 675337e5-7dc7-48f0-9900-fb6609a9c9d7
md"""
**Solution (b).**

$\begin{align*}
P(40 ≤ S ≤ 70) &≈ P\left(\frac{40 - 50 - 0.5}{5} ≤ S^* ≤ \frac{70 - 50 + 0.5}{5}\right) \\
&= P\left(-2.1 ≤ S^* ≤ 4.1\right) \\
&= \text{NA}(0, 2.1) + \text{NA}(0, 4.1)
\end{align*}$
"""

# ╔═╡ 3b628ee3-d110-40ed-8f45-97116f7513eb
md"""
**Solution (c).**

$\begin{align*}
P(S > 45) &= P\left(46 ≤ S ≤ 100\right) \\
&≈ P\left(\frac{46 - 50 - 0.5}{5} ≤ S^* ≤ \frac{100 - 50 - 0.5}{5}\right) \\
&= P(-0.9 ≤ S^* ≤ 10.1) \\
&= \text{NA}(0, 0.9) + 0.5
\end{align*}$
"""

# ╔═╡ 4dd05620-fa46-4e14-802b-d10b21d8ecb1
md"""
### Problem 5

Suppose a fair 6-sided die is rolled repeatedly until the running sum of the rolls adds up to at least 450.
Estimate the probability that this takes more than 144 rolls.
"""

# ╔═╡ 0ad38222-24a6-4f2b-a820-5bcc31074c2b
md"""
**Solution.**

$\begin{align*}
P(S_{144} < 450) &≈ P\left({S_{144}}^* ≤ \frac{450 - 144(7/2) + 0.5}{\sqrt{144(35/12)}}\right) \\
&= P\left({S_{144}}^* ≤ \frac{-55.5}{\sqrt{12 ⋅ 35}}\right) \\
&= 0.5 - \text{NA}\left(0, \frac{55.5}{\sqrt{12 ⋅ 35}}\right)
\end{align*}$
"""

# ╔═╡ 31408da2-6d14-44c4-bc5a-9a77be157ecf
md"""
**Solution.**
If $X_i$ indicates the result of roll $i$, then $E(X_i) = 7/2$ and $V(X_i) = 35/12$.
Write $S_n = X_1 + X_2 + ⋯ + X_n$.
The probability that we need more than 144 rolls to see a sum of 450 is the probability that $S_{144} < 450$.
So:

$\begin{align*}
P(S_{144} < 450) &≈ P\left(\frac{S_{144} - 144\left(\frac{7}{2}\right)}{\sqrt{144 \left(\frac{35}{12}\right)}} < \frac{450 - 144\left(\frac{7}{2}\right) + 0.5}{\sqrt{144\left(\frac{35}{12}\right)}}\right) \\
&= P\left(S_{144}^* ≤ \frac{449 - 504 + 0.5}{\sqrt{12 ⋅ 35}}\right) \\
&= P\left(S_{144}^* ≤ \frac{-55.5}{\sqrt{12 ⋅ 35}}\right) \\
&= 0.5 - \text{NA}\left(0, \frac{55.5}{\sqrt{12 ⋅ 35}}\right)
\end{align*}$
"""

# ╔═╡ 0d0b7766-ca32-485c-8956-d4abd8239aba
md"""
### Problem 6

Suppose $X$ gives the number of heads in 10 independent coin flips with a coin that comes up heads with probability 0.6, and $Y$ represents the number of heads in 20 independent coin flips with the same coin.
What is the moment generating function of $Z = X + Y$?
"""

# ╔═╡ 3d489aa8-452f-40bb-bbb1-e482a9f4ee8c
md"""
**Solution.**
$g_Z(t) = g_{X + Y}(t) = g_X(t) g_Y(t) = (pe + q)^{10} (pe + q)^{20} = (0.6e^t + 0.4)^{30}$
"""

# ╔═╡ a7eb853e-45fa-4f2b-afd8-a2896f96ddd7
md"""
### Problem 7

Suppose $X$ has moment generating function

$g(t) = \frac{e^{-2t}}{12} + \frac{e^t}{4} + \frac{2e^{4t}}{3}$

What are the possible values $X$ can take, and with what probabilities does it take those values?
What are the moments $\mu_1$ and $\mu_2$?
Use these moments to find $E(X)$ and $V(X)$.
"""

# ╔═╡ 335c0f02-0a73-4630-9b04-9a43b658139e
md"""
**Solution.**
$\displaystyle g(t) = \sum_{j = 0}^∞ e^{tx_j} P(X = x_j)$, so the values that $X$ can take are $-2, 1, 4$ with probabilities $1/12, 1/4, 2/3$, respectively.
The moments are $g^{(k)}(0)$:

$\begin{align*}
g'(t) &= -\frac{e^{-2t}}{6} + \frac{e^t}{4} + \frac{8e^{4t}}{3} \implies g'(0) = \frac{-1}{6} + \frac{1}{4} + \frac{8}{3} = \frac{11}{4} \\
g''(t) &= \frac{e^{-2t}}{3} + \frac{e^t}{4} + \frac{32e^{4t}}{3} \implies g'(0) = \frac{1}{6} + \frac{1}{4} + \frac{32}{3} = \frac{45}{4} \\
\end{align*}$

Then $\displaystyle E(X) = \mu_1 = \frac{11}{4}$, and $\displaystyle V(X) = \mu_2 - {\mu_1}^2 = \frac{45}{4} - \frac{121}{16} = \frac{59}{16}.$
"""

# ╔═╡ 20531fff-f8d0-4ad4-9e12-1c111284dbce
md"""
### Problem 8

If $X$ is a random variable and $Y = aX + b$ for some constants $a$ and $b$, what is the moment generating function $g_Y(t)$ for $Y$ in terms of the moment generating function $g_X(t)$ for $X$?
"""

# ╔═╡ b9d27850-c997-49bc-a5fa-65ff54237d0a
md"""
**Solution.**
Adding a constant $b$ to the random variable multiplies the moment generating function by $e^{bt}$.
Multiplying $X$ by the constant $a$ replaces $t$ with $at$ in the moment generating function.
So:

$g_Y(t) = g_{aX + b}(t) = e^{bt} g_X(at)$
"""

# ╔═╡ c230dded-a8f8-4ad5-ae2c-a20467a39828
md"""
### Problem 9

If $X$ is a continuous random variable with density function $f(x) = x$ on $[0, 1]$, find the moment generating function $g(t)$ for $X$.
"""

# ╔═╡ e0c35d9a-be8d-4c55-afcf-e9edde843590
md"""
**Solution.**

$g_X(t) = ∫_{-∞}^{∞} e^{tx} f_X(x) \;dx = ∫_0^1 xe^{tx} \;dx$

$\begin{align*}
u &= x &dv &= e^{tx} \;dx \\
du &= dx &v &= \frac{e^{tx}}{t}
\end{align*}$

$\begin{align*}
g_X(t) &= uv - ∫ v \;du \\
&= \left[\frac{xe^{tx}}{t} \right]_0^1 - ∫_0^1 \frac{e^{tx}}{t} \;dx \\
&= \frac{e^t}{t} - \left[\frac{e^{tx}}{t^2}\right]_0^1 \\
&= \frac{e^t}{t} - \left(\frac{e^t}{t^2} - \frac{1}{t^2}\right)
\end{align*}$
"""

# ╔═╡ e6774011-87fa-401a-bbda-f5d044060629
md"""
### Problem 10

Give examples of $2 × 2$ matrices $A$ and $B$ in which all entries of both matrices are strictly positive and $AB = BA$.
"""

# ╔═╡ f638f2f9-163d-4842-ad3d-e8a9a7f2ad0b
md"""
**Solution.**
Let $A = B = \begin{bmatrix} 1 & 1 \\ 1 & 1 \end{bmatrix}$.
Since $A$ and $B$ are equal, $AB = BA = A^2$.
"""

# ╔═╡ 0a8af707-4591-4d44-b581-4e3644c871a2
md"""
### Problem 11

Suppose the set of states of a Markov process consists of the values $\{0, 1, 2, 3, …, n\}$.
For each value $i$, the probability of transitioning to each $j ≥ i$ is equal, while the probability of transitioning to $j < i$ is 0.
So, for example, if $n = 4$, then from state 2 there is a 1/3 chance to transition to states 2, 3, or 4.

a. Write the transition matrix if $n = 4$.

b. Write the transition matrix if $n = 2$.
   In this case, also find the fundamental matrix $𝐍$ and determine the expected number of steps before absorbing if the process begins at state 0.

c. In the $n = 2$ case, calculate the matrix $𝐁 = 𝐍𝐑$ and interpret the results.
"""

# ╔═╡ 160d1f38-c49d-45c1-b52f-482ae192aa3b
md"""
**Solution.**

(a) $𝐏_4 = \begin{bmatrix} 1/5 & 1/5 & 1/5 & 1/5 & 1/5 \\ 0 & 1/4 & 1/4 & 1/4 & 1/4 \\ 0 & 0 & 1/3 & 1/3 & 1/3 \\ 0 & 0 & 0 & 1/2 & 1/2 \\ 0 & 0 & 0 & 0 & 1 \end{bmatrix}$

(b) $𝐏_2 = \begin{bmatrix} 1/3 & 1/3 & 1/3 \\ 0 & 1/2 & 1/2 \\ 0 & 0 & 1 \end{bmatrix}$

$𝐍 = (𝐈 - 𝐐)^{-1}$ 

$𝐈 - 𝐐 = \begin{bmatrix} 2/3 & -1/3 \\ 0 & 1/2 \end{bmatrix}$

$\det(𝐈 - 𝐐) = \frac{2}{3} ⋅ \frac{1}{2} = \frac{1}{3}$

$𝐍 = (𝐈 - 𝐐)^{-1} = \frac{1}{\det(𝐈 - 𝐐)} \begin{bmatrix} 1/2 & 1/3 \\ 0 & 2/3 \end{bmatrix} = 3 \begin{bmatrix} 1/2 & 1/3 \\ 0 & 2/3 \end{bmatrix} = \begin{bmatrix} 3/2 & 1 \\ 0 & 2 \end{bmatrix}$

The sum across the first row of $𝐍$ represents the expected number of steps before absorbing when starting in state $0$, which is $3/2 + 1 = 5/2$.
This can also be found using the $𝐭 = 𝐍𝐜$ vector at the $t_0$ entry

(c) $𝐁 = \begin{bmatrix} 3/2 & 1 \\ 0 & 2 \end{bmatrix} \begin{bmatrix} 1/3 \\ 1/2 \end{bmatrix} = \begin{bmatrix} 1 \\ 1 \end{bmatrix}$
"""

# ╔═╡ b52960fc-57df-42dd-9fbb-cb7be79ac097
md"""
## Final Exam Review Problems

Note: The Final Exam will be cumulative, but these review problems only cover material since Exam 2.
For review problems covering earlier material, see the Exam 1 Review and Exam 2 Review.
"""

# ╔═╡ 8676ab72-bcd5-4029-a9dd-2e934ec135bf
md"""
### Problem 1

Give an example of a Markov process with at least four states that is ergodic but not regular.
Explain.
"""

# ╔═╡ 23ce4697-6c69-4154-b14c-1e67cd505da6
md"""
**Solution.**

$\begin{bmatrix} 0 & 1 & 0 & 0 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \\ 1 & 0 & 0 & 0 \end{bmatrix}$

The states transition in a cycle so that every state can eventually transition to any other (ergodic), but there is no specific number of steps in which you can get from any state to any other in precisely that many steps (not regular).
"""

# ╔═╡ 7f3b9e4c-9e98-45f6-9c72-0a525681e9fa
md"""
### Problem 2

Give an example of a regular Markov process with unique probability vector ``𝐰 = \begin{bmatrix} 1/3 & 1/6 & 1/2 \end{bmatrix}``.
"""

# ╔═╡ b2189b68-99a5-4db7-be7e-2cfda141bfc6
md"""
**Solution.**
A regular Markov process ``𝐏`` has a unique probability vector ``𝐰`` such that ``𝐰𝐏 = 𝐰``.
``𝐏^n \to 𝐖`` as ``n → ∞`` where every row of ``𝐖`` is ``𝐰``.

$𝐖 = \begin{bmatrix} 1/3 & 1/6 & 1/2 \\ 1/3 & 1/6 & 1/2 \\ 1/3 & 1/6 & 1/2 \end{bmatrix}$

``𝐏`` is regular because all of its entries are positive.
"""

# ╔═╡ b219ff12-6f27-4ebe-b768-d8b0907c6ebd
md"""
### Problem 3

Find the unique fixed probability vector for the Markov chain

$𝐏 = \begin{bmatrix} 1/3 & 1/6 & 1/2 \\ 1/4 & 1/4 & 1/2 \\ 0 & 1/3 & 2/3 \end{bmatrix}$
"""

# ╔═╡ 8cef0be2-a5d2-4dde-862f-2d783b6c490d
md"""
**Solution.** ``𝐰𝐏 = 𝐰``

$\begin{pmatrix} w_1 & w_2 & w_3 \end{pmatrix} \begin{bmatrix} 1/3 & 1/6 & 1/2 \\ 1/4 & 1/4 & 1/2 \\ 0 & 1/3 & 2/3 \end{bmatrix} = \begin{pmatrix} w_1 & w_2 & w_3 \end{pmatrix}$

$\begin{align*}
\frac{1}{3} w_1 + \frac{1}{4} w_2 &= w_1 \\
\frac{1}{6} w_1 + \frac{1}{4} w_2 + \frac{1}{3} w_3 &= w_2 \\
\frac{1}{2} w_1 + \frac{1}{2} w_2 + \frac{2}{3} w_3 &= w_3
\end{align*}$

Let ``w_1 = 1``.

$\frac{1}{3} + \frac{1}{4} w_2 = 1$

Then ``w_2 = \frac{8}{3}``.

$\frac{1}{6} + \frac{1}{4} \left(\frac{8}{3}\right) + \frac{1}{3} w_3 = \frac{8}{3}$

$\frac{1}{6} + \frac{2}{3} + \frac{1}{3} w_3 = \frac{8}{3}$

Then ``w_3 = \frac{11}{2}``.

$w_1 + w_2 + w_3 = 1 + \frac{8}{3} + \frac{11}{2} = \frac{6 + 16 + 33}{6} = \frac{55}{6}$

$𝐰 = \frac{\begin{pmatrix} 1 & \frac{8}{3} & \frac{11}{2} \end{pmatrix}}{\frac{55}{6}} = \begin{pmatrix} \frac{6}{55} & \frac{16}{55} & \frac{3}{5} \end{pmatrix}$
"""

# ╔═╡ 5010d796-70dc-47e0-a1b7-34b1407a8963
md"""
### Problem 4

Suppose ``𝐏`` is a ``2 × 2`` transition matrix for an ergodic Markov process such that the columns of ``𝐏`` sum to 1.
What is the unique fixed probability vector ``𝐰``?
"""

# ╔═╡ eb15ebe7-4ea6-4438-9dbf-5c1d058e9180
md"""
**Solution.**
The rows must both sum to 1 and the columns must both sum to 1.
So, the elements of the transition matrix must be equal diagonally, denoted ``a`` and ``b``.

$𝐏 = \begin{bmatrix} a & b \\ b & a \end{bmatrix}$

$𝐰𝐏 = 𝐰$

$\begin{align*}
aw_1 + bw_2 &= w_1 \\
bw_1 + aw_2 &= w_2
\end{align*}$

Let ``w_1 = 1``.

$\begin{align*}
a + bw_2 &= 1 \\
b + aw_2 &= w_2
\end{align*}$

$w_2 = \frac{1 - a}{b} = \frac{1 - a}{1 - a} = 1$

$𝐰 = \frac{\begin{pmatrix} 1 & 1 \end{pmatrix}}{2} = \begin{pmatrix} \frac{1}{2} & \frac{1}{2} \end{pmatrix}$
"""

# ╔═╡ d547c318-6d22-4e0a-9668-933b9acc5504
md"""
### Problem 5

Consider the Markov proces with transition matrix ``𝐏`` below.
Find the mean first passage times from each of states ``s_2`` and ``s_3`` to state ``s_1``.
Also find the mean first recurrence times for every state.

$𝐏 = \begin{bmatrix} 1/4 & 1/4 & 1/2 \\ 1/3 & 1/3 & 1/3 \\ 0 & 1/6 & 5/6 \end{bmatrix}$
"""

# ╔═╡ ef8f79d8-418b-48f1-8e0d-b81134791639
md"""
**Solution.**

$\hat{𝐏} = \begin{bmatrix} 1/3 & 1/3 & 1/3 \\ 1/6 & 5/6 & 0 \\ 0 & 0 & 1 \end{bmatrix}$

$𝐈 - 𝐐 = \begin{bmatrix} 2/3 & -1/3 \\ -1/6 & 1/6 \end{bmatrix}$

$\det(𝐈 - 𝐐) = \frac{2}{3} ⋅ \frac{1}{6} - \frac{1}{3} ⋅ \frac{1}{6} = \frac{1}{18}$

$\hat{𝐍} = (𝐈 - 𝐐)^{-1} = 18 \begin{bmatrix} 1/6 & 1/3 \\ 1/6 & 2/3 \end{bmatrix} = \begin{bmatrix} 3 & 6 \\ 3 & 12 \end{bmatrix}$

$\hat{𝐍}𝐜 = \begin{pmatrix} 9 & 15 \end{pmatrix}$

$m_{s_2,s_1} = 9$

$m_{s_3,s_1} = 15$

$\begin{align*}
\frac{1}{4} w_1 + \frac{1}{3} w_2 &= w_1 \\
\frac{1}{4} w_1 + \frac{1}{3} w_2 + \frac{1}{6} w_3 &= w_2 \\
\frac{1}{2} w_1 + \frac{1}{3} w_2 + \frac{5}{6} w_3 &= w_3
\end{align*}$

Let ``w_1 = 1``.

$\frac{1}{4} + \frac{1}{3} w_2 = 1$

Then ``w_2 = \frac{9}{4}``.

$\frac{1}{4} + \frac{3}{4} + \frac{1}{6} w_3 = \frac{9}{4}$

Then ``w_3 = \frac{15}{2}``.

$𝐰 = \frac{\begin{pmatrix} 1 & \frac{9}{4} & \frac{15}{2} \end{pmatrix}}{\frac{43}{4}} = \begin{pmatrix} \frac{4}{43} & \frac{9}{43} & \frac{30}{43} \end{pmatrix}$

$𝐫 = \begin{pmatrix} \frac{43}{4} & \frac{43}{9} & \frac{43}{30} \end{pmatrix}$
"""

# ╔═╡ c7b3e9bd-4997-4b83-83e5-2c5720c962be
md"""
### Problem 6

Suppose we take a random walk in ``ℝ^2``.
Starting at the origin ``(0, 0)``, we either take a step one unit North (N), South (S), East (E), or West (W), each with equal probability.

a. What is the probability of returning to the origin in exactly ``2`` steps?

b. What is the probability of returning to the origin in exactly ``4`` steps?

c. What is the probability of returning to the origin in exactly ``2n`` steps?

d. What is the probability of returning to the origin in exactly ``4n`` steps?
"""

# ╔═╡ 06189272-5088-48d0-bca2-e8ba2d533f70
md"""
**Solution (a).**
There are 4 directional options for each step, so there are ``4^2 = 16`` total possible sequences of 2 steps.
If the first two steps are ``EW``, ``WE``, ``NS``, or ``SN``, then we will end up back at the origin.
The probability is then ``4/16 = 1/4``.
"""

# ╔═╡ 0ba0b1a1-279f-4c55-bab4-2ae9c00332e9
md"""
**Solution (b).**
In general, for a sequence of steps to return us to the origin, we need the number of ``E`` and ``W`` symbols to be equal, and we need the number of ``N`` and ``S`` steps to be equal.
The total number of sequences of length ``k`` will be ``4^k``.
In 4 steps, consider three separate cases: (1) we take only ``E/W`` steps, (2) we take only ``N/S`` steps, or (3) we must take exactly one step in each direction.
In case (1), there are ``\begin{pmatrix} 4 \\ 2 \end{pmatrix}`` ways to pick 2 of the 4 steps in the sequence to be ``E``, and the other steps must be ``W``.
Similarly, case (2) has ``\begin{pmatrix} 4 \\ 2 \end{pmatrix}`` sequences by choosing 2 out of 4 steps to be ``N``.
Finally, in case (3), we can make a sequence of choices:

- choose 2 out of 4 steps to have the ``E/W``, then
- choose 1 of those 2 steps to have ``E`` (the other must have ``W``), and finally
- choose 1 of the 2 empty spots to have ``N`` (the last must have ``S``).

So there are ``\begin{pmatrix} 4 \\ 2 \end{pmatrix} \begin{pmatrix} 2 \\ 1 \end{pmatrix} \begin{pmatrix} 2 \\ 1 \end{pmatrix}`` sequences in case (3).
Therefore the final probability is:
 
$\frac{\begin{pmatrix} 4 \\ 2 \end{pmatrix} + \begin{pmatrix} 4 \\ 2 \end{pmatrix} + \begin{pmatrix} 4 \\ 2 \end{pmatrix} \begin{pmatrix} 2 \\ 1 \end{pmatrix} \begin{pmatrix} 2 \\ 1 \end{pmatrix}}{4^4}$
"""

# ╔═╡ d6398914-ed02-47a5-901e-2d0d48cdf1a8
md"""
**Solution (c).**
If the total number of steps is ``2n``, then there are ``4^{2n}`` total sequences of ``2n`` steps.
There will be many separate cases:
for each ``0 ≤ k ≤ n``, there could be ``2k`` steps that use ``E/W`` steps and the remaining ``2n - 2k = 2(n - k)`` use ``N/S`` steps.
For each value of ``k``, to create one step sequence

- choose ``2k`` out of ``2n`` steps to have ``E/W``, then

- choose ``k`` out of those ``2k`` to be ``E`` (the rest of those ``2k`` must be ``W``), and finally

- choose ``n - k`` of the remaining ``2(n - k)`` steps to be ``N`` (the rest of those ``2(n - k)`` must be ``S``).

So the final probability is:

$\frac{\sum_{k = 0}^n \begin{pmatrix} 2n \\ 2k \end{pmatrix} \begin{pmatrix} 2k \\ k \end{pmatrix} \begin{pmatrix} 2(n - k) \\ n - k \end{pmatrix}}{4^{2n}}$
"""

# ╔═╡ 691b5234-af59-4a5f-8bfd-35a4c8bdcc74
md"""
**Solution (d).**
If the total number of steps is ``4n``, then there are ``4^{4n}`` total sequences of ``4n`` steps.
There will be many separate cases for each ``0 ≤ k ≤ n``, there could be ``2k`` steps that use ``E/W`` and the remaining ``4n - 2k = 2(2n - k)`` use ``N/S`` steps.
For each value of ``k``, to create one step sequence

- choose ``2k`` out of ``4n`` steps to have ``E/W``, then

- choose ``k`` out of those ``2k`` to be ``E`` (the rest of those must be ``W``), and finally

- choose ``2n - k`` of the remaining ``2(2n - k)`` steps to be ``N`` (the rest of those ``2(2n - k)`` must be ``S``).

So the final probability is:

$\frac{\sum_{k = 0}^n \begin{pmatrix} 4n \\ 2k \end{pmatrix} \begin{pmatrix} 2k \\ k \end{pmatrix} \begin{pmatrix} 2(2n - k) \\ 2n - k \end{pmatrix}}{4^{4n}}$
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
StatsPlots = "f3b207a7-027a-5e70-b257-86293d7955fd"
Turing = "fce5fe82-541a-59a6-adf8-730c64b5f9a0"

[compat]
Distributions = "~0.25.16"
PlutoUI = "~0.7.12"
StatsBase = "~0.33.10"
StatsPlots = "~0.14.27"
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

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "0bc60e3006ad95b4bb7497698dd7c6d649b9bc06"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.1"

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
git-tree-sha1 = "0a655e9a59ee1c8bafc3af18e96d90f980b08600"
uuid = "0bf59076-c3b1-5ca4-86bd-e02cd72cde3d"
version = "0.3.2"

[[AdvancedMH]]
deps = ["AbstractMCMC", "Distributions", "Random", "Requires"]
git-tree-sha1 = "8ad8bfddf8bb627d689ecb91599c349cbf15e971"
uuid = "5b7e9947-ddc0-4b3f-9b55-0d8042f74170"
version = "0.6.6"

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
deps = ["Compat", "IfElse", "LinearAlgebra", "Requires", "SparseArrays", "Static"]
git-tree-sha1 = "e527b258413e0c6d4f66ade574744c94edef81f8"
uuid = "4fba245c-0d91-5ea0-9b3e-6abc04ee57a9"
version = "3.1.40"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "66771c8d21c8ff5e3a93379480a2307ac36863f7"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.1"

[[AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "d127d5e4d86c7680b20c35d40b503c74b9a39b5e"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.4"

[[BangBang]]
deps = ["Compat", "ConstructionBase", "Future", "InitialValues", "LinearAlgebra", "Requires", "Setfield", "Tables", "ZygoteRules"]
git-tree-sha1 = "0ad226aa72d8671f20d0316e03028f0ba1624307"
uuid = "198e06fe-97b7-11e9-32a5-e1d131e6ad66"
version = "0.3.32"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Baselet]]
git-tree-sha1 = "aebf55e6d7795e02ca500a689d326ac979aaf89e"
uuid = "9718e550-a3fa-408a-8086-8db961cd8217"
version = "0.1.1"

[[Bijectors]]
deps = ["ArgCheck", "ChainRulesCore", "Compat", "Distributions", "Functors", "IrrationalConstants", "LinearAlgebra", "LogExpFunctions", "MappedArrays", "Random", "Reexport", "Requires", "Roots", "SparseArrays", "Statistics"]
git-tree-sha1 = "369af32fcb9be65d496dc43ad0bb713705d4e859"
uuid = "76274a88-744f-5084-9051-94815aaf08c4"
version = "0.9.11"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "f2202b55d816427cd385a9a4f3ffb226bee80f99"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+0"

[[ChainRules]]
deps = ["ChainRulesCore", "Compat", "LinearAlgebra", "Random", "RealDot", "Statistics"]
git-tree-sha1 = "035ef8a5382a614b2d8e3091b6fdbb1c2b050e11"
uuid = "082447d4-558c-5d27-93f4-14fc19e9eca2"
version = "1.12.1"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "f885e7e7c124f8c92650d61b9477b9ac2ee607dd"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.11.1"

[[ChangesOfVariables]]
deps = ["LinearAlgebra", "Test"]
git-tree-sha1 = "9a1d594397670492219635b35a3d830b04730d62"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.1"

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
git-tree-sha1 = "dce3e3fea680869eaa0b774b2e8343e9ff442313"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.40.0"

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
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

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

[[DensityInterface]]
deps = ["InverseFunctions", "Test"]
git-tree-sha1 = "794daf62dce7df839b8ed446fc59c68db4b5182f"
uuid = "b429d917-457f-4dbc-8f4c-0cc954292b1d"
version = "0.3.3"

[[DiffResults]]
deps = ["StaticArrays"]
git-tree-sha1 = "c18e98cba888c6c25d1c3b048e4b3380ca956805"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.0.3"

[[DiffRules]]
deps = ["LogExpFunctions", "NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "3287dacf67c3652d3fed09f4c12c187ae4dbb89a"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.4.0"

[[Distances]]
deps = ["LinearAlgebra", "Statistics", "StatsAPI"]
git-tree-sha1 = "837c83e5574582e07662bbbba733964ff7c26b9d"
uuid = "b4f34e82-e78d-54a5-968a-f98e89d6e8f7"
version = "0.10.6"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Distributions]]
deps = ["ChainRulesCore", "DensityInterface", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "Test"]
git-tree-sha1 = "2ea02796c118368c3eda414fc11f5a39259fa3d9"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.27"

[[DistributionsAD]]
deps = ["Adapt", "ChainRules", "ChainRulesCore", "Compat", "DiffRules", "Distributions", "FillArrays", "LinearAlgebra", "NaNMath", "PDMats", "Random", "Requires", "SpecialFunctions", "StaticArrays", "StatsBase", "StatsFuns", "ZygoteRules"]
git-tree-sha1 = "ab3a797864e7d138c03ac7485430f514e3c8245b"
uuid = "ced4e74d-a319-5a8a-b0ac-84af2272839c"
version = "0.6.32"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

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
git-tree-sha1 = "9aad812fb7c4c038da7cab5a069f502e6e3ae030"
uuid = "da5c29d0-fa7d-589e-88eb-ea29b0a81949"
version = "1.1.1"

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
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "LogExpFunctions", "NaNMath", "Preferences", "Printf", "Random", "SpecialFunctions", "StaticArrays"]
git-tree-sha1 = "6406b5112809c08b1baa5703ad274e1dded0652f"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.23"

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
git-tree-sha1 = "e4768c3b7f597d5a352afa09874d16e3c3f6ead2"
uuid = "d9f16b24-f501-4c13-a1f2-28368ffc5196"
version = "0.2.7"

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
git-tree-sha1 = "30f2b340c2fff8410d89bfcdc9c0a6dd661ac5f7"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.62.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "fd75fa3a2080109a2c0ec9864a6e14c60cca3866"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.62.0+0"

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

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[IfElse]]
git-tree-sha1 = "debdd00ffef04665ccbb3e150747a77560e8fad1"
uuid = "615f187c-cbe4-4ef1-ba3b-2fcf58d6d173"
version = "0.1.1"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InitialValues]]
git-tree-sha1 = "7f6a4508b4a6f46db5ccd9799a3fc71ef5cad6e6"
uuid = "22cec73e-a1b8-11e9-2c92-598750a2cf9c"
version = "0.2.11"

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

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

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
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a8f4f279b6fa3c3c4f1adadd78a621b13a506bce"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.9"

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
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "be9eef9f9d78cecb6f262f3c10da151a6c5ab827"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.5"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "dfeda1c1130990428720de0024d4516b1902ce98"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "0.4.7"

[[MCMCChains]]
deps = ["AbstractMCMC", "AxisArrays", "Compat", "Dates", "Distributions", "Formatting", "IteratorInterfaceExtensions", "KernelDensity", "LinearAlgebra", "MCMCDiagnosticTools", "MLJModelInterface", "NaturalSort", "OrderedCollections", "PrettyTables", "Random", "RecipesBase", "Serialization", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "TableTraits", "Tables"]
git-tree-sha1 = "04c3fd6da28ebd305120ffb05f0a3b8f9baced0a"
uuid = "c7f686f2-ff18-58e9-bc7b-31028e88f75d"
version = "5.0.1"

[[MCMCDiagnosticTools]]
deps = ["AbstractFFTs", "DataAPI", "Distributions", "LinearAlgebra", "MLJModelInterface", "Random", "SpecialFunctions", "Statistics", "StatsBase", "Tables"]
git-tree-sha1 = "f3f0c23f0ebe11db62ff1e81412919cf7739053d"
uuid = "be115224-59cd-429b-ad48-344e309966f0"
version = "0.1.1"

[[MKL_jll]]
deps = ["Artifacts", "IntelOpenMP_jll", "JLLWrappers", "LazyArtifacts", "Libdl", "Pkg"]
git-tree-sha1 = "5455aef09b40e5020e1520f551fa3135040d4ed0"
uuid = "856f044c-d86e-5d09-b602-aeab76dc8ba7"
version = "2021.1.1+2"

[[MLJModelInterface]]
deps = ["Random", "ScientificTypesBase", "StatisticalTraits"]
git-tree-sha1 = "0174e9d180b0cae1f8fe7976350ad52f0e70e0d8"
uuid = "e80e1ace-859a-464e-9ed9-23947d8ae3ea"
version = "1.3.3"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

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
git-tree-sha1 = "4f65bdbbe93475f6ff9ea6969b21532f88d359be"
uuid = "128add7d-3638-4c79-886c-908ea0c25c34"
version = "0.1.1"

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
git-tree-sha1 = "e9ee896802054f832a646f607d26ea9fa1181c90"
uuid = "872c559c-99b0-510c-b3b7-b6c96a88d5cd"
version = "0.7.30"

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

[[Observables]]
git-tree-sha1 = "fe29afdef3d0c4a8286128d4e45cc50621b1e43d"
uuid = "510215fc-4207-5dde-b226-833fc4488ee2"
version = "0.4.0"

[[OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "043017e0bdeff61cfbb7afeb558ab29536bbb5ed"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.10.8"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

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
git-tree-sha1 = "c8b8775b2f242c80ea85c83714c64ecfa3c53355"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.3"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

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
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun"]
git-tree-sha1 = "7dc03c2b145168f5854085a16d054429d612b637"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.23.5"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "e071adf21e165ea0d904b595544a8e514c8bb42c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.19"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "d940010be611ee9d67064fe559edbb305f8cc0eb"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.2.3"

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
git-tree-sha1 = "01d341f502250e81f6fec0afe662aa861392a3aa"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.2"

[[RealDot]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "9f0a1b71baaf7650f4fa8a1d168c7fb6ee41f0c9"
uuid = "c1ae055f-0cd5-4b69-90a6-9a35b1a98df9"
version = "0.1.0"

[[RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "7ad0dfa8d03b7bcf8c597f59f5292801730c55b8"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.4.1"

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

[[Roots]]
deps = ["CommonSolve", "Printf", "Setfield"]
git-tree-sha1 = "4c40dc61b51054bdb93536400420d73fdca6865e"
uuid = "f2b01f46-fcfa-551c-844a-d8ac1e96c665"
version = "1.3.7"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[ScientificTypesBase]]
git-tree-sha1 = "185e373beaf6b381c1e7151ce2c2a722351d6637"
uuid = "30f210dd-8aff-4c5f-94ba-8e64358c1161"
version = "2.3.0"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "f45b34656397a1f6e729901dc9ef679610bd12b5"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.8"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "Requires"]
git-tree-sha1 = "def0718ddbabeb5476e51e5a43609bee889f285d"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "0.8.0"

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
git-tree-sha1 = "f0bccf98e16759818ffc5d97ac3ebf87eb950150"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.8.1"

[[SplittablesBase]]
deps = ["Setfield", "Test"]
git-tree-sha1 = "39c9f91521de844bad65049efd4f9223e7ed43f9"
uuid = "171d559e-b47b-412a-8079-5efa626c420e"
version = "0.1.14"

[[Static]]
deps = ["IfElse"]
git-tree-sha1 = "e7bc80dc93f50857a5d1e3c8121495852f407e6a"
uuid = "aedffcd0-7271-4cad-89d0-dc628f76c6d3"
version = "0.4.0"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3c76dde64d03699e074ac02eb2e8ba8254d428da"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.13"

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
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "eb35dcc66558b2dda84079b9a1be17557d32091a"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.12"

[[StatsFuns]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "95072ef1a22b057b1e80f73c2a89ad238ae4cfff"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.12"

[[StatsPlots]]
deps = ["Clustering", "DataStructures", "DataValues", "Distributions", "Interpolations", "KernelDensity", "LinearAlgebra", "MultivariateStats", "Observables", "Plots", "RecipesBase", "RecipesPipeline", "Reexport", "StatsBase", "TableOperations", "Tables", "Widgets"]
git-tree-sha1 = "eb007bb78d8a46ab98cd14188e3cec139a4476cf"
uuid = "f3b207a7-027a-5e70-b257-86293d7955fd"
version = "0.14.28"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "2ce41e0d042c60ecd131e9fb7154a3bfadbf50d3"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.3"

[[SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableOperations]]
deps = ["SentinelArrays", "Tables", "Test"]
git-tree-sha1 = "e383c87cf2a1dc41fa30c093b2a19877c83e1bc1"
uuid = "ab02a1b2-a7df-11e8-156e-fb1833f50b87"
version = "1.2.0"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "fed34d0e71b91734bf0a7e10eb1bb05296ddbcd0"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.6.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[TerminalLoggers]]
deps = ["LeftChildRightSiblingTrees", "Logging", "Markdown", "Printf", "ProgressLogging", "UUIDs"]
git-tree-sha1 = "62846a48a6cd70e63aa29944b8c4ef704360d72f"
uuid = "5d786b92-1e48-4d6f-9151-6b4477ca9bed"
version = "0.1.5"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[Tracker]]
deps = ["Adapt", "DiffRules", "ForwardDiff", "LinearAlgebra", "MacroTools", "NNlib", "NaNMath", "Printf", "Random", "Requires", "SpecialFunctions", "Statistics"]
git-tree-sha1 = "bf4adf36062afc921f251af4db58f06235504eff"
uuid = "9f7883ad-71c0-57eb-9f7f-b5c9e6d3789c"
version = "0.2.16"

[[Transducers]]
deps = ["Adapt", "ArgCheck", "BangBang", "Baselet", "CompositionsBase", "DefineSingletons", "Distributed", "InitialValues", "Logging", "Markdown", "MicroCollections", "Requires", "Setfield", "SplittablesBase", "Tables"]
git-tree-sha1 = "bccb153150744d476a6a8d4facf5299325d5a442"
uuid = "28d57a85-8fef-5791-bfe6-a80928e7c999"
version = "0.4.67"

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

[[UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

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
git-tree-sha1 = "de67fa59e33ad156a590055375a30b23c40299d3"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.5"

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
git-tree-sha1 = "8c1a8e4dfacb1fd631745552c8db35d0deb09ea0"
uuid = "700de1a5-db45-46bc-99cf-38207098b444"
version = "0.2.2"

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
# ╟─1ea52bbe-1fc5-11ec-2690-e3c516d40f3f
# ╟─72357737-85b1-4f4b-8b60-2ae897174dbe
# ╟─2329f08d-83e7-476b-84be-8a7a9f064f64
# ╟─ea3964fb-944b-4a24-919e-0b82d179dc39
# ╟─db04f72b-b407-427f-a123-b2bb548fc976
# ╟─db011268-7925-4bbb-9465-c49c73673aeb
# ╟─fb37739f-a4b4-4a96-8bc4-2b2e87122082
# ╟─529d8de1-15a3-42b1-8a2e-64d8ab12f9de
# ╟─d21b799d-3e12-4a37-8aa2-e8c94d892560
# ╟─0e46fbcc-8b28-45d3-aa59-4012829f913c
# ╟─7a9e8a47-a57a-4f3a-b24c-7610083783ee
# ╟─4063fbe7-5c11-4c87-8103-0458182d6754
# ╟─7a4a7026-672e-409e-bfc9-7f586107dacb
# ╟─2fe135ef-9db9-4f19-983e-70e4f1d39fe1
# ╟─73ce97cf-caee-4ca4-9279-2de0d545735a
# ╟─0517da82-7be0-4545-a6eb-ffda7a766edf
# ╟─9a617928-4149-48e8-9cce-3a5b7636c2c0
# ╟─c15fc0c8-1870-457b-93d6-8cb26dd8280f
# ╟─f8ebbb8a-0cc7-48f3-bfd9-00e43e50eace
# ╟─6aafa8d2-c2fd-41ce-bca4-bc38a409dc18
# ╟─d3a95372-a81b-40d4-b61d-c1aa8e6c3615
# ╟─91e3ef8a-62a5-4078-9ed0-6c08200d76fd
# ╟─d9ab5757-bc8e-4a4b-8606-f842f193fb7f
# ╟─9bf69e03-782b-4c93-9418-19863098b2db
# ╟─17493b50-b467-483d-985e-ea084f745015
# ╟─1731e525-9cc9-4890-a87f-89fce196ed97
# ╟─5002115c-6c82-41e5-bee9-7fef966b1344
# ╟─435a6056-08f4-4f55-a728-93b4fbce4af6
# ╟─ef63c180-434d-4902-a2db-35a199900b5b
# ╟─268781ef-b31a-4cbe-b08b-53413ff85c47
# ╟─f15c8b04-6cfa-40b0-8a00-3b915958f380
# ╟─f4abf725-09f6-47e8-8a39-3acd43e932de
# ╟─cdeb09cd-6039-4448-9358-43068de2634c
# ╟─2292925c-c6c3-46f2-a86b-de9538e57d01
# ╟─695bae8c-39ed-4cf2-8ed2-7967f4fb7007
# ╟─e6284c66-1a34-449e-9d42-123370061e42
# ╟─98993bb7-61dd-4a27-992f-9e607c5a5df3
# ╟─94467a32-c548-4ea0-9c8e-501102f0355d
# ╟─ea8d0431-043a-4483-8364-653746e3d564
# ╟─8cfaecdd-4e39-4d0a-9be2-73fae96a084c
# ╟─4a36cdbf-811e-4a83-8a92-4ac7a8dcab14
# ╟─b13a773a-0fef-490c-9494-0e75262a80ee
# ╟─752fcbc0-e44b-48b4-9ece-f2126ee79b9a
# ╟─52bc7447-b69c-4d12-8a17-f8b98b2c8b15
# ╟─5ce14bd9-8391-44db-9ecd-ceb7e3c828dc
# ╟─36b97dc3-3cfc-4239-b136-0d238bfeb3b8
# ╟─f53a78db-0c42-4bbb-b1fb-fe768321bf64
# ╟─8bceddb0-6147-43e2-91a8-934a5d1492d6
# ╟─675337e5-7dc7-48f0-9900-fb6609a9c9d7
# ╟─3b628ee3-d110-40ed-8f45-97116f7513eb
# ╟─4dd05620-fa46-4e14-802b-d10b21d8ecb1
# ╟─0ad38222-24a6-4f2b-a820-5bcc31074c2b
# ╟─31408da2-6d14-44c4-bc5a-9a77be157ecf
# ╟─0d0b7766-ca32-485c-8956-d4abd8239aba
# ╟─3d489aa8-452f-40bb-bbb1-e482a9f4ee8c
# ╟─a7eb853e-45fa-4f2b-afd8-a2896f96ddd7
# ╟─335c0f02-0a73-4630-9b04-9a43b658139e
# ╟─20531fff-f8d0-4ad4-9e12-1c111284dbce
# ╟─b9d27850-c997-49bc-a5fa-65ff54237d0a
# ╟─c230dded-a8f8-4ad5-ae2c-a20467a39828
# ╟─e0c35d9a-be8d-4c55-afcf-e9edde843590
# ╟─e6774011-87fa-401a-bbda-f5d044060629
# ╟─f638f2f9-163d-4842-ad3d-e8a9a7f2ad0b
# ╟─0a8af707-4591-4d44-b581-4e3644c871a2
# ╟─160d1f38-c49d-45c1-b52f-482ae192aa3b
# ╟─b52960fc-57df-42dd-9fbb-cb7be79ac097
# ╟─8676ab72-bcd5-4029-a9dd-2e934ec135bf
# ╟─23ce4697-6c69-4154-b14c-1e67cd505da6
# ╟─7f3b9e4c-9e98-45f6-9c72-0a525681e9fa
# ╟─b2189b68-99a5-4db7-be7e-2cfda141bfc6
# ╟─b219ff12-6f27-4ebe-b768-d8b0907c6ebd
# ╟─8cef0be2-a5d2-4dde-862f-2d783b6c490d
# ╟─5010d796-70dc-47e0-a1b7-34b1407a8963
# ╟─eb15ebe7-4ea6-4438-9dbf-5c1d058e9180
# ╟─d547c318-6d22-4e0a-9668-933b9acc5504
# ╟─ef8f79d8-418b-48f1-8e0d-b81134791639
# ╟─c7b3e9bd-4997-4b83-83e5-2c5720c962be
# ╟─06189272-5088-48d0-bca2-e8ba2d533f70
# ╟─0ba0b1a1-279f-4c55-bab4-2ae9c00332e9
# ╟─d6398914-ed02-47a5-901e-2d0d48cdf1a8
# ╟─691b5234-af59-4a5f-8bfd-35a4c8bdcc74
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
