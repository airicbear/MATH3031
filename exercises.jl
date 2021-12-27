### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 3fafaca6-0516-11ec-123d-1f912a822711
begin
	using PlutoUI
	using Plots
	using Distributions
	using Combinatorics
	using QuadGK
	using LinearAlgebra
	
	function Image(filepath::String)
		@assert !isempty(filepath)
		PlutoUI.LocalResource(joinpath(split(@__FILE__, '#')[1] * ".assets", filepath))
	end

	b(n,p,j) = binomial(n,j) * p^j * (1-p)^(n-j)
	pZ(k, pX::Function, pY::Function, Ω) = sum([pX(i) * pY(k - i) for i ∈ Ω])

	function Ωz(Z::Function, Ωx, Ωy)
		Zs = [Z(X, Y) for X ∈ Ωx for Y ∈ Ωy]
		min(Zs...):max(Zs...)
	end
	
	md"# Exercises: Discrete Probability Distributions"
end

# ╔═╡ f73c590c-661c-4181-a43f-e1a97cd9c90e
md"""
### Exercise 1.2 #1

Let $\Omega = \{a, b, c\}$ be a sample space.
Let $m(a) = 1/2$, $m(b) = 1/3$, and $m(c) = 1/6$.
Find the probabilities for all eight subsets of $\Omega$.
"""

# ╔═╡ c1ba23ad-9bdd-4cb0-964f-7b762107a1ad
md"""
The eight subsets of $\Omega$ are $\{\}$, $\{a\}$, $\{b\}$, $\{c\}$, $\{a,b\}$, $\{a,c\}$, $\{b,c\}$, $\{a,b,c\}$.

Their respective probabilities are then

1. ``P(\{\}) = 0``

2. ``P(\{a\}) = 1/2``

3. ``P(\{b\}) = 1/3``

4. ``P(\{c\}) = 1/6``

5. ``P(\{a,b\}) = 1/2 + 1/3 = 5/6``

6. ``P(\{a,c\}) = 1/2 + 1/6 = 2/3``

7. ``P(\{b,c\}) = 1/3 + 1/6 = 1/2``

8. ``P(\{a,b,c\}) = 1``
"""

# ╔═╡ 0201891e-9760-4c48-8be9-6515e637f796
md"""
### Exercise 1.2 #4

Describe in words the events specified by the following subsets of

$\Omega = \{\text{HHH}, \text{HHT}, \text{HTH}, \text{HTT}, \text{THH}, \text{THT}, \text{TTH}, \text{TTT}\}$

(see Example 1.6).

(a) $E = \{\text{HHH}, \text{HHT}, \text{HTH}, \text{HTT}\}$.

(b) $E = \{\text{HHH}, \text{TTT}\}$.

(c) $E = \{\text{HHT}, \text{HTH}, \text{THH}\}$.

(d) $E = \{\text{HHT}, \text{HTH}, \text{HTT}, \text{THH}, \text{THT}, \text{TTH}, \text{TTT}\}$.
"""

# ╔═╡ b1baad94-cdc3-4076-bd5f-15fd36a54747
md"""
*Descriptions:*

(a) First flip lands on heads

(b) All flips land on the same side

(c) Only one flip lands on tails

(d) At least one flip lands on tails
"""

# ╔═╡ 9a78bed1-57b8-45d3-ab7a-993e8bdd5c64
md"""
### Exercise 1.2 #5

What are the probabilities of the events described in Exercise 4?
"""

# ╔═╡ 930312f3-ea49-4496-851c-ca7a6ecd84a5
md"""
(a) $P(E) = 4/8 = 1/2$

(b) $P(E) = 2/8 = 1/4$

(c) $P(E) = 3/8$

(d) $P(E) = 7/8$
"""

# ╔═╡ 6fd11312-a630-477e-821f-99891a9f4fa1
md"""
### Exercise 1.2 #6

A die is loaded in such a way that the probability of each face turning up is proportional to the number of dots on that face.
(For example, a six is three times as probable as a two.)
What is the probability of getting an even number in one throw?
"""

# ╔═╡ f6617221-031a-41f4-a029-48ce0e208076
md"""
Let $m(1) = a$, $m(2) = 2a, \ldots, m(6) = 6a$.

$\begin{align*}
(1 + 2 + 3 + 4 + 5 + 6)a &= 1 \\
21a &= 1 \\
a &= \frac{1}{21} 
\end{align*}$
"""

# ╔═╡ 0371ddaf-3cdb-444c-8791-c4a2410075a7
md"""
$\begin{align*}
m(1) &= 1 \cdot \frac{1}{21} \\
m(2) &= 2 \cdot \frac{1}{21} \\
m(3) &= 3 \cdot \frac{1}{21} \\
m(4) &= 4 \cdot \frac{1}{21} \\
m(5) &= 5 \cdot \frac{1}{21} \\
m(6) &= 6 \cdot \frac{1}{21}
\end{align*}$

$m(2) + m(4) + m(6) = \frac{2}{21} + \frac{4}{21} + \frac{6}{21} = \frac{12}{21} = \frac{4}{7}$
"""

# ╔═╡ 92b5313c-09c2-43d6-8ead-0fa22d580f13
md"""
### Exercise 1.2 #7

Let $A$ and $B$ be events such that $P(A \cap B) = 1/4$, $P(\bar{A}) = 1/3$, and $P(B) = 1/2$.
What is $P(A \cup B)$?
"""

# ╔═╡ f791d57b-bf9d-4cfb-b1fc-ade11bfdcd65
md"""
$\begin{align*}
P(A) &= 1 - P(\bar{A}) = 2/3 \\
P(A \cup B) &= P(A) + P(B) - P(A \cap B) \\
&= 2/3 + 1/2 - 1/4 \\
&= 11/12
\end{align*}$
"""

# ╔═╡ 558abcba-b4e5-41ef-96a5-c950810e35a4
md"""
### Exercise 1.2 #19

If $A$, $B$, and $C$ are any three events, show that

$\begin{align*}
P(A \cup B \cup C) &= P(A) + P(B) + P(C) - P(A \cap B) - P(B \cap C) - P(C \cap A) + P(A \cap B \cap C).
\end{align*}$
"""

# ╔═╡ 6d6abda1-b343-4a28-977e-86c79a3e7f8c
md"""
Visualize a Venn Diagram where the three events are overlapping.
Add A + B + C and find that A is intersected twice by B and C, so subtract those intersections.
The remaining intersection of interest is the one between B and C, so subtract that as well.
We need to add the intersection between all events since it was lost in the previous subtractions.
"""

# ╔═╡ e93f4c8c-7079-4ded-b5e2-57182a983d8e
md"""
### Exercise 1.2 #26

Two cards are drawn successively from a deck of 52 cards.
Find the probability that the second card is higher in rank than the first card.
*Hint:* Show that $1 = P(\text{higher}) + P(\text{lower}) + P(\text{same})$ and use the fact that $P(\text{higher}) = P(\text{lower})$.
"""

# ╔═╡ dc0e1c09-7332-4340-94e7-31fc6fa63dfc
md"""
$\begin{align*}
P(\text{same}) &= \frac{3}{51} \\
1 &= 2P(\text{higher}) + P(\text{same}) \\
P(\text{higher}) &= \frac{1 - P(\text{same})}{2} \\
&= \frac{1 - \frac{3}{51}}{2} \\
&= \frac{1}{2} - \frac{3}{102} \\
&= \frac{8}{17}
\end{align*}$
"""

# ╔═╡ d1067117-ae7f-40c4-b704-da4994777f2d
md"""
### Exercise 2.2 #1

Suppose you choose *at random* a real number $X$ from the interval $[2,10]$.

(a) Find the density function $f(x)$ and the probability of an event $E$ for this experiment, where $E$ is a subinterval $[a,b]$ of $[2,10]$.

(b) From (a), find the probability that $X > 5$, that $5 < X < 7$, and that $X^2 - 12X + 35 > 0$.
"""

# ╔═╡ 0e22ecb7-016d-497b-9858-593ba1a6f632
md"""
*Answers*

**(a)**

$f(x) = \begin{cases}
\frac{1}{8}, &\text{if } 2 \leq x \leq 10, \\
0, &\text{otherwise}
\end{cases}$

**(b)**

$\begin{align*}
P(X > 5) &= \int_5^{10} \frac{1}{8} \;dx = \frac{10}{8} - \frac{5}{8} = \frac{5}{8} \\
P(5 < X < 7) &= \int_5^7 \frac{1}{8} \;dx = \frac{7}{8} - \frac{5}{8} = \frac{1}{4} \\
P(X^2 - 12X + 35 > 0) &= P(X > 7) + P(X < 5) \\
&= \int_7^{10} \frac{1}{8} \;dx + \int_2^5 \frac{1}{8} \;dx \\
&= \left(\frac{10}{8} - \frac{7}{8}\right) + \left(\frac{5}{8} - \frac{2}{8}\right) \\
&= \frac{3}{8} + \frac{3}{8} \\
&= \frac{3}{4}
\end{align*}$
"""

# ╔═╡ b36df924-fc07-4971-a771-0459e7cdcbf6
let
	P(a,b) = (b-a)/8
	rationalize.((P(5,10), P(5,7), P(7,10)))
end

# ╔═╡ eb7bafe5-4411-4dae-8de2-db3051061c41
md"""
### Exercise 2.2 #2

Suppose you choose a real number $X$ from the interval $[2,10]$ with a density function of the form

$f(x) = Cx,$

where $C$ is a constant.

(a) Find $C$.

(b) Find $P(E)$, where $E = [a,b]$ is a subinterval of $[2,10]$.

(c) Find $P(X > 5)$, $P(X < 7)$, and $P(X^2 - 12X + 35 > 0)$.
"""

# ╔═╡ 85e38c7a-56be-4fca-836a-5b2dc37bcb89
md"""
*Answers*

**(a)**

$\begin{align*}
P(2 \leq X \leq 10) &= \int_2^{10} f(x) \;dx \\
1 &= \int_2^{10} Cx \;dx \\
1 &= C \int_2^{10} x \;dx \\
1 &= C \left[\frac{1}{2} x^2\right]_2^{10} \\
1 &= C \left[\frac{1}{2} (10)^2 - \frac{1}{2} (2)^2\right] \\
1 &= C \left[\frac{100}{2} - \frac{4}{2}\right] \\
1 &= C \left[50 - 2\right] \\
1 &= 48C \\
C &= \frac{1}{48}
\end{align*}$
"""

# ╔═╡ 8477f9f4-fba9-4d62-8c11-222a9be83add
md"""
**(b)**

$\begin{align*}
P(E) &= \int_a^b f(x) \;dx \\
&= \int_a^b Cx \;dx \\
&= C \int_a^b x \;dx \\
&= C \left[\frac{1}{2} x^2\right]_a^b \\
&= C \left[\frac{1}{2} b^2 - \frac{1}{2} a^2\right] \\
&= \frac{1}{2} C \left(b^2 - a^2\right)
\end{align*}$
"""

# ╔═╡ dcc865f9-55ad-4940-b783-693e2d50396d
# Verify (b) by using inputs from (a)

let
	C = 1/48
	(a, b) = (2, 10)
	(1/2) * C * (b^2 - a^2)
end

# ╔═╡ 59db96e6-bccd-41aa-b26b-25ba26e30c4a
let
	C = 1//48
	P(a,b) = (1//2) * C * (b^2 - a^2)
	
	# For (c)
	P(5,10), P(2,7), P(2,5) + P(7,10)
end

# ╔═╡ 938acc94-2625-45a3-9afd-b322123069a6
md"""
**(c)**

Plug-in bounds $a$ and $b$ into general form found in part (b).

$\begin{align*}
P(X > 5) &= \frac{25}{32} \\

P(X < 7) &= \frac{25}{32}
\end{align*}$

$\begin{align*}
P(X^2 - 12X + 35 > 0) &= P((X - 7)(X - 5) > 0) \\
&= P(X > 7) + P(X < 5) \\
&= \frac{3}{4}
\end{align*}$
"""

# ╔═╡ 4b4b1147-3f18-42bf-a7a6-275a45002730
md"""
### Exercise 2.2 #3

Same as Exercise 2, but suppose

$f(x) = \frac{C}{x}.$
"""

# ╔═╡ d10f07f4-fb06-4f87-9311-ab1efb4e1965
md"""
*Answers*

**(a)**

$\begin{align*}
P(2 \leq x \leq 10) &= \int_2^{10} f(x) \;dx \\
1 &= \int_2^{10} \frac{C}{x} \;dx \\
1 &= C \int_2^{10} \frac{1}{x} \;dx \\
1 &= C \left[\log{x}\right]_2^{10} \\
1 &= C \left[\log{10} - \log{2}\right] \\
1 &= C (\log{5}) \\
C &= \frac{1}{\log{5}}
\end{align*}$
"""

# ╔═╡ c399bc3e-65ec-4426-8c4e-4c5d1350158e
md"""
**(b)**

$\begin{align*}
P(E) &= \int_a^b f(x) \;dx \\
&= \int_a^b \frac{C}{x} \;dx \\
&= C \int_a^b \frac{1}{x} \;dx \\
&= C \left[\log{x}\right]_a^b \\
&= C \left(\log{b} - \log{a}\right) \\
&= C \log{\frac{b}{a}}
\end{align*}$
"""

# ╔═╡ 44dcc1d0-4b26-493a-ba0a-2a5f9e767d53
let
	C = 1/log10(5)
	P(a,b) = C * log10(b/a)
	
	P(2,10)
end

# ╔═╡ 4d6c2930-641d-449b-83f7-56a0b31cd92e
let
	C = 1/log10(5)
	P(a,b) = C * log10(b/a)
		
	P(5,10), P(2,7)
end

# ╔═╡ 78fa60f3-643d-4360-92b0-6d385540d060
md"""
**(c)**

$\begin{align*}
P(X > 5) &= \frac{1}{\log{5}} \log{\frac{10}{5}} \\
&= \frac{\log{2}}{\log{5}}
\end{align*}$

$\begin{align*}
P(X < 7) &= \frac{1}{\log{5}} \log{\frac{7}{2}} \\
&= \frac{\log{\frac{7}{2}}}{\log{5}}
\end{align*}$

$\begin{align*}
P(X^2 - 12X + 35 > 0) &= P(X < 5) + P(X > 7) \\
&= \frac{1}{\log{5}} \log{\frac{5}{2}} + \frac{1}{\log{5}} \log{\frac{10}{7}} \\
\end{align*}$
"""

# ╔═╡ 1cc0a22e-a8c6-4bb4-94ed-cb2426047af1
md"""
### Exercise 2.2 #7

Choose a number $B$ *at random* from the interval $[0,1]$ with uniform density.
Find the probability that

(a) $1/3 < B < 2/3$.

(b) $|B - 1/2| \leq 1/4$.

(c) $B < 1/4$ or $1 - B < 1/4$.

(d) $3B^2 < B$.
"""

# ╔═╡ 9359260b-fe39-40f3-b61a-698c2cf6658d
md"""
*Answers*

**(a)** $P(1/3 < B < 2/3) = 1/3$

**(b)** $P(|B - 1/2| \leq 1/4)$

$\begin{align*}
B - 1/2 &= 1/4 \\
B &= \frac{3}{4}
\end{align*}$

$\begin{align*}
-(B - 1/2) &= 1/4 \\
-B + 1/2 &= 1/4 \\
B &= \frac{1}{4}
\end{align*}$

$\begin{align*}
\frac{3}{4} - \frac{1}{4} = \frac{1}{2}
\end{align*}$

**(c)**

$\begin{align*}
P(B < 1/4) + P(1 - B < 1/4) &= 1/4 + P(3/4 < B) = 1/4 + 1/4 = 1/2
\end{align*}$

**(d)**

$\begin{align*}
P(3B^2 < B) &= P(3B < 1) = P\left(B < \frac{1}{3}\right) = 1/3
\end{align*}$
"""

# ╔═╡ 347e2f44-aa02-4634-a3f5-55691dbf1fc3
md"""
### Exercise 2.2 #14

Choose independently two numbers $B$ and $C$ *at random* from the interval $[-1,1]$ with uniform distribution, and consider the quadratic equation

$x^2 + Bx + C = 0.$

Find the probability that the roots of this equation

(a) are both real.

(b) are both positive.

*Hints:* (a) requires $0 \leq B^2 - 4C$, (b) requires $0 \leq B^2 - 4C$, $B \leq 0$, $0 \leq C$.
"""

# ╔═╡ cdc7b379-234c-4656-8600-70ab52cd3bdf
md"""
**(a)**

$\begin{align*}
P(0 \leq B^2 - 4C) &= P\left(C \leq \frac{B^2}{4}\right) \\
&= \int_{-1}^1 \frac{B^2}{4} \;dB \\
&= \left[\frac{B^3}{12}\right]_{-1}^1 \\
&= \left[\frac{1}{12} + \frac{1}{12}\right] \\
&= \frac{1}{6}
\end{align*}$

$\frac{1}{6} + \int_{-1}^1 \;dx$

$\frac{1}{6} + 2 = \frac{13}{6}$

$\frac{\frac{13}{6}}{4} = \frac{13}{24}$
"""

# ╔═╡ bcbacde8-2d2c-44d4-8fa9-06c4b219a4db
md"""
**(b)**

$P(0 \leq B^2 - 4C), \quad B \leq 0, \;0 \leq C$

$\begin{align*}
P\left(C \leq \frac{B^2}{4}\right) &= \int_{-1}^0 \frac{B^2}{4} \;dB \\
&= \left[\frac{B^3}{12}\right]_{-1}^0 \\
&= \left[0 + \frac{1}{12}\right] \\
&= \frac{1}{12}
\end{align*}$

$\frac{\frac{1}{12}}{4} = \frac{1}{48}$
"""

# ╔═╡ cb2f95d3-7365-4cfd-9c03-f9eccca09be1
md"""
### Exercise 3.1 #1

Four people are to be arranged in a row to have their picture taken.
In how many ways can this be done?
"""

# ╔═╡ bb496991-e0d9-491c-9cf4-eabaaa569c52
md"""
$4! = 4 ⋅ 3 ⋅ 2 ⋅ 1 = 24$
"""

# ╔═╡ 3576de1f-0585-49bb-8565-3fb9cca33cae
md"""
### Exercise 3.1 #2

An automobile manufacturer has four colors available for automobile exteriors and three for interiors.
How many different color combinations can he produce?
"""

# ╔═╡ b26d80da-18a9-4525-8339-63672cfa2fb7
4 * 3

# ╔═╡ 7393170d-050a-48e4-8171-b73e116848de
md"""
### Exercise 3.1 #3

In a digital computer, a *bit* is one of the integers $\{0,1\}$, and a *word* is any string of 32 bits.
How many different words are possible?
"""

# ╔═╡ 88deb21b-7456-4bad-8780-f4b3ce47586f
2^32

# ╔═╡ cddcbdec-06f1-483d-8752-21849f0189c8
md"""
### Exercise 3.1 #5

There are three different routes connecting city A to city B.
How many ways can a round trip be made from A to B and back?
How many ways if it is desired to take a different route on the way back?
"""

# ╔═╡ 4bd7061a-569c-48a9-8467-105e96497ee8
3 * 3

# ╔═╡ 1303fc83-0e13-462a-a679-001db32b95b4
3 * 2

# ╔═╡ 017769f2-fcda-49c2-8dde-0232c12f4429
md"""
### Exercise 3.1 #6

In arranging people around a circular table, we take into account their seats relative to each other, not the actual position of any one person.
Show that $n$ people can be arranged around a circular table in $(n - 1)!$ ways.
"""

# ╔═╡ ee07321e-c800-4ec7-a62e-a9ac472e25e5
md"""
Suppose we have $n$ people to arrange around a circular table.
If we arrange the first person then we have $n - 1$ people left to arrange.
Continuing this process we get

$n ⋅ (n - 1) ⋅ … ⋅ (n - n)!$

However, since the arrangement of the first person does not matter, we discount their arrangment in each step, dividing the expression by $n$

$\frac{n ⋅ (n - 1) ⋅ … ⋅ (n - n)!}{n} = (n - 1)!$
"""

# ╔═╡ bfcc3015-5d41-4e0b-951f-1258a10fc1ee
md"""
### Exercise 3.1 #8

A finite set $Ω$ has $n$ elements.
Show that if we count the empty set and $Ω$ as subsets, there are $2^n$ subsets of $Ω$.
"""

# ╔═╡ 758e61fb-0145-4aa1-a895-f8d7770123c9
md"""
Consider the base case $n = 0$ where $Ω = \phi$.
There is $2^0 = 1$ subset of $Ω$, $\phi$.

Assume that for $n = k$, $Ω_0 = \{\omega_1, \omega_2, …, \omega_k\}$ then there are $2^k$ subsets of $Ω$.

We want to show that for $n = k + 1$, $Ω_1 = \{\omega_1, \omega_2, …, \omega_k, \omega_{k + 1}\}$ there are $2^{k+1}$ subsets of $Ω$.

Suppose $Ω_1$ is a set with $k + 1$ many elements.

We can write $Ω_1 = Ω_0 \cup \{\omega_{k+1}\}$ where $Ω_0$ is a set with $k$ many elements and $\omega_{k+1} ∉ \Omega_1$.

There are $2^k$ many subsets $S ∈ Ω_0$ and each subset $S$ gives two subsets to $Ω_1$, namely $S \cup \{\omega_{k + 1}\}$ and $S$ itself.

So the number of subsets in $Ω_1$ is $2^k ⋅ 2 = 2^{k+1}$. ∎
"""

# ╔═╡ dedbb77c-befa-4ea9-9e95-c6169730be4f
md"""
*Easier answer*

Two options of any element: its either in the set or it isnt.
"""

# ╔═╡ a63dd911-1f3e-4d3a-80da-4f33b46e8916
md"""
### Exercise 3.1 #13

A certain state has license plates showing three numbers and three letters.
How many different license plates are possible

(a) if the numbers must come before the letters?

(b) if there are no restriction on where the letters and numbers appear?
"""

# ╔═╡ 4165c37c-a95f-4967-990e-a611999440cd
md"""
(a) $10^3 ⋅ 26^3$

(b) $10^3 ⋅ 26^3 ⋅ \begin{pmatrix} 6 \\ 3 \end{pmatrix}$
"""

# ╔═╡ 88190655-8c84-493c-9bfd-842d7ffae8bb
md"""
If the letters I and O weren't allowed, then simply subtract 2 from the 26 quantity in the expressions.
"""

# ╔═╡ b1484369-53d7-44de-b8d8-dab14ecc1cfb
md"""
### Exercise 3.2 #1

Compute the following:

(a) $\begin{pmatrix} 6 \\ 3 \end{pmatrix}$

(b) $b(5,.2,4)$

(c) $\begin{pmatrix} 7 \\ 2 \end{pmatrix}$

(d) $\begin{pmatrix} 26 \\ 26 \end{pmatrix}$

(e) $b(4, .2, 3)$

(f) $\begin{pmatrix} 6 \\ 2 \end{pmatrix}$

(g) $\begin{pmatrix} 10 \\ 9 \end{pmatrix}$

(h) $b(8, .3, 5)$
"""

# ╔═╡ f61d9c95-52e8-4a18-a6c2-dd7f71f9f6e5
md"""
*Answers*

(a) $\begin{pmatrix} 6 \\ 3 \end{pmatrix} = \frac{6!}{3! 3!} = 20$

(b) $b(5, .2, 4) = \begin{pmatrix} 5 \\ 4 \end{pmatrix} \left(\frac{1}{5}\right)^4 \left(\frac{4}{5}\right) = \frac{5!}{1! 4!} ⋅ \frac{1}{625} ⋅ \frac{4}{5} = \frac{4}{625} = 0.0064$

(c) $\begin{pmatrix} 7 \\ 2 \end{pmatrix} = \frac{7!}{5! 2!} = 21$

(d) $\begin{pmatrix} 26 \\ 26 \end{pmatrix} = \frac{26!}{26!} = 1$

(e) $b(4, .2, 3) = \begin{pmatrix} 4 \\ 3 \end{pmatrix} \left(\frac{1}{5}\right)^3 (0.8) = \frac{4!}{1! 3!} ⋅ \frac{1}{125} ⋅ \frac{4}{5} = \frac{16}{625} = 0.0256$

(f) $\begin{pmatrix} 6 \\ 2 \end{pmatrix} = \frac{6!}{4! 2!} = 15$

(g) $\begin{pmatrix} 10 \\ 9 \end{pmatrix} = \frac{10!}{1! 9!} = 10$

(h) $b(8, .3, 5) = \begin{pmatrix} 8 \\ 5 \end{pmatrix} \left(\frac{3}{10}\right)^5 \left(\frac{7}{10}\right)^3 = 0.0466754$
"""

# ╔═╡ 3cbbe80b-6b88-45b9-931c-02b35ab13fff
[
	:a => binomial(6, 3)
	:b => binomial(5, 4) * 0.2^4 * 0.8
	:c => binomial(7, 2)
	:d => binomial(26, 26)
	:e => binomial(4, 3) * 0.2^3 * 0.8
	:f => binomial(6, 2)
	:g => binomial(10, 9)
	:h => binomial(8, 5) * (3/10)^5 * (7/10)^3
]

# ╔═╡ db03912b-db3b-43a3-ab5a-bb37708869d8
md"""
### Exercise 3.2 #2

In how many ways can we choose five people from a group of ten to form a committee?
"""

# ╔═╡ 53afb60d-486b-4095-b4b2-619ad2098c39
md"""
$\begin{pmatrix} 10 \\ 5 \end{pmatrix} = \frac{10!}{5! 5!} = \frac{10 ⋅ 9 ⋅ 8 ⋅ 7 ⋅ 6}{5 ⋅ 4 ⋅ 3 ⋅ 2} = 2 ⋅ 9 ⋅ 7 ⋅ 2 = 252$
"""

# ╔═╡ ff796362-71ff-488d-90b0-ed12b0c8b722
md"""
### Exercise 3.2 #3

How many seven-element subsets are there in a set of nine elements?
"""

# ╔═╡ b7ab1b9e-5d69-4cc7-9e7b-08d91f7ad458
md"""
$\begin{pmatrix} 9 \\ 7 \end{pmatrix} = \frac{9!}{2! 7!} = 9 ⋅ 4 = 36$
"""

# ╔═╡ 66d81005-2e93-42d5-a3a8-e8a8ec045ba2
md"""
### Exercise 3.2 #6

Charles claims that he can distinguish between beer and ale 75 percent of the time.
Ruth bets that he cannot and, in fact, just guesses.
To settle this, a bet is made: Charles is to be given ten small glasses, each having been filled with beer or ale, chosen by tossing a fair coin.
He wins the bet if he gets seven or more correct.
Find the probability that Charles wins if he has the ability that he claims.
Find the probability that Ruth wins if Charles is guessing.
"""

# ╔═╡ b2aea670-cb00-4461-8a45-88ea609c38ea
md"""
$\sum_{j=7}^{10} b(10, 0.75, j) = 0.7758750915527344 ≈ 77.6\%$
"""

# ╔═╡ 960a5e1c-2ffe-4779-b497-f2f7952855e3
let
	n = 10
	p = 0.75
	j = 7
	
	sum([b(n,p,j) for j ∈ j:n])
end

# ╔═╡ 76f410a6-e3f1-4146-a08e-bfbca36670ef
md"""
$\sum_{j=4}^{10} b(10, 0.5, j) = 0.828125 ≈ 82.8\%$
"""

# ╔═╡ ecef6888-02bf-477e-b96d-73af573ffd9a
let
	n = 10
	p = 0.5
	j = 4
	
	sum([b(n,p,j) for j ∈ j:n])
end

# ╔═╡ 7bdc52d1-760b-4f9f-95ab-a938ef075315
md"""
### Exercise 3.2 #7

Show that

$b(n, p, j) = \frac{p}{q} \left(\frac{n - j + 1}{j}\right) b(n, p, j - 1),$

for $j ≥ 1$.
Use this fact to determine the value or values of $j$ which give $b(n, p, j)$ its greatest value.
*Hint*: Consider the successive ratios as $j$ increases.
"""

# ╔═╡ bcde84fd-599c-407f-8669-402c3b435aee
md"""
We know that

$b(n,p,j) = \begin{pmatrix} n \\ j \end{pmatrix} p^j q^{n - j} = \frac{n!}{(n - j)! \; j!} p^j q^{n - j}$

So,

$\begin{align*}
b(n,p,j - 1) &= \begin{pmatrix} n \\ j - 1 \end{pmatrix} p^{j - 1} q^{n - j + 1} = \frac{n!}{(n - j + 1)! (j - 1)!} p^{j - 1} q^{n - j - 1}
\end{align*}$

Assume that there is some variable expression $x$ whose product with $b(n,p,j - 1)$ is equal to $b(n,p,j)$,

$b(n,p,j) = x ⋅ b(n,p,j-1) \implies x = \frac{b(n, p, j)}{b(n, p, j - 1)}$

Solving for $x$,

$\begin{align*}
x &= \frac{\frac{n!}{(n - j)! \; j!} p^j q^{n - j}}{\frac{n!}{(n - j + 1)! (j - 1)!} p^{j - 1} q^{n - j + 1}} \\
&= \frac{(n - j + 1)! (j - 1)!}{(n - j)! \; j!} \frac{p}{q} \\
&= \left(\frac{n - j + 1}{j}\right) \frac{p}{q}
\end{align*}$

Hence,

$b(n, p, j) = \frac{p}{q} \left(\frac{n - j + 1}{j}\right) b(n, p, j - 1)$
"""

# ╔═╡ c8f6990c-d566-4fa5-a0d8-3a1101fa6f54
md"""
The values of $j$ that gives $b(n,p,j)$ its greatest value are $j = p(n + 1)$ and $j = p(n + 1) - 1$.

*Explanation*

$x ≥ 1 \iff j ≤ p(n + 1)$

Since

$\begin{align*}
\frac{(n - j + 1)}{j} \frac{p}{q} &≥ 1 \\
pn - pj + p &≥ jq \\
pn + p &≥ jq + pj \\
p(n + 1) &≥ j(q + p) \\
j &≤ \frac{p(n + 1)}{q + p}
\end{align*}$

If $p(n + 1)$ is an integer then $j = p(n + 1) - 1$ will also maximize $b(n,p,j)$.
"""

# ╔═╡ 3fd268ce-7197-4ace-be30-decf189bb106
md"""
### Exercise 3.2 #8

A die is rolled 30 times.
What is the probability that a 6 turns up exactly 5 times?
What is the most probable number of times that a 6 will turn up?
"""

# ╔═╡ 1c0ef61e-09f1-4b55-835b-b097319f7abb
md"""
The success is if it turns up as 6, otherwise it is a failure.

$b(30, 1/6, 5) = \begin{pmatrix} 30 \\ 5 \end{pmatrix} \left(\frac{1}{6}\right)^5 \left(\frac{5}{6}\right)^{25} ≈ 19.2\%$
"""

# ╔═╡ c11136e2-d001-4cbb-9eac-85343dd9f912
md"""
The most probable number of times that a 6 will turn up is $\frac{1}{6} ⋅ 30 = 5$.
"""

# ╔═╡ 32b21e35-162c-44c4-aad1-9b9cc6acab82
binomial(30, 5) * (1/6)^5 * (5/6)^25

# ╔═╡ 53c3e940-028a-40d2-a528-9682543c64ad
1/6 * 30

# ╔═╡ baf134a0-6f2d-47a2-8f9a-f810b15fbd25
md"""
### Exercise 3.2 #10

In a ten-question true-false exam, find the probability that a student gets a grade of 70 percent or better by guessing.
Answer the same question if the test has 30 question, and if the test has 50 questions.
"""

# ╔═╡ 843b476c-7213-4a94-8f61-1d3906d0ae6d
md"""
10 question:

$b(10, 0.5, 7) = \begin{pmatrix} 10 \\ 7 \end{pmatrix} \left(\frac{1}{2}\right)^7 \left(\frac{1}{2}\right)^3 = \frac{10!}{3! 7!} \left(\frac{1}{128}\right) \left(\frac{1}{8}\right) = \frac{10 ⋅ 9 ⋅ 8}{3 ⋅ 2 ⋅ 128 ⋅ 8}$

$= \frac{15}{128} = \frac{15}{128} = 0.1171875 ≈ 11.7\%$
"""

# ╔═╡ 5ee8dfa2-b2df-46eb-b6de-3c7575ad3987
md"""
30 question:

$30 ⋅ 0.7 = 21$

$b(30, 0.5, 21) = \begin{pmatrix} 30 \\ 21 \end{pmatrix} \left(\frac{1}{2}\right)^{21} \left(\frac{1}{2}\right)^{9}$
"""

# ╔═╡ 58e5653d-f0b5-4e61-9f03-9e427a63e8e0
 md"""
### Exercise 3.2 #12

A poker hand is a set of 5 cards randomly chosen from a deck of 52 cards.
Find the probability of a

(a) royal flush (ten, jack, queen, king, ace in a single suit).

(b) straight flush (five in a sequence in a single suit, but not a royal flush).

(c) four of a kind (four cards of the same face value).

(d) full house (one pair and one triple, each of the same face value).

(e) flush (five cards in a single suit but not a straight or royal flush).

(f) straight (five cards in a sequence, not all the same suit). (Note that in straights, an ace counts high or low.)
"""

# ╔═╡ 32364c9d-1841-4ea4-af38-6d77b2acd2a1
md"""
(a)

$\frac{4}{\begin{pmatrix}52 \\ 5\end{pmatrix}}$
"""

# ╔═╡ 8b540489-2de3-45ab-84eb-bae3045029cb
md"""
(b) 9 straight flushes for each suit (not counting low Ace)

$\frac{9 ⋅ 4}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}} = \frac{36}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}}$
"""

# ╔═╡ 19e659ae-92d8-4b2f-beb2-2f15d3ae3ae0
md"""
(c)

$\frac{13 ⋅ 48}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}} = \frac{624}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}}$
"""

# ╔═╡ cd9288fb-67e7-4605-9d82-04cae7fb27e6
md"""
(d)

$\frac{13 ⋅ \begin{pmatrix} 4 \\ 3 \end{pmatrix} ⋅ 12 ⋅ \begin{pmatrix} 4 \\ 2 \end{pmatrix}}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}} = \frac{3744}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}}$
"""

# ╔═╡ a59c8fff-8f00-46f1-92ab-03afb88e7baa
md"""
(e)

$\frac{4 ⋅ \begin{pmatrix} 13 \\ 5 \end{pmatrix} - 36 - 4}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}} = \frac{5108}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}}$
"""

# ╔═╡ a8de3406-f2ea-4a19-9074-41ad887722a8
md"""
(f) 10 straight flushes for each suit (counting low ace) multiplied by possible suits

$\frac{10 ⋅ 4^5}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}} = \frac{10240}{\begin{pmatrix} 52 \\ 5 \end{pmatrix}}$
"""

# ╔═╡ dc636909-d0ad-4add-9479-5329654e1046
md"""
### Exercise 3.2 #13

If a set has $2n$ elements, show that it has more subsets with $n$ elements than with any other number of elements.
"""

# ╔═╡ 889dd7ca-8440-4259-a054-248b545201d4
md"""
$\frac{\begin{pmatrix} 2n \\ i \end{pmatrix}}{\begin{pmatrix} 2n \\ i - 1\end{pmatrix}}$
"""

# ╔═╡ 87206487-ff61-4c17-ad68-6a44678f5038
md"""
### Exercise 3.2 #14

Let $b(2n, .5, n)$ be the probability that in $2n$ tosses of a fair coin exactly $n$ heads turn up.
Using Stirling's formula (Theorem 3.3), show that $b(2n,.5,n) ∼ 1/\sqrt{\pi n}$.
Use the program **BinomialProbabilities** to compare this with the exact value for $n = 10$ to 25.
"""

# ╔═╡ de2f8cb0-2ed3-4b28-82bb-a35d996cf7f4
md"""
By Stirling's Formula, $n! ∼ \sqrt{2\pi n} (n^n) e^{-n}$. Thus,

$\begin{align*}
b{\left(2n, \frac{1}{2}, n\right)} &= \begin{pmatrix} 2n \\ n \end{pmatrix} \left(\frac{1}{2}\right)^{2n} \\
&= \frac{(2n)!}{n! n!} \frac{1}{2^{2n}} \\
&= \frac{1}{n! 2^{2n - 1}}
\end{align*}$
"""

# ╔═╡ 67edcddc-b130-408d-8080-7428643ae336
md"""
### Exercise 3.2 #15

A baseball player, Smith, has a batting average of .300 and in a typical game comes to bat three times.
Assume that Smith's hits in a game can be considered to be a Bernoulli trials process with probability .3 for *success*.
Find the probability that Smith gets 0, 1, 2, and 3 hits.
"""

# ╔═╡ 95dc0e70-14f6-4c55-bcd9-bdd3a1ab6643
let
	n = 3
	p = 0.300
	
	[b(n,p,j) for j ∈ 0:n]
end

# ╔═╡ ed661e78-765a-4a2c-b40c-ae20d6f4bc86
md"""
### Exercise 3.2 #16

The Siwash University football team plays eight games in a season, winning three, losing three, and ending two in a tie.
Show that the numbers of ways that this can happen is

$\begin{pmatrix} 8 \\ 3 \end{pmatrix} \begin{pmatrix} 5 \\ 3 \end{pmatrix} = \frac{8!}{3! \;3! \;2!} \;.$
"""

# ╔═╡ 4b4bc94a-fd1d-447b-bc5e-4725acfa8078
md"""
Winning three games outs of eight, $\begin{pmatrix} 8 \\ 3 \end{pmatrix}$.
Five games left, losing three, $\begin{pmatrix} 5 \\ 3 \end{pmatrix}$.
One way to get two ties.
"""

# ╔═╡ 31a51611-2cd4-4d0d-8a2a-92d3724c6827
md"""
### Exercise 3.2 #17

Using the technique of Exercise 16, show that the number of ways that one can put $n$ different objects into three boxes with $a$ in the first, $b$ in the second, and $c$ in the third is $\displaystyle\frac{n!}{a! \;b! \;c!}$.
"""

# ╔═╡ adb69aca-b920-4164-a15c-524073b38238
md"""
``n`` choose $a$, $n-a$ choose $b$, $n - a - b$ choose $c$

$\begin{align*}
\begin{pmatrix} n \\ a \end{pmatrix} \begin{pmatrix} n - a \\ b \end{pmatrix} \begin{pmatrix} n - a - b \\ c \end{pmatrix} &= \frac{n!}{(n - a)! \;a!} \frac{(n - a)!}{(n - a - b)! \;b!} \frac{(n - a - b)!}{(n - a - b - c)! \;c!} \\
&= \frac{n!}{a! \;b! \;c!} \quad \text{from } (n - a - b - c)! = 1
\end{align*}$
"""

# ╔═╡ b9b2b897-d35d-4f05-98d1-0a625ea548da
md"""
### Exercise 3.2 #20

A six-card hand is dealt from an ordinary deck of cards.
Find the probability that:

(a) All six cards are hearts.

(b) There are three aces, two kings, and one queen.

(c) There are three cards of one suit and three of another suit.
"""

# ╔═╡ 625f8bff-a457-44f1-aef5-d8d608dd1f8f
md"""
*Answers*

**(a)**

$\frac{13}{52} ⋅ \frac{12}{51} ⋅ \frac{11}{50} ⋅ \frac{10}{49} ⋅ \frac{9}{48} ⋅ \frac{8}{47} = \frac{33}{391510} ≈ 0.008428903\%$

$\text{or}$

$\frac{\begin{pmatrix} 13 \\ 6 \end{pmatrix}}{\begin{pmatrix} 52 \\ 6 \end{pmatrix}} = \frac{\frac{13!}{7! 6!}}{\frac{52!}{46! 6!}} = \frac{13!}{7!} ⋅ \frac{46!}{52!} = \frac{33}{391510} ≈ 0.008428903\%$
"""

# ╔═╡ 44373fb3-4e53-460f-9240-39037077ed79
md"""
**(b)**

$\frac{\begin{pmatrix} 4 \\ 3 \end{pmatrix} \begin{pmatrix} 4 \\ 2 \end{pmatrix} \begin{pmatrix} 4 \\ 1 \end{pmatrix}}{\begin{pmatrix} 52 \\ 6 \end{pmatrix}} ≈ 0.000471547\%$
"""

# ╔═╡ ebf9318b-8287-45ed-b6a9-a1ada8b4226b
md"""
**(c)**

$\frac{\begin{pmatrix} 13 \\ 3 \end{pmatrix}^2}{\begin{pmatrix} 52 \\ 6 \end{pmatrix}} = \frac{1573}{391510} ≈ 0.4\%$
"""

# ╔═╡ 37cdd07f-42d7-427e-88f8-f69d51b43b74
[
	:a => binomial(13, 6) // binomial(52, 6)
	:b => binomial(4, 3) * binomial(4, 2) * binomial(4, 1) // binomial(52, 6)
	:c => binomial(13, 3)^2 // binomial(52, 6)
]

# ╔═╡ 5feb7f4f-7938-4129-95b0-367896876265
md"""
### Exercise 3.2 #22

How many ways can six indistinguishable letters be put in three mail boxes?
*Hint*: One representation of this is given by a sequence |LL|L|LLL| where the |'s represent the partitions for the boxes and the L's the letters.
Any possible way can be so described.
Note that we need two bars at the ends and the remaining two bars and the six L's can be put in any order.
"""

# ╔═╡ 99cbe94a-0050-44db-ae3b-4138f587325d
let
	n = 3 + 6 # Slots of bins and letters
	k = 3     # Bins
	
	binomial(n - 1, k - 1) # i.e., binomial(8, 2)
end

# ╔═╡ e8d93391-281b-4485-9d62-73f26f2e0678
md"""
### Exercise 3.2 #31

Each of the four engines on an airplane functions correctly on a given flight with probability .99, and the engines are functioning correctly.
What is the probability that the engines will allow for a safe landing?
"""

# ╔═╡ eba066e0-7be9-4c27-bea6-287436aed010
b(4, .99, 4)

# ╔═╡ 07992d2c-3b3e-493f-80ac-ba2f010edd55
md"""
### Exercise 3.2 #39

Prove that the probability of exactly $n$ heads in $2n$ tosses of a fair coin is given by the product of the odd numbers up to $2n - 1$ divided by the product of the even numbers up to $2n$.
"""

# ╔═╡ 334f1ea5-d8fb-43e2-9a2d-b33967d55604
md"""
$\begin{align*}
b(2n, 1/2, n) &= \begin{pmatrix} 2n \\ n \end{pmatrix} \left(\frac{1}{2}\right)^n \left(\frac{1}{2}\right)^n \\
&= \frac{(2n)!}{n! n!} \frac{1}{2^{2n}} \\
&= \frac{2n (2n - 1) ⋯ 2 ⋅ 1}{2n ⋅ 2(n - 1) ⋯ 2 ⋅ 2n ⋅ 2(n - 1) ⋯ 2} \\
&= \frac{(2n - 1)(2n - 3) ⋯ 1}{2n (2n - 2) ⋯ 2}
\end{align*}$
"""

# ╔═╡ 64218544-e6d5-49ec-885b-0472ccc7ff89
md"""
### Exercise 4.1 #2

A coin is tossed three times.
What is the probability that exactly two heads occur, given that

(a) the first outcome was a head?

(b) the first outcome was a tail?

(c) the first two outcomes were heads?

(d) the first two outcomes were tails?

(e) the first outcome was a head and the third outcome was a head?
"""

# ╔═╡ 840425fb-1dc0-4c09-af7d-26964fba61a5
md"(a) 1/2"

# ╔═╡ c3d40d5e-0744-4d69-8202-ecb16e136c83
md"(b) 1/4"

# ╔═╡ 9d42cafc-b5b1-405a-8f2d-ddedc22f9ac3
md"(c) 1/2"

# ╔═╡ 4443d9c0-2929-4321-b5e6-acdf2090a32d
md"(d) 0"

# ╔═╡ 57c14941-f3fd-480e-bdd6-cd00e3057783
md"(e) 1/2"

# ╔═╡ 9790c0e5-0623-4155-9135-fd0e5428cc67
md"""
### Exercise 4.1 #3

A die is rolled twice.
What is the probability that the sum of the faces is greater than 7, given that

(a) the first outcome was a 4?

(b) the first outcome was greater than 3?

(c) the first outcome was a 1?

(d) the first outcome was less than 5?
"""

# ╔═╡ a46ea122-ddfa-4ba4-947e-8aae3e8db81f
md"(a) 1/2"

# ╔═╡ 809ed195-1412-4867-b1fe-686e3b532c47
md"(b) 1/3 ⋅ (1/2 + 2/3 + 5/6) = 2/3"

# ╔═╡ df79a956-4acb-4841-85c2-17a2b0b490c4
md"(c) 0"

# ╔═╡ 6b369f36-d1d3-46a0-9a0a-7b3449c8622d
md"(d) 1/2 ⋅ 1/3 ⋅ 1/6 = 1/36"

# ╔═╡ b17221b1-b65b-4d76-a615-5ae05b6f9e55
1//3 * (1//2 + 2//3 + 5//6)

# ╔═╡ 9d2bbf1d-0a72-4317-b297-87d591beb3aa
md"""
### Exercise 4.1 #7

A coin is tossed twice. Consider the following events.
- A: Heads on the first toss.
- B: Heads on the second toss.
- C: The two tosses come out the same.

(a) Show that $A$, $B$, $C$ are pairwise independent but not independent.

(b) Show that $C$ is independent of $A$ and $B$ but not of $A ∩ B$.
"""

# ╔═╡ 8782362e-3920-42ba-a453-eec616fffdc2
md"""
**(a)**

Pairwise independent:

$P(A ∩ B) = P(A ∩ C) = P(B ∩ C) = \frac{1}{4}$
$P(A)P(B) = P(A)P(C) = P(B)P(C) = \frac{1}{4}$

Not independent:

$P(A ∩ B ∩ C) = \frac{1}{4} \neq P(A) P(B) P(C) = \frac{1}{8}$
"""

# ╔═╡ d6d87956-4668-4ef0-9f94-497d724711c2
md"""
**(b)**

$P(A ∩ C) = P(A)P(C) = \frac{1}{4}, \text{ so } C \text{ and } A \text{ are independent}$

$P(B ∩ C) = P(B)P(C) = \frac{1}{4}, \text{ so } C \text{ and } B \text{ are independent}$

$P((A ∩ B) ∩ C) = \frac{1}{4} \neq P(A ∩ B)P(C) = \frac{1}{8}, \text{ so } C \text{ and } A ∩ B \text{ are not independent}$
"""

# ╔═╡ 4d52e3b4-24da-43ee-849b-be2ce96af8d1
md"""
### Exercise 4.1 #12

In Example 4.17, how large must the prior probability of cancer be to give a posterior probability of .5 for cancer given a positive test?
"""

# ╔═╡ 98f9f085-0558-4d17-b2b3-d1811afdab04
md"""
$P(+ ∣ \text{cancer}) = 0.99$

$P(+ ∣ \text{not cancer}) = 0.05$

Find $P(\text{cancer})$ such that $P(\text{cancer} ∣ +) = 0.5$.

$\begin{align*}
P(\text{cancer} ∣ +) &= \frac{P(\text{cancer}) P(+ ∣ \text{cancer})}{P(+)} \\
P(\text{cancer} ∣ +) &= \frac{P(\text{cancer}) P(+ ∣ \text{cancer})}{P(\text{cancer}) P(+∣\text{cancer}) + P(\text{not cancer}) P(+∣\text{not cancer})} \\
0.5 &= \frac{0.99P(\text{cancer})}{0.99P(\text{cancer}) + 0.05P(\text{not cancer})} \\
0.5 &= \frac{0.99P(\text{cancer})}{0.99P(\text{cancer}) + 0.05(1 - P(\text{cancer}))}
\end{align*}$
$\begin{align*}
0.99P(\text{cancer}) + 0.05(1 - P(\text{cancer})) &= \frac{0.99P(\text{cancer})}{0.5} \\
0.99P(\text{cancer}) + 0.05 - 0.05P(\text{cancer}) &= 1.98P(\text{cancer}) \\
0.99P(\text{cancer}) - 0.05P(\text{cancer}) - 1.98P(\text{cancer}) &= -0.05 \\
-1.04P(\text{cancer}) &= -0.05 \\
P(\text{cancer}) &≈ 0.0481
\end{align*}$
"""

# ╔═╡ f4ad2137-6a75-472d-81f0-65bd2f331f6c
md"""
### Exercise 4.1 #14

If $P(\bar{B}) = \frac{1}{4}$ and $P(A ∣ B) = 1/2$, what is $P(A ∩ B)$?
"""

# ╔═╡ af309461-1415-4668-a959-a160a56793a1
md"""
$P(\bar{B}) = \frac{1}{4} \implies P(B) = 1 - P(\bar{B}) = \frac{3}{4}$

$P(A ∣ B) = \frac{P(A ∩ B)}{P(B)} \implies P(A ∩ B) = P(A ∣ B) P(B)$

$P(A ∩ B) = \left(\frac{1}{2}\right)\left(\frac{3}{4}\right) = \frac{3}{8}$
"""

# ╔═╡ f3660892-bcbb-4212-84d0-443866e92118
md"""
### Exercise 4.1 #24

A fair coin is thrown $n$ times.
Show that the conditional probability of a head on any specified trial, given a total of $k$ heads over the $n$ trials, is $k/n$ $(k > 0)$.
"""

# ╔═╡ 72d6cf12-bc23-4bdd-b0f1-480b8f324088
md"""
$P(\text{A head on the } j\text{th trial and a total of } k \text{ heads in } n \text{ trials}) = \left(\frac{1}{2}\right)^n \begin{pmatrix} n-1 \\ k-1 \end{pmatrix}\;.$

$P(\text{Exactly } k \text{ heads in } n \text{ trials}) = \left(\frac{1}{2}\right)^n \begin{pmatrix} n \\ k \end{pmatrix}$

Thus

$P(\text{Head on the } j\text{'th trial} ∣ k \text{ heads in } n \text{ trials}) = \frac{\begin{pmatrix} n - 1 \\ k - 1 \end{pmatrix}}{\begin{pmatrix} n \\ k \end{pmatrix}} = \frac{k}{n}$
"""

# ╔═╡ 89068e5a-2174-42c8-91d1-60fdf2e9c979
md"""
### Exercise 4.1 #36

A die is thrown twice.
Let $X_1$ and $X_2$ denote the outcomes.
Define $X = \min(X_1, X_2)$.
Find the distribution of $X$.
"""

# ╔═╡ 91cbb957-bab8-4ad4-a4d1-22f95b2063ec
md"""
$p = \begin{pmatrix}
1 & 2 & 3 & 4 & 5 & 6 \\
\frac{11}{36} & \frac{9}{36} & \frac{7}{36} & \frac{5}{36} & \frac{3}{36} & \frac{1}{36}
\end{pmatrix}$
"""

# ╔═╡ 8b61ef17-aea3-4275-806d-1fd59572bd78
md"""
### Exercise 4.2 #1

Pick a point $x$ at random (with uniform density) in the interval [0,1].
Find the probability that $x > 1/2$, given that

(a) $x > 1/4$.

(b) $x < 3/4$.

(c) $|x - 1/2| < 1/4$.

(d) $x^2 - x + 2/9 < 0$.
"""

# ╔═╡ 428091c0-9563-49b3-b3ec-e04b62b3f3ca
md"""
**(a)**

$P(x > 1/4 ∣ x > 1/2) = \frac{P(x > 1/4 ∩ x > 1/2)}{P(x > 1/2)} = \frac{\frac{1}{4}}{\frac{1}{2}} = \frac{1}{2}$
"""

# ╔═╡ 0a895c88-6bbd-4bf9-abd0-c65fe4eb7bbb
md"""
**(b)**

$P(x < 3/4 ∣ x > 1/2) = \frac{P(x < 3/4 ∩ x > 1/2)}{P(x > 1/2)} = \frac{\frac{1}{4}}{\frac{1}{2}} = \frac{1}{2}$
"""

# ╔═╡ 64a7d1b4-1e20-4f8b-928b-9e51a7cbca56
md"""
**(c)**

$P(|x - 1/2| < 1/4 ∣ x > 1/2) = \frac{P(|x - 1/2| < 1/4 ∩ x > 1/2)}{P(x > 1/2)} = \frac{\frac{1}{4}}{\frac{1}{2}} = \frac{1}{2}$
"""

# ╔═╡ a96f03b7-f7b7-4f6a-a07f-18c9e0ab08f4
md"""
**(d)**

$x^2 - x + 2/9 = \left(x - \frac{1}{3}\right)\left(x - \frac{2}{3}\right)$

$\begin{align*}
∫_{2/3}^1 x^2 - x + 2/9 \;dx &= \left[\frac{1}{3} x^3 - \frac{1}{2} x^2 + \frac{2}{9} x\right]_{2/3}^1 \\
&= \left[\frac{1}{3} - \frac{1}{2} + \frac{2}{9}\right] - \left[\frac{1}{3} \left(\frac{2}{3}\right)^3 - \frac{1}{2}\left(\frac{2}{3}\right)^2 + \frac{2}{9}\left(\frac{2}{3}\right)\right] \\
&= \frac{5}{9} - \frac{1}{2} - \left(\frac{8}{81} - \frac{4}{18} + \frac{4}{27}\right) \\
&= \frac{10}{18} - \frac{9}{18} - \frac{8}{81} + \frac{4}{18} - \frac{12}{81} \\
&= \frac{5}{18} - \frac{20}{81} \\
&= \frac{5}{162}
\end{align*}$

$\begin{align*}
P(x^2 - x + 2/9 < 0 ∣ x > 1/2) &= \frac{P(x^2 - x + 2/9 < 0 ∩ x > 1/2)}{P(x > 1/2)} \\
&= \frac{\frac{5}{162}}{\frac{1}{2}} \\
&= \frac{5}{81}
\end{align*}$
"""

# ╔═╡ 6e448615-3624-45f0-a53d-84062f7e7952
md"""
### Exercise 4.2 #4

Suppose you toss a dart at a circular target of radius 10 inches.
Given that the dart lands in the upper half of the target, find the probability that

(a) it lands in the right half of the target.

(b) its distance from the center is less than 5 inches.

(c) its distance from the center is greater than 5 inches.

(d) it lands within 5 inches of the point (0,5).
"""

# ╔═╡ 8fe75eaa-a205-4fed-87a8-c90599950c29
md"""
**(a)** 1/4

**(b)** 1/4

**(c)** 3/4

**(d)** 1/2
"""

# ╔═╡ 449e33c4-6421-4f8c-b369-d623b22f8b67
md"""
### Exercise 4.2 #5

Suppose you choose two numbers $x$ and $y$, independently at random from the interval [0,1].
Given that their sum lies in the interval [0,1], find the probability that

(a) $|x - y| < 1$.

(b) $xy < 1/2$.

(c) $\max\{x,y\} < 1/2$.

(d) $x^2 + y^2 < 1/4$.

(e) $x > y$.
"""

# ╔═╡ 4db7f519-c949-4695-adaa-6d929ace45ce
md"""
Graph the equations.

**(a)** 1

**(b)** 1

**(c)** 1/4 ÷ 1/2 = 1/2

**(d)** (1/4)π(1/2)^2 ÷ 1/2 = π/8

**(e)** 1/2
"""

# ╔═╡ 4ca5d5e1-1ac7-4f73-9d99-edd2609c78e9
1//2 + 1//4 - 1//16

# ╔═╡ 2a745849-2ad2-42fb-9f76-da0b5e96dc82
md"""
### Exercise 5.1 #1

For which of the following random variables would it be appropriate to assign a uniform distribution?

(a) Let $X$ represent the roll of one die.

(b) Let $X$ represent the number of heads obtained in three tosses of a coin.

(c) A roulette wheel has 38 possible outcomes: 0, 00, and 1 through 36.
Let $X$ represent the outcome when a roulette wheel is spun.

(d) Let $X$ represent the birthday of a randomly chosen person.

(e) Let $X$ represent the number of tosses of a coin necessary to achieve a head for the first time.
"""

# ╔═╡ 79b0e3ed-ec94-41a5-a3c0-0310955eca7b
md"""
**(a)** yes

**(b)** no

**(c)** yes

**(d)** yes

**(e)** no
"""

# ╔═╡ 4147db21-d8a3-46a7-a357-b45e0e596391
md"""
### Exercise 5.1 #2

Let $n$ be a positive integer.
Let $S$ be the set of integers between 1 and $n$.
Consider the following process: We remove a number from $S$ at random and write it down.
We repeat this until $S$ is empty.
The result is a permutation of the integers from 1 to $n$.
Let $X$ denote this permutation.
Is $X$ uniformly distributed?
"""

# ╔═╡ 929e81d5-ee0c-48f9-9779-a5dcdca61561
md"Yes"

# ╔═╡ 4ab90b83-32c6-4e35-a382-4f950d1b62ba
md"""
### Exercise 5.1 #4
"""

# ╔═╡ 23d59281-f651-4318-b35c-925a519abe76
md"""
(a) no
(b) no
(c) yes; 100 / 3000
"""

# ╔═╡ 94e17cbd-78e4-453e-8217-9010daf7b113
md"""
### Exercise 5.1 #6

Let $X_1$, $X_2$, …, $X_n$ be $n$ mutually independent random variables, each of which is uniformly distributed on the integers from 1 to $k$.
Let $Y$ denote the minimum of the $X_i$'s.
Find the distribution of $Y$.
"""

# ╔═╡ ec26d2e0-7096-433c-8dfd-f4c0f7be5917
md"""
$f(x) = \frac{(k - x + 1)^n - (k - x)^n}{k^n}\;,$

for $1 ≤ x ≤ k$.
The numerator counts the number of $n$-tuples, all of whose entries are at least $x$, and subtracts the number of $n$-tuples, all of whose entries are at least $x + 1$.
"""

# ╔═╡ 94f905c4-89de-4b66-9657-0fa73968e8ae
md"""
### Exercise 5.1 #8

If a coin is tossed a sequence of times, what is the probability that the first head will occur after the fifth toss, given that it has not occurred in the first two tosses?
"""

# ╔═╡ 43a11079-7637-40c8-aa3a-6eab53793d02
md"P(T > 5 | T > 2) = P(T > 3) = (0.5)^3 = 1/8"

# ╔═╡ b09602b3-2655-4a3b-805d-1fcf86835724
md"""
### Exercise 5.1 #9
"""

# ╔═╡ ccdb2c90-d164-4abb-8ea0-beac6cca3e00
md"""
### Exercise 5.1 #12

Show that the values of the Poisson distribution given in Equation 5.2 sum to 1.
"""

# ╔═╡ fba78c52-1565-480e-86b9-9411e411a2c5
md"""

$P(X = k) ≈ \frac{\lambda^k}{k!} e^{-\lambda}$

$\implies \sum_{k = 0}^{∞} \frac{\lambda^k}{k!} e^{-\lambda} = e^{-\lambda} \sum_{k = 0}^{∞} \frac{\lambda^k}{k!}$

Using

$e^\lambda = \sum_{k = 0}^{∞} \frac{\lambda^k}{k!}$

We find that

$\sum_{k = 0}^{\infty} \frac{\lambda^k}{k!} e^{-\lambda} = e^{-\lambda} e^{\lambda} = \frac{e^{\lambda}}{e^{\lambda}} = 1$
"""

# ╔═╡ 3a1ef7b0-f2cf-4f08-912c-af7d01beb51e
md"""
### Exercise 5.1 #13

The Poisson distribution with parameter $\lambda = .3$ has been assigned for the outcome of an experiment.
Let $X$ be the outcome function.
Find $P(X = 0)$, $P(X = 1)$, and $P(X > 1)$.
"""

# ╔═╡ 9f619140-dc53-48e5-9da0-f90d6a19e805
md"""
$P(X = 0) ≈ \frac{\lambda^k}{k!}e^{-\lambda} = \frac{(0.3)^0}{0!} e^{-(0.3)} = \frac{1}{e^{0.3}}$

$P(X = 1) ≈ \frac{\lambda^k}{k!}e^{-\lambda} = \frac{(0.3)^1}{1!} e^{-(0.3)} = \frac{0.3}{e^{0.3}}$

$P(X > 1) = 1 - P(X = 1) = 1 - \frac{0.3}{e^{0.3}}$
"""

# ╔═╡ ddd954b9-0f98-4311-a7f0-6bd2022f7712
[
	1 / exp(0.3),
	0.3 / exp(0.3),
	1 - (0.3 / exp(0.3))
]

# ╔═╡ 72b8422b-5efd-4443-9c37-1dea8f2768a9
md"""
### Exercise 5.1 #14
"""

# ╔═╡ acd69121-b2c6-4c3d-b6ed-200cc49440fa
md"""
### Exercise 5.2 #1

Choose a number $U$ from the unit interval $[0,1]$ with uniform distribution.
Find the cumulative distribution and density for the random variables

(a) $Y = U + 2$.

(b) $Y = U^3$.
"""

# ╔═╡ c8372676-860d-48e5-a9f5-4959abf1c67e
md"""
**(a)**

$F_U(u) = P(U ≤ u) = u$

$f_U(u) = \frac{d}{du} F_U(u) = 1$

$F_Y(y) = P(Y ≤ y) = P(U + 2 ≤ y) = P(U ≤ y - 2) = y - 2 \qquad \text{ on } [2,3]$

$f_Y(y) = \frac{d}{dy} F_Y(y) = 1 \qquad \text{ on } [2,3]$
"""

# ╔═╡ 6a8d6d71-6508-4a85-9ff6-2fbf2b720d69
md"""
**(b)**

$F_Y(y) = P(Y ≤ y) = P(U^3 ≤ y) = P\left(U ≤ y^{\frac{1}{3}}\right) = y^{\frac{1}{3}} \qquad \text{ on } [0,1]$

$f_Y(y) = \frac{d}{dy} F_Y(y) = \frac{1}{3y^{\frac{2}{3}}} \qquad \text{ on } [0,1]$
"""

# ╔═╡ 2d71df1f-793c-46f7-9525-e56bdb1c5b79
md"""
### Exercise 5.2 #2
"""

# ╔═╡ b9b28967-13f6-4d0d-b81b-ef76f32e07f0
md"""
(a) $Y = 1/(U + 1)$

$F_U(u) = P(U ≤ u) = u$

$f_U(u) = \frac{d}{du} F_U(u) = 1$

$F_Y(y) = P(Y ≤ y) = P(1/(U + 1) ≤ y) = P(1 ≤ Uy + y) = P(-1 ≤ U) = 1$
"""

# ╔═╡ 402455f8-f8a8-4770-bad1-19ace030f619
md"""
### Exercise 5.2 #5

Choose a number $U$ from the interval $[0,1]$ with uniform distribution.
Find the cumulative distribution and density for the random variables

(a) $Y = |U - 1/2|$.

(b) $Y = (U - 1/2)^2$.
"""

# ╔═╡ b79d4f20-4ff4-413c-b031-651d4925d3cf
md"""
**(a)**

$F_U(u) = P(U ≤ u) = u$

$f_U(u) = \frac{d}{du} F_U(u) = 1$

$\begin{align*}
F_Y(y) = P(Y ≤ y) = P(|U - 1/2| ≤ y) &= P(U ≤ y + 1/2) + P(U ≥ 1/2 - y) \\
&= y + 1/2 - (1/2 - y) \\
&= 2y \qquad \text{ on } \left[0,\frac{1}{2}\right]
\end{align*}$

$f_Y(y) = \frac{d}{dy} F_Y(y) = 2 \qquad \text{ on } \left[0,\frac{1}{2}\right]$
"""

# ╔═╡ 43cfa0ae-5785-4402-b3fe-d99204c5f0a6
md"""
**(b)**

$F_Y(y) = P(Y ≤ y) = P((U - 1/2)^2 ≤ y) = P(U ≤ \sqrt{y} + 1/2) = \sqrt{y} + 1/2 \text{ on } \left[0,\frac{1}{4}\right]$

$f_Y(y) = \frac{d}{dy} F_Y(y) = \frac{1}{2 \sqrt{y}} \qquad \text{ on } \left[0,\frac{1}{4}\right]$
"""

# ╔═╡ a68e22bd-2a4a-4ab6-892f-7d6bf0d6c98c
md"""
### Exercise 5.2 #10

Let $U$, $V$ be random numbers chosen independently from the interval $[0,1]$.
Find the cumulative distribution and density for the random variables

(a) $Y = \max(U, V)$.

(b) $Y = \min(U, V)$.
"""

# ╔═╡ 4d334cc7-12ae-47c9-a3dd-e2615fda4c54
md"""
**(a)**

$F_U(u) = P(U ≤ u) = u$

$f_U(u) = \frac{d}{du} F_U(u) = 1$

$F_V(v) = P(V ≤ v) = v$

$f_V(v) = \frac{d}{dv} F_V(v) = 1$

$f_Y(y) = 2y \qquad \text{ on } [0,1]$

$F_Y(y) = ∫_0^{∞} f_Y(y) \;dy = y^2 \qquad \text{ on } [0,1]$
"""

# ╔═╡ e1d0d507-3ea4-4333-aaa8-2d5a568d7a2b
histogram([max(u, v) for u ∈ 0:100 for v ∈ 0:100], bins = 100, label = false)

# ╔═╡ 8d03ad36-4c56-465d-bdd2-7f5bc2d0615b
histogram([min(u, v) for u ∈ 0:100 for v ∈ 0:100], bins = 100, label = false)

# ╔═╡ 888fe3a2-76ed-436f-a6d4-02aba5c125d0
md"""
**(b)**

$f_Y(y) = 2 - 2y \qquad \text{ on } [0,1]$

$F_Y(y) = ∫_0^∞ f_Y(y) \;dy = 2y - y^2 \qquad \text{ on } [0,1]$
"""

# ╔═╡ b8cebdf3-e90c-4d89-89b5-f7009174d8f7
md"""
### Exercise 5.2 #12
"""

# ╔═╡ a54b1309-93ac-4ccc-90d7-b78fdde48d7b
md"""
### Exercise 5.2 #14
"""

# ╔═╡ 827ae940-f339-41d1-a2d4-03e0c97c90b7
md"""
### Exercise 5.2 #16

Let $X$ be a random variable with density function

$f_X(x) = \begin{cases}
cx(1 - x), &\text{if } 0 < x < 1, \\
0, &\text{otherwise.}
\end{cases}$

(a) What is the value of $c$?

(b) What is the cumulative distribution function $F_X$ for $X$?

(c) What is the probability that $X < 1/4$?
"""

# ╔═╡ fa371210-3087-4279-bbc9-9a8ba69e6710
md"""
**(a)**

$1 = ∫_0^1 cx(1 - x) \;dx = c ∫_0^1 x - x^2 \;dx = c \left[\frac{1}{2} x^2 - \frac{1}{3} x^3\right]_0^1 = c \left[\frac{1}{2} - \frac{1}{3}\right]$

$1 = \frac{1}{6} c \implies c = 6$
"""

# ╔═╡ 1395dd19-ce33-408a-beac-5d742eb7e944
md"""
**(b)**

$F_X(x) = ∫ 6x(1 - x) \;dx = 6 ∫ x - x^2 \;dx = 6 \left[\frac{1}{2} x^2 - \frac{1}{3} x^3\right] = 3x^2 - 2x^3$
"""

# ╔═╡ 03fcdd63-dbe7-47c1-920e-163de501afc0
md"""
**(c)**

$P(X < 1/4) = F_X(1/4) = 3 \left(\frac{1}{4}\right)^2 - 2 \left(\frac{1}{4}\right)^3 = \frac{3}{16} - \frac{2}{64} = \frac{5}{32} = 0.15625$
"""

# ╔═╡ f5eb9f87-7ee9-4c1f-9981-db0d04d15dad
md"""
### Exercise 5.2 #17
"""

# ╔═╡ c4197200-72da-45f8-8c68-372e28196bfb
md"""
### Exercise 6.1 #1

A card is drawn at random from a deck consisting of cards numbered 2 through 10.
A player wins 1 dollar if the number on the card is odd and loses 1 dollar if the number is even.
What is the expected value of his winnings?
"""

# ╔═╡ 291bf333-c326-47e2-9d9c-24c8b135a9f9
md"""
$Ω = \{1, -1\}$

$m(1) = \frac{4}{9}$

$m(-1) = \frac{5}{9}$

$E(X) = \sum_{x ∈ Ω} xm(x) \implies E(X) = \frac{4}{9} - \frac{5}{9} = -\frac{1}{9}$
"""

# ╔═╡ 074c1c6e-2b9c-4c56-b344-12e4562a8739
md"""
### Exercise 6.1 #2

A card is drawn at random from a deck of playing cards.
If it is red, the player wins 1 dollar; if it is black, the player loses 2 dollars.
Find the expected value of the game.
"""

# ╔═╡ bab5e95d-de79-46a5-87e7-e55e313fb97c
md"""
$Ω = \{1, -2\}$

$m(1) = \frac{1}{2}$

$m(-2) = \frac{1}{2}$

$E(X) = \sum_{x ∈ Ω}xm(x) \implies E(X) = \frac{1}{2} - \frac{2}{2} = -\frac{1}{2}$
"""

# ╔═╡ 3816685b-37b3-44cd-8f52-645bfb183002
md"""
### Exercise 6.1 #16

Gerolamo Cardano in his book, *The Gambling Scholar*, written in the early 1500s, considers the following carnival game.
There are six dice.
Each of the dice has five blank sides.
The sixth side has a number between 1 and 6---a different number on each die.
The six dice are rolled and the player wins a prize depending on the total of the numbers which turn up.

(a) Find, as Cardano did, the expected total without finding its distribution.

(b) Large prizes were given for large totals with a modest fee to play the game.
    Explain why this could be done.
"""

# ╔═╡ 3813ead1-3ed9-474b-af53-3d0e4be94ca6
md"""
**(a)**

Let $X_i$ denote the outcome of the $i$th die.

$E(X_1 + X_2 + X_3 + X_4 + X_5 + X_6)$
$\begin{align*}
&= E(X_1) + E(X_2) + E(X_3) + E(X_4) + E(X_5) + E(X_6) \\
&= \frac{1}{6} + \frac{2}{6} + \frac{3}{6} + \frac{4}{6} + \frac{5}{6} + \frac{6}{6} = \frac{7}{2} = 3.5
\end{align*}$
"""

# ╔═╡ 5639358b-4569-48d9-bf89-809ad642b8cf
md"""
**(b)**

Large sums are much less likely to occur than small sums. For example

$P(\text{total} = 21) = (1/6)^6 = 2.14 × 10^{-5}$

$P(\text{total} = 0) = (5/6)^6 = .335$
"""

# ╔═╡ 0e227aa3-cabd-4348-b66f-f280da2c0831
md"""
### Exercise 6.1 #17

Let $X$ be the first time that a *failure* occurs in an infinite sequence of Bernoulli trials with probability $p$ for success.
Let $p_k = P(X = k)$ for $k = 1, 2, …$
Show that $p_k = p^{k-1} q$ where $q = 1 - p$.
Show that $\sum_k p_k = 1$.
Show that $E(X) = 1/q$.
What is the expected number of tosses of a coin required to obtain the first tail?
"""

# ╔═╡ 8f52804f-0f30-4f5c-8738-c173a41eb95e
md"""
$p_k = p(\overbrace{S ⋯ S}^{k - 1 \text{ times}} \;F) = p^{k - 1} (1 - p) = p^{k - 1} q, \; k = 1, 2, 3, …$

$\sum_{k = 1}^{∞} p_k = q \sum_{k = 0}^{∞} p^k = q \frac{1}{1 - p} = 1\;.$

$E(X) = q \sum_{k = 1}^{∞} kp^{k - 1} = \frac{q}{(1 - p)^2} = \frac{1}{q}\;. \;\text{(See Example 6.4.)}$
"""

# ╔═╡ aa1008d7-3c88-4a94-8a15-c06b686902b1
md"""
### Exercise 6.1 #21

Let $X$ be a random variable which is Poisson distributed with parameter $\lambda$.
Show that $E(X) = \lambda$.
*Hint*: Recall that

$e^x = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + ⋯ \;.$
"""

# ╔═╡ 73166942-60ca-45fc-916b-6f92841d39f3
md"""
$\begin{align*}
E(X) &= \sum_{k = 0}^{∞} k ⋅ P(X = k) \\
&= \sum_{k = 1}^{∞} k ⋅ \left(\frac{\lambda^k}{k!}\right) e^{-\lambda} \\
&= e^{-\lambda} \sum_{k = 1}^{∞} \frac{\lambda^k}{(k - 1)!} \\
&= \lambda e^{-\lambda} \sum_{k = 1}^{∞} \frac{\lambda^{k - 1}}{(k - 1)!} \\
&= \lambda e^{-\lambda} \underbrace{\sum_{m = 0}^{∞} \frac{\lambda^m}{m!}}_{e^{\lambda}} \\
&= \lambda
\end{align*}$
"""

# ╔═╡ d2e829a1-0f4b-4829-8777-e83757682d3c
md"""
### Exercise 6.2 #1

A number is chosen at random from the set $S = \{-1, 0, 1\}$.
Let $X$ be the number chosen.
Find the expected value, variance, and standard deviation of $X$.
"""

# ╔═╡ 0e2726f6-816d-4b9c-bf56-8162d894b974
md"""
$m(x) = \frac{1}{3}$

$E(X) = \sum_{x ∈ Ω} xm(x) = -\frac{1}{3} + 0 + \frac{1}{3} = 0$

$V(X) = E\left((X - \mu)^2\right) = E\left((X - E(X))^2\right) = E\left(X^2\right)$

$= (-1)^2 \left(\frac{1}{3}\right) + (0)^2 \left(\frac{1}{3}\right) + (1)^2 \left(\frac{1}{3}\right) = \frac{2}{3}$

$D(X) = \sqrt{V(X)} = \sqrt{\frac{2}{3}}$
"""

# ╔═╡ c5dc7cae-a296-489f-95b1-31a1a8afa2f4
md"""
### Exercise 6.2 #2

A random variable $X$. has the distribution

$p_X = \begin{pmatrix} 0 & 1 & 2 & 4 \\ 1/3 & 1/3 & 1/6 & 1/6 \end{pmatrix}$

Find the expected value, variance, and standard deviation of $X$.
"""

# ╔═╡ 2c4caa88-cdf8-40e6-95ea-a3b624b5ed23
md"""
$E(X) = \sum_{x ∈ Ω} xm(x) = (0)\left(\frac{1}{3}\right) + (1)\left(\frac{1}{3}\right) + (2)\left(\frac{1}{6}\right) + (4)\left(\frac{1}{6}\right) = \frac{2}{6} + \frac{2}{6} + \frac{4}{6} = \frac{4}{3}$

$\begin{align*}
V(X) &= E\left((X - \mu)^2\right) = E\left((X - E(X))^2\right) = E\left(\left(X - \frac{4}{3}\right)^2\right) \\
&= \left(0 - \frac{4}{3}\right)^2 \left(\frac{1}{3}\right) + \left(1 - \frac{4}{3}\right)^2 \left(\frac{1}{3}\right) + \left(2 - \frac{4}{3}\right)^2 \left(\frac{1}{6}\right) + \left(4 - \frac{4}{3}\right)^2 \left(\frac{1}{6}\right) \\
&= \frac{16}{27} + \frac{1}{27} + \frac{2}{27} + \frac{32}{27} = \frac{51}{27} = \frac{17}{9}
\end{align*}$

$D(X) = \sqrt{V(X)} = \frac{\sqrt{17}}{9}$
"""

# ╔═╡ 81cebd4a-1b94-41f3-8fa0-f95c6dda22d9
md"""
### Exercise 6.2 #4

``X`` is a random variable with $E(X) = 100$ and $V(X) = 15$.
Find

(a) $E(X^2)$.

(b) $E(3X + 10)$.

(c) $E(-X)$.

(d) $V(-X)$.

(e) $D(-X)$.
"""

# ╔═╡ 7857ef08-85c3-4a7a-9447-1d166a845a42
md"""
**(a)**

$V(X) = E(X^2) - E(X)^2 = E(X^2) - 100^2 = 15 \implies E(X^2) = 10015$
"""

# ╔═╡ c764e746-137e-4669-a3db-c497b7c0c28c
md"""
**(b)**

$E(3X + 10) = E(3X) + E(10) = 3E(X) + 10 = 300 + 10 = 310$
"""

# ╔═╡ c5678806-288e-4685-9320-5275ef0f05a5
md"""
**(c)**

$E(-X) = -E(X) = -100$
"""

# ╔═╡ f89646e9-afc8-4f89-8efa-b0fb79d92705
md"""
**(d)**

$V(-X) = (-1)^2 V(X) = 15$
"""

# ╔═╡ a6bc6b86-da10-4ee7-a00b-9f54df2d3e5b
md"""
**(e)**

$D(-X) = \sqrt{V(-X)} = \sqrt{15}$
"""

# ╔═╡ 199336b6-9581-402f-b48b-7104aaf6da08
md"""
### Exercise 6.2 #7

A coin is tossed three times.
Let $X$ be the number of heads that turn up.
Find $V(X)$ and $D(X)$.
"""

# ╔═╡ dc05d712-7afc-47e4-b521-7e0158e45cd6
md"""
$\{TTT, TTH, THT, HTT, HHT, HTH, THH, HHH\}$

$Ω = \{0, 1, 2, 3\}$

$E(X) = \sum_{x ∈ Ω} xm(x) = (0) \left(\frac{1}{8}\right) + (1) \left(\frac{3}{8}\right) + (2) \left(\frac{3}{8}\right) + (3) \left(\frac{1}{8}\right) = \frac{3}{2}$

$\begin{align*}
V(X) &= E(X^2) - E(X)^2 \\
&= (0)^2 \left(\frac{1}{8}\right) + (1)^2 \left(\frac{3}{8}\right) + (2)^2 \left(\frac{3}{8}\right) + (3)^2 \left(\frac{1}{8}\right) - \left(\frac{3}{2}\right)^2 \\
&= \frac{3}{8} + \frac{12}{8} + \frac{9}{8} - \frac{9}{4} \\
&= \frac{12}{4} - \frac{9}{4} \\
&= \frac{3}{4}
\end{align*}$

$D(X) = \sqrt{V(X)} = \frac{\sqrt{3}}{2}$
"""

# ╔═╡ 7e109b78-ea8e-4ce4-aadb-04a30162a22a
md"""
### Exercise 6.2 #10

Prove the following facts about the standard deviation.

(a) $D(X + c) = D(X)$.

(b) $D(cX) = |c| D(X)$.
"""

# ╔═╡ 222e520e-1641-436b-a0e3-cf9b607fe2cd
md"""
**(a)**

$D(X + c) = \sqrt{V(X + c)} = \sqrt{V(X)} = D(X)$

**(b)**

$D(cX) = \sqrt{V(cX)} = \sqrt{c^2 V(X)} = |c| \sqrt{V(X)} = |c|D(X)$
"""

# ╔═╡ dd1fb462-efae-43c8-b57c-140e85d7c2a5
md"""
### Exercise 6.2 #11

A number is chosen at random from the integers $1, 2, 3, …, n$.
Let $X$ be the number chosen.
Show that $E(X) = (n + 1)/2$ and $V(X) = (n - 1)(n + 1) / 12$.
*Hint*: The following identity may be useful:

$1^2 + 2^2 + ⋯ + n^2 = \frac{(n)(n + 1)(2n + 1)}{6}\;.$
"""

# ╔═╡ 715103e7-8538-4e9e-96e3-4634eb8e5f04
md"""
### Exercise 6.2 #12

$E(X) = \sum_{x ∈ \Omega} xm(x) = \frac{1}{n} + \frac{2}{n} + ⋯ \frac{n}{n} = \frac{n + 1}{2}$

$\begin{align*}
V(X) &= E(X^2) - E(X)^2 \\
&= \frac{(n)(n + 1)(2n + 1)}{6n} - \frac{(n + 1)(n + 1)}{4} \\
&= \frac{2(n + 1)(2n + 1) - 3(n + 1)(n + 1)}{12} \\
&= \frac{(n + 1) \left(2(2n + 1) - 3(n + 1)\right)}{12} \\
&= \frac{(n + 1) \left(4n + 2 - 3n - 3\right)}{12} \\
&= \frac{(n + 1) (n - 1)}{12} \\
\end{align*}$
"""

# ╔═╡ d0206875-8ac8-4a99-a2d6-df955bff0089
md"""
### Exercise 6.3 #1

Let $X$ be a random variable with range $[-1, 1]$ and let $f_X(x)$ be the density function of $X$.
Find $\mu(X)$ and $\sigma^2(X)$ if, for $|x| < 1$,

(a) $f_X(x) = 1/2$.

(b) $f_X(x) = |x|$.

(c) $f_X(x) = 1 - |x|$.

(d) $f_X(x) = (3/2) x^2$.
"""

# ╔═╡ 8a402036-17e5-4454-961d-ac3215203729
md"""
**(a)**

$\mu(X) = ∫_{-1}^1 x f_X(x) \;dx = \frac{1}{2} ∫_{-1}^1 x \;dx = \frac{1}{2} \left[\frac{1}{2} - \frac{1}{2}\right] = 0$

$\begin{align*}\sigma^2(X) &= \mu(X^2) - \mu(X)^2 \\
&= ∫_{-1}^1 x^2 f_X(x) \;dx \\
&= \frac{1}{2} \left[\frac{1}{3} x^3\right]_{-1}^1 \\
&= \frac{1}{2} \left(\frac{1}{3} + \frac{1}{3}\right) \\
&= \frac{1}{3}
\end{align*}$
"""

# ╔═╡ 73357970-ce64-4b66-9229-4814806fbeae
md"""
**(b)**

$\begin{align*}
\mu(X) &= ∫_{-1}^1 x f_X(x) \;dx \\
&= ∫_{-1}^1 x|x| \;dx \\
&= -∫_{-1}^0 x^2 \;dx + ∫_0^1 x^2 \;dx \\
&= -\left[\frac{1}{3} x^3\right]_{-1}^0 + \left[\frac{1}{3} x^3\right]_0^1 \\
&= -\frac{1}{3} + \frac{1}{3} \\
&= 0
\end{align*}$

$\begin{align*}
\sigma^2(X) &= \mu(X^2) - \mu(X)^2 \\
&= ∫_{-1}^1 x^2 |x| \;dx \\
&= -∫_{-1}^0 x^3 \;dx + ∫_0^1 x^3 \;dx \\
&= -\left[\frac{1}{4} x^4\right]_{-1}^0 + \left[\frac{1}{4} x^4\right]_0^1 \\
&= \frac{1}{4} + \frac{1}{4} \\
&= \frac{1}{2}
\end{align*}$
"""

# ╔═╡ 147f1d71-8f43-4236-af8e-80c806a9c588
md"""
**(c)**

$\begin{align*}
\mu(X) &= ∫_{-1}^1 x f_X(x) \;dx \\
&= ∫_{-1}^1 x(1 - |x|) \;dx \\
&= ∫_{-1}^0 x(1 + x) \;dx + ∫_0^1 x(1 - x) \;dx \\
&= ∫_{-1}^0 (x + x^2) \;dx + ∫_0^1 (x - x^2) \;dx \\
&= \left[\frac{1}{2} x^2 + \frac{1}{3} x^3\right]_{-1}^0 + \left[\frac{1}{2} x^2 - \frac{1}{3} x^3\right]_0^1 \\
&= -\left[\frac{1}{2} (-1)^2 + \frac{1}{3} (-1)^3\right] + \frac{1}{2} - \frac{1}{3} \\
&= -\frac{1}{2} + \frac{1}{3} + \frac{1}{2} - \frac{1}{3} \\
&= 0
\end{align*}$

$\begin{align*}
\sigma^2(X) &= \mu(X^2) - \mu(X)^2 \\
&= ∫_{-1}^1 x^2 f_X(x) \;dx \\
&= ∫_{-1}^0 x^2 (1 + x) \;dx + ∫_0^1 x^2 (1 - x) \;dx \\
&= ∫_{-1}^0 (x^2 + x^3) \;dx + ∫_0^1 (x^2 - x^3) \;dx \\
&= \left[\frac{1}{3} x^3 + \frac{1}{4} x^4\right]_{-1}^0 + \left[\frac{1}{3} x^3 - \frac{1}{4} x^4\right]_0^1 \\
&= -\left[\frac{1}{3} (-1)^3 + \frac{1}{4} (-1)^4\right] + \frac{1}{3} - \frac{1}{4} \\
&= \frac{1}{3} - \frac{1}{4} + \frac{1}{3} - \frac{1}{4} \\
&= \frac{1}{6}
\end{align*}$
"""

# ╔═╡ f0e7d2da-5c04-4376-ac59-48f74b20cb46
md"""
**(d)**

$\begin{align*}
\mu(X) &= ∫_{-1}^1 xf_X(x) \;dx \\
&= ∫_{-1}^1 x(3/2)x^2 \;dx \\
&= \frac{3}{2} \left[\frac{1}{4} x^4\right]_{-1}^1 \\
&= \frac{3}{2} \left(\frac{1}{4} - \frac{1}{4}\right) \\
&= 0
\end{align*}$

$\begin{align*}
\sigma^2(X) &= \mu(X^2) - \mu(X)^2 \\
&= \frac{3}{2} ∫_{-1}^1 x^4 \;dx \\
&= \frac{3}{2} \left[\frac{1}{5} x^5\right]_{-1}^1 \\
&= \frac{3}{2} \left(\frac{1}{5} + \frac{1}{5}\right) \\
&= \frac{3}{5}
\end{align*}$
"""

# ╔═╡ dc0b6393-0e29-46bf-bc95-28f5d220a9ca
md"""
### Exercise 6.3 #2

Let $X$ be a random variable with range $[-1, 1]$ and $f_X$ its density function.
Find $\mu(X)$ and $\sigma^2(X)$ if, for $|x| > 1$, $f_X(x) = 0$, and for $|x| < 1$,

(a) $f_X(x) = (3/4)(1 - x^2)$.

(b) $f_X(x) = (\pi/4)\cos(\pi x/2)$.

(c) $f_X(x) = (x + 1) / 2$.

(d) $f_X(x) = (3/8)(x + 1)^2$.
"""

# ╔═╡ 48aa0829-f278-4cce-963a-5e27cdc4d108
md"""
**(a)**

$\begin{align*}
\mu(X) &= ∫_{-1}^1 xf_X(x) \;dx \\
&= ∫_{-1}^1 x \left[(3/4)(1 - x^2)\right] \;dx \\
&= \frac{3}{4} ∫_{-1}^1 (x - x^3) \;dx \\
&= \frac{3}{4} \left[\frac{1}{2} x^2 - \frac{1}{4} x^4\right]_{-1}^1 \\
&= \frac{3}{4} \left[\frac{1}{2} - \frac{1}{4} - \frac{1}{2} + \frac{1}{4}\right] \\
&= 0
\end{align*}$

$\begin{align*}
\sigma^2(X) &= \mu(X^2) - \mu(X)^2 \\
&= ∫_{-1}^1 x^2 f_X(x) \;dx \\
&= \frac{3}{4} ∫_{-1}^1 (x^2 - x^4) \;dx \\
&= \frac{3}{4} \left[\frac{1}{3} x^3 - \frac{1}{5} x^5\right]_{-1}^1 \\
&= \frac{3}{4} \left[\frac{1}{3} - \frac{1}{5} + \frac{1}{3} - \frac{1}{5}\right] \\
&= \frac{3}{4} \left(\frac{4}{15}\right) \\
&= \frac{1}{5}
\end{align*}$
"""

# ╔═╡ 72af4048-3d38-47ce-bc45-79c7a122ccce
md"""
**(b)**

$\begin{align*}
\mu(X) &= ∫_{-1}^1 x f_X(x) \;dx \\
&= ∫_{-1}^1 x(\pi / 4) \cos{(\pi x / 2)} \;dx \\
&= \frac{\pi}{4} ∫_{-1}^1 x \cos{(\pi x / 2)} \;dx \\
&= 0
\end{align*}$

$\begin{align*}
\sigma^2(X) &= ∫_{-1}^1 x^2 f_X(x) \;dx \\
&= \frac{\pi}{4} ∫_{-1}^1 x^2 \cos{(\pi x / 2)} \;dx \\
&= \frac{\pi^2 - 8}{\pi^2}
\end{align*}$
"""

# ╔═╡ 5f212384-7cf1-4659-aae3-b8a8a4d767da
md"""
### Exercise 6.3 #4

Let $X$ be a random variable with range $[-1, 1]$ and density function $f_X(x) = ax + b$ if $|x| < 1$.

(a) Show that if $∫_{-1}^{+1} f_X(x) \;dx = 1$, then $b = 1/2$.

(b) Show that if $f_X(x) ≥ 0$, then $-1/2 ≤ a ≤ 1/2$.

(c) Show that $\mu = (2/3)a$, and hence that $-1/3 ≤ \mu ≤ 1/3$.

(d) Show that $\sigma^2(X) = (2/3)b - (4/9)a^2 = 1/3 - (4/9)a^2$.
"""

# ╔═╡ f57182dd-e38d-42f8-b98d-c2afb1890848
md"""
### Exercise 6.3 #9

Let $X$, $Y$, and $Z$ be independent random variables, each with mean $\mu$ and variance $\sigma^2$.

(a) Find the expected value and variance of $S = X + Y + Z$.

(b) Find the expected value and variance of $A = (1/3)(X + Y + Z)$.

(c) Find the expected value of $S^2$ and $A^2$.
"""

# ╔═╡ 6e5aa17d-66ae-4dac-881e-f674b1029de1
md"""
**(a)**

$E(S) = E(X) + E(Y) + E(Z) = 3\mu \qquad V(S) = V(X) + V(Y) + V(Z) = 3\sigma^2$
"""

# ╔═╡ c6eff89e-a123-4aaf-aeb3-903a27723034
md"""
### Exercise 7.1 #1

A die is rolled three times.
Find the probability that the sum of the outcomes is

(a) greater than 9.

(b) an odd number.
"""

# ╔═╡ c289f7a5-9ffc-4483-ae74-4267bca6fff6
let
	Ωx = 1:6
	ΩS2 = Ωz(Ωx, Ωx) do X, Y X + Y end
	ΩS3 = Ωz(ΩS2, Ωx) do X, Y X + Y end
	
	pX(x) = x ∈ Ωx ? 1//6 : 0
	S2(k) = k ∈ ΩS2 ? Dict([k => pZ(k, pX, pX, Ωx) for k ∈ ΩS2])[k] : 0
	S3(k) = k ∈ ΩS3 ? Dict([k => pZ(k, S2, pX, ΩS2) for k ∈ ΩS3])[k] : 0
	[
		:a => sum([S3(i) for i ∈ 10:last(ΩS3)]),
		:b => sum([S3(i) for i ∈ ΩS3[isodd.(ΩS3)]])
	]
end

# ╔═╡ 016e496d-27be-45af-a1c1-134c64935254
md"""
### Exercise 7.1 #2

The price of a stock on a given trading day changes according to the distribution

$p_X = \begin{pmatrix} -1 & 0 & 1 & 2 \\ 1/4 & 1/2 & 1/8 & 1/8 \end{pmatrix}.$

Find the distribution for the change in stock price after two (independent) trading days.
"""

# ╔═╡ b4f89164-78c0-473b-832f-7d730dae6862
md"""
$Y = X_1$

$Z = X + Y$

$\begin{align*}
p_Z(k) &= \sum_{i=-∞}^∞ p_X(i) p_Y(k - i) \\
&= \sum_{i=-1}^2 p_X(i) p_Y(k - i) \\
&= p_X(-1) p_Y(k + 1) + p_X(0) p_Y(k) + p_X(1) p_Y(k - 1) + p_X(2) p_Y(k - 2)
\end{align*}$

$Z ∈ \{-2, -1, 0, 1, 2, 3, 4\}$

$\begin{align*}
p_Z(-2) &= p_X(-1) p_Y(-2 + 1) + p_X(0) p_Y(-2) + p_X(1) p_Y(-2 - 1) + p_X(2) p_Y(-2 - 2) = \frac{1}{16} \\
p_Z(-1) &= p_X(-1) p_Y(-1 + 1) + p_X(0) p_Y(-1) + p_X(1) p_Y(-1 - 1) + p_X(2) p_Y(-1 - 2) = \frac{1}{4} \\
p_Z(0) &= p_X(-1) p_Y(0 + 1) + p_X(0) p_Y(0) + p_X(1) p_Y(0 - 1) + p_X(2) p_Y(0 - 2) = \frac{5}{16} \\
p_Z(1) &= p_X(-1) p_Y(1 + 1) + p_X(0) p_Y(k) + p_X(1) p_Y(1 - 1) + p_X(2) p_Y(1 - 2) = \frac{3}{16} \\
p_Z(2) &= p_X(-1) p_Y(2 + 1) + p_X(0) p_Y(2) + p_X(1) p_Y(2 - 1) + p_X(2) p_Y(2 - 2) = \frac{9}{64} \\
p_Z(3) &= p_X(-1) p_Y(3 + 1) + p_X(0) p_Y(3) + p_X(1) p_Y(3 - 1) + p_X(2) p_Y(3 - 2) = \frac{1}{32} \\
p_Z(4) &= p_X(-1) p_Y(4 + 1) + p_X(0) p_Y(4) + p_X(1) p_Y(4 - 1) + p_X(2) p_Y(4 - 2) = \frac{1}{64}
\end{align*}$
"""

# ╔═╡ bcd27557-27b4-42f5-aa73-61ef72e15e4a
let
	Ωx = -1:2
	
	pX(x) = if x == -1
		1//4
	elseif x == 0
		1//2
	elseif x == 1
		1//8
	elseif x == 2
		1//8
	else
		0
	end
	pY(y) = pX(y)
	
	[k => pZ(k, pX, pY, Ωx) for k ∈ Ωz(Ωx, Ωx) do X, Y X + Y end]
end

# ╔═╡ ee9f80ea-8393-48bc-8050-41a636a8d545
md"""
### Exercise 7.1 #3

Let $X_1$ and $X_2$ be independent random variables with common distribution

$p_X = \begin{pmatrix} 0 & 1 & 2 \\ 1/8 & 3/8 & 1/2 \end{pmatrix} .$

Find the distribution of the sum $X_1 + X_2$.
"""

# ╔═╡ f6fd0afb-5235-4989-be28-6d11dee51f24
md"""
$Z = X_1 + X_2$

$\begin{align*}
p_Z(k) &= \sum_{i = -∞}^{∞} p_X(i) p_X(k - i) \\
&= \sum_{i = 0}^2 p_X(i) p_X(k - i) \\
&= p_X(0) p_X(k - 0) + p_X(1) p_X(k - 1) + p_X(2) p_X(k - 2)
\end{align*}$

$Ω_Z = \{0, 1, 2, 3, 4\}$

$\begin{align*}
p_Z(0) &= p_X(0) p_X(0 - 0) + p_X(1) p_X(0 - 1) + p_X(2) p_X(0 - 2) = \frac{1}{64} \\
p_Z(1) &= p_X(0) p_X(1 - 0) + p_X(1) p_X(1 - 1) + p_X(2) p_X(1 - 2) = \frac{3}{32} \\
p_Z(2) &= p_X(0) p_X(2 - 0) + p_X(1) p_X(2 - 1) + p_X(2) p_X(2 - 2) = \frac{17}{64} \\
p_Z(3) &= p_X(0) p_X(3 - 0) + p_X(1) p_X(3 - 1) + p_X(2) p_X(3 - 2) = \frac{3}{8} \\
p_Z(4) &= p_X(0) p_X(4 - 0) + p_X(1) p_X(4 - 1) + p_X(2) p_X(4 - 2) = \frac{1}{4}
\end{align*}$
"""

# ╔═╡ 8e28063d-2d22-49af-b8d7-02d688f70a94
let
	Ωx = 0:2
	
	pX(x) = if x == 0
		1//8
	elseif x == 1
		3//8
	elseif x == 2
		1//2
	else
		0
	end
	
	[k => pZ(k, pX, pX, Ωx) for k ∈ Ωz(Ωx, Ωx) do X1, X2 X1 + X2 end]
end

# ╔═╡ 819bdbc6-48aa-41d9-adee-749c3713a9a4
md"""
### Exercise 7.1 #4

In one play of a certain game you win an amount $X$ with distribution

$p_X = \begin{pmatrix} 1 & 2 & 3 \\ 1/4 & 1/4 & 1/2 \end{pmatrix}.$

Using the program **NFoldConvolution** find the distribution for your total winnings after ten (independent) plays.
Plot this distribution.
"""

# ╔═╡ 94b3ccf0-520b-4bc2-8848-02ee1128ade8
let
	Ωx = 1:3
	ΩSX(Ω1, Ω2, k) = (k ≤ 2
		? Ωz(Ω1, Ω2) do X, Y X + Y end
		: ΩSX(Ωz(Ω1, Ω2) do X, Y X + Y end, Ω2, k - 1))
	
	ΩSx = Dict([i => ΩSX(Ωx, Ωx, i) for i ∈ 1:10])
	
	pX(x) = if x ∈ 1:2
		1//4
	elseif x == 3
		1//2
	else
		0
	end
	
	S(k, N, sX) = k ∈ ΩSx[N] ? Dict([k => pZ(k, sX, pX, ΩSx[N - 1]) for k ∈ ΩSx[N]])[k] : 0
	[k => S(k, 2, pX) for k ∈ ΩSx[2]]
end

# ╔═╡ 8b707518-5212-46a5-a6f4-590ef87c1dc6
md"""
### Exercise 7.1 #5

Consider the following two experiments: the first has outcome $X$ taking on the values 0, 1, and 2 with equal probabilities; the second results in an (independent) outcome $Y$ taking on the value 3 with probability 1/4 and 4 with probability 3/4.

Find the distribution of

(a) $Y + X$.

(b) $Y - X$.
"""

# ╔═╡ b0c22deb-b629-44fe-b3c5-1ecd21a9893f
md"""
**(a)**

$X ∈ \{0,1,2\}$

$Y ∈ \{3, 4\}$

$Z = Y + X$

$\begin{align*}
p_Z(k) &= \sum_{i = -∞}^{∞} p_Y(i) p_X(k - i) \\
&= \sum_{i = 3}^4 p_Y(i) p_X(k - i) \\
&= p_Y(3) p_X(k - 3) + p_Y(4) p_X(k - 4)
\end{align*}$

$Z ∈ \{3,4,5,6\}$

$\begin{align*}
p_Z(3) &= p_Y(3) p_X(3 - 3) + p_Y(4) p_X(3 - 4) = \frac{1}{12} \\
p_Z(4) &= p_Y(3) p_X(4 - 3) + p_Y(4) p_X(4 - 4) = \frac{1}{3} \\
p_Z(5) &= p_Y(3) p_X(5 - 3) + p_Y(4) p_X(5 - 4) = \frac{1}{3} \\
p_Z(6) &= p_Y(3) p_X(6 - 3) + p_Y(4) p_X(6 - 4) = \frac{1}{4}
\end{align*}$
"""

# ╔═╡ 258533bc-338e-405f-bc8e-cf58102c0f98
let
	Ωx = 0:2
	Ωy = 3:4
	
	pX(x) = x ∈ Ωx ? 1//3 : 0
	pY(y) = if y == 3
		1//4
	elseif y == 4
		3//4
	else
		0
	end
	
	[k => pZ(k, pY, pX, Ωy) for k ∈ Ωz(Ωy, Ωx) do Y, X Y + X end]
end

# ╔═╡ 111dcc21-24c1-4f3c-8488-35a0a9dfac4d
md"""
**(b)**

$Z = Y - X \implies Z = Y + (-X)$

$-X ∈ \{-2, -1, 0\}$

$p_{(-X)}(x) = \begin{cases}
\frac{1}{3} &\text{if } x ∈ \{-2, -1, 0\} \\
0 &\text{otherwise}
\end{cases}$

$\begin{align*}
p_Z(k) &= \sum_{i = -∞}^{∞} p_Y(i) p_{(-X)}(k - i) \\
&= \sum_3^4 p_Y(i) p_{(-X)}(k - i) \\
&= p_Y(3) p_{(-X)}(k - 3) + p_Y(4) p_{(-X)}(k - 4)
\end{align*}$

$Z ∈ \{1, 2, 3, 4\}$

$\begin{align*}
p_Z(1) &= p_Y(3) p_{(-X)}(1 - 3) + p_Y(4) p_{(-X)}(1 - 4) = \frac{1}{12} \\
p_Z(2) &= p_Y(3) p_{(-X)}(2 - 3) + p_Y(4) p_{(-X)}(2 - 4) = \frac{1}{3} \\
p_Z(3) &= p_Y(3) p_{(-X)}(3 - 3) + p_Y(4) p_{(-X)}(3 - 4) = \frac{1}{3} \\
p_Z(4) &= p_Y(3) p_{(-X)}(4 - 3) + p_Y(4) p_{(-X)}(4 - 4) = \frac{1}{4}
\end{align*}$
"""

# ╔═╡ b68b331b-3406-4beb-9b38-6b28c737563c
let
	Ωx = -(0:2)
	Ωy = 3:4
	
	pX(x) = x ∈ Ωx ? 1//3 : 0
	pY(y) = if y == 3
		1//4
	elseif y == 4
		3//4
	else
		0
	end
	
	[k => pZ(k, pX, pY, Ωx) for k ∈ Ωz(Ωx, Ωy) do X, Y Y + X end]
end

# ╔═╡ 49b09e56-902b-46a1-b25e-99fdaaf88d5b
md"""
### Exercise 7.2 #2

Let $X$ and $Y$ be independent random variables defined on the space $Ω$, with density functions $f_X$ and $f_Y$, respectively.
Suppose that $Z = X + Y$.
Find the density $f_Z$ of $Z$ if

(a)

$f_X(x) = f_Y(x) = \begin{cases} 1/2, &\text{if } -1 ≤ x ≤ +1, \\ 0, &\text{otherwise.} \end{cases}$

(b)

$f_X(x) = f_Y(x) = \begin{cases} 1/2, &\text{if } 3 ≤ x ≤ 5, \\ 0, &\text{otherwise.} \end{cases}$

(c)

$f_X(x) = \begin{cases} 1/2, &\text{if } -1 ≤ x ≤ 1, \\ 0, &\text{otherwise.} \end{cases}$

$f_Y(x) = \begin{cases} 1/2, &\text{if } 3 ≤ x ≤ 5, \\ 0, &\text{otherwise.} \end{cases}$

(d) What can you say about the set $E = \{ z : f_Z(z) > 0 \}$ in each case?
"""

# ╔═╡ b75188db-f025-4218-8721-09bb78e23657
md"""
**(a)**

$\begin{align*}
f_Z(z) = (f_X ∗ f_Y)(z) &= ∫_{-∞}^{+∞} f_X(z - y) f_Y(y) \;dy \\
&= \frac{1}{2} ∫_{-1}^1 f_X(z - y) \;dy \\
&= \frac{1}{4} ∫_{-2}^x \;dy \\
&= \frac{z + 2}{4} \qquad \text{if } -2 ≤ z ≤ 0
\end{align*}$
"""

# ╔═╡ 1cf51b19-8357-47cf-8a7c-6b680ed0d48b
let
	fZ(z) = if -2 ≤ z ≤ 0
		(z + 2) / 4
	elseif 0 ≤ z ≤ 2
		(2 - z) / 4
	else
		0
	end
	
	plot(fZ)
end

# ╔═╡ 5a787284-628d-4892-ab8d-15694393566b
md"""
### Exercise 7.2 #3
"""

# ╔═╡ 4849321b-9af8-4f2e-9b21-61c4df7823c4
md"""
### Exercise 7.2 #5
"""

# ╔═╡ 9cfb1366-e5dc-4c33-acf6-96a424640c59
md"""
### Exercise 8.1 #1

A fair coin is tossed 100 times.
The expected number of heads is 50, and the standard deviation for the number of heads is $(100 ⋅ 1/2 ⋅ 1/2)^{1/2} = 5$.
What does Chebyshev's Inequality tell you about the probability that the number of heads that turn up deviates from the expected number 50 by three or more standard deviations (i.e., by at least 15)?
"""

# ╔═╡ db4022e1-e57c-4397-a735-66439d8e246b
md"""
$P(|X - \mu| ≥ \epsilon) ≤ \frac{V(X)}{\epsilon^2}$

Let $\epsilon = k\sigma$.

$P(|X - \mu| ≥ k\sigma) ≤ \frac{\sigma^2}{k^2 \sigma^2} = \frac{1}{k^2}$

$P(|X - 50| ≥ 15) ≤ \frac{1}{9}$
"""

# ╔═╡ f3a22c42-5fe7-46b8-8d57-78d4c1fba6a8
md"""
### Exercise 8.1 #2

Write a program that uses the function binomial($n, p, x$) to compute the exact
probability that you estimated in Exercise 1.
Compare the two results.
"""

# ╔═╡ bce0f193-2023-4a7b-8042-a0d56ec80a51
md"""
### Exercise 8.1 #4

A 1-dollar bet on craps has an expected winning of -.0141.
What does the Law of Large Numbers say about your winnings if you make a large number of 1-dollar bets at the craps table?
Does it assure you that your losses will be small?
Does it assure you that if $n$ is very large you will lose?
"""

# ╔═╡ 97449c05-1d81-44b2-8960-962eb7c706ae
md"It does not assure either."

# ╔═╡ 2dec1cfd-70ea-4ce3-8af5-97b37f6ef4cd
md"""
### Exercise 8.1 #5

Let $X$ be a random variable with $E(X) = 0$ and $V(X) = 1$.
What integer value $k$ will assure us that $P(|X| ≥ k) ≤ .01$?
"""

# ╔═╡ da441abf-70fb-428b-86e0-7d0ab49185a7
md"$\frac{1}{k^2} = \frac{1}{100} \implies k = 10$"

# ╔═╡ c3918cf4-bc7c-41a1-a1dc-7ef775362e06
md"""
### Exercise 8.1 #6

Let $S_n$ be the number of successes in $n$ Bernoulli trials with probability $p$ for success on each trial.
Show, using Chebyshev's Inequality, that for any $\epsilon > 0$

$P\left(\left|\frac{S_n}{n} - p\right| ≥ \epsilon\right) ≤ \frac{p(1 - p)}{n\epsilon^2}\;.$
"""

# ╔═╡ 66a13a54-201c-43a0-af84-b8103ab52098
md"""
The variance of the average number of successes $V(A_n) = V\left(\frac{S_n}{n}\right)$ for $n$ Bernoulli trials is given by

$\frac{pq}{n}\;.$

Thus,

$\begin{align*}
P\left(\left|\frac{S_n}{n} - p\right| ≥ \epsilon\right) &≤ \frac{V(X)}{\epsilon^2} \\
&≤ \frac{p(1 - p)}{n\epsilon^2}\;
\end{align*}$
"""

# ╔═╡ 953284bc-1595-4a31-9199-6cf4e042a7c9
md"""
### Exercise 8.1 #7

Find the maximum possible value for $p(1 - p)$ if $0 < p < 1$.
Using this result and Exercise 6, show that the estimate

$P\left(\left|\frac{S_n}{n} - p\right| ≥ \epsilon\right) ≤ \frac{1}{4n\epsilon^2}$

is valid for any $p$.
"""

# ╔═╡ a96f3849-5e60-4cd5-a8e8-da9fc4a2bba2
md"""
The maximum possible value for $p(1 - p)$ occurs when $p = 0.5$.
Thus, the maximum possible value for

$P\left(\left|\frac{S_n}{n} - p\right| ≥ \epsilon\right)$

is

$\frac{1}{4n \epsilon^2}\;.$

i.e., the provided inequality is valid for any $p ∈ (0, 1)$.
"""

# ╔═╡ 563db2e8-987e-442e-98de-6479518728b0
md"""
### Exercise 8.2 #1

Let $X$ be a continuous random variable with mean $\mu = 10$ and variance $\sigma^2 = 100 / 3$.
Using Chebyshev's Inequality, find an upper bound for the following probabilities.

(a) $P(|X - 10| ≥ 2)$.

(b) $P(|X - 10| ≥ 5)$.

(c) $P(|X - 10| ≥ 9)$.

(d) $P(|X - 10| ≥ 20)$.
"""

# ╔═╡ 09f1bfc5-e551-4d74-970f-5d04a2186fda
md"""
$P(|X - \mu| ≥ \epsilon) ≤ \frac{\sigma^2}{\epsilon^2}$

**(a)**

$P(|X - 10| ≥ 2) ≤ \frac{100}{3(2)^2} = \frac{25}{3} → 1$

**(b)**

$P(|X - 10| ≥ 5) ≤ \frac{100}{3(5)^2} = \frac{4}{3} → 1$

**(c)**

$P(|X - 10| ≥ 9) ≤ \frac{100}{3(9)^2} = \frac{100}{243}$

**(d)**

$P(|X - 10| ≥ 20) ≤ \frac{100}{3(20)^2} = \frac{1}{12}$
"""

# ╔═╡ 0f8db65d-3bd6-4857-af05-12758c6d35f9
md"""
### Exercise 8.2 #2

Let $X$ be a continuous random variable with values uniformly distributed over the interval $[0, 20]$.

(a) Find the mean and variance of $X$.

(b) Calculate $P(|X - 10| ≥ 2)$, $P(|X - 10| ≥ 5)$, $P(|X - 10| ≥ 9)$, and $P(|X - 10| ≥ 20)$ exactly.
How do your answers compare with those of Exercise 1?
How good is Chebyshev's Inequality in this case?
"""

# ╔═╡ 1ae1ce40-b927-416e-b16c-90217279beb2
md"""
**(a)**

$\mu = ∫_{-∞}^{+∞} xf(x) \;dx = ∫_0^{20} x ⋅ \frac{1}{20} \;dx = \frac{20^2}{2} ⋅ \frac{1}{20} = 10$

$\sigma^2 = ∫_0^{20} x^2 ⋅ \frac{1}{20} \;dx - \mu^2 = \frac{(20)^3}{3} ⋅ \frac{1}{20} - 100 = \frac{400}{3} - \frac{300}{3} = \frac{100}{3}$

**(b)**

$P(|X - 10| ≥ 2) = P(X ≤ 8) + P(X ≥ 12) = \frac{4}{5}$

$P(|X - 10| ≥ 5) = P(X ≤ 5) + P(X ≥ 15) = \frac{1}{2}$

$P(|X - 10| ≥ 9) = P(X ≤ 1) + P(X ≥ 19) = \frac{1}{10}$

$P(|X - 10| ≥ 20) = P(X ≤ -10) + P(X ≥ 30) = 0$

The answers agree with the inequalities in Exercise 1.
Chebyshev's Inequality holds, however does not give bounds very accurate to the answer.
"""

# ╔═╡ b5bc13e4-cafc-4d9d-9d05-4c4cfa8c26c6
md"""
### Exercise 8.2 #3

Let $X$ be the random variable of Exercise 2.

(a) Calculate the function $f(x) = P(|X - 10| ≥ x)$.

(b) Now graph the function $f(x)$, and on the same axes, graph the Chebyshev function $g(x) = 100/(3x^2)$.
Show that $f(x) ≤ g(x)$ for all $x > 0$, but that $g(x)$ is not a very good approximation for $f(x)$.
"""

# ╔═╡ cb04922b-af75-4aa4-b1f1-600807cb6626
md"""
**(a)**

$f(x) = 1 - \frac{x}{10}$

**(b)**
"""

# ╔═╡ c63acbd4-9b53-4b80-a6b7-d38f603e94b7
let
	x = 0:0.01:10
	f(x) = 1 - x/10
	g(x) = 100 / (3x^2)
	
	plot(x, f.(x), label="f(x)")
	plot!(x, g.(x), ylim=[0,1], label="g(x)")

end

# ╔═╡ 27f64b77-be9e-41c9-8915-12e5849c249f
md"""
### Exercise 9.1 #1

Let $S_{100}$ be the number of heads that turn up in 100 tosses of a fair coin.
Use the Central Limit Theorem to estimate

(a) $P(S_{100} ≤ 45)$

(b) $P(45 ≤ S_{100} ≤ 55)$

(c) $P(S_{100} > 63)$

(d) $P(S_{100} < 57)$
"""

# ╔═╡ 2ee2a5cd-7688-41b9-bbed-824fbf606d89
md"""
**(a)** 

$\begin{align*}
P\left(a ≤ \frac{S_n - np}{\sqrt{npq}} ≤ b\right) &≈ P\left(\frac{-0.5 - 50}{5} ≤ S_n^* ≤ \frac{45.5 - 50}{5}\right) \\
&= P(-10 ≤ S_n^* ≤ -1) \\
&≈ \text{NA}(-10.1,-0.9) \\
&= \text{NA}(0.9, 10.1) \\
&= .5 - .3159 \\
&= .1841
\end{align*}$
"""

# ╔═╡ f11db5a3-22df-45cb-91d3-1457515e15b5
md"""
**(b)**

$\begin{align*}
P\left(a ≤ \frac{S_n - np}{\sqrt{npq}} ≤ b\right) &≈ P\left(\frac{45.5 - 50}{5} ≤ S_n^* ≤ \frac{54.5 - 50}{5}\right) \\
&= P(-1 ≤ S_n^* ≤ 1) \\
&≈ \text{NA}(-0.9, 0.9) \\
&= 2\text{NA}(0,0.9) \\
&= 2(.3159) \\
&= 0.6318
\end{align*}$
"""

# ╔═╡ 95aa3b6d-3d23-44bf-9a37-cd6014f1e072
md"""
**(c)**

$\begin{align*}
P\left(a ≤ \frac{S_n - np}{\sqrt{npq}} ≤ b\right) &≈ P\left(\frac{63.5 - 50}{5} ≤ S_n^* ≤ \frac{100.5 - 50}{5}\right) \\
&= P\left(2.7 ≤ S_n^* ≤ 10.5\right) \\
&≈ \text{NA}\left(2.7, 10.5\right) \\
&= .5 - .4965 \\
&= 0.0035
\end{align*}$
"""

# ╔═╡ 923a0b12-73fd-415b-a989-2414c879a4b8
md"""
**(d)**

$\begin{align*}
P\left(a ≤ \frac{S_n - np}{\sqrt{npq}} ≤ b\right) &≈ P\left(\frac{0.5 - 50}{5} ≤ S_n^* ≤ \frac{56.5 - 50}{5}\right) \\
&= P(-9.9 ≤ S_n^* ≤ 1.3) \\
&≈ \text{NA}(-9.9, 1.3) \\
&= .5 + .4032 \\
&= .9032
\end{align*}$
"""

# ╔═╡ 09a9075d-dd72-493a-9046-d087f1ddbef6
md"""
### Exercise 9.1 #2

Let $S_{200}$ be the number of heads that turn up in 200 tosses of a fair coin.
Estimate

(a) $P(S_{200} = 100)$.

(b) $P(S_{200} = 90)$.

(c) $P(S_{200} = 80)$.
"""

# ╔═╡ 6aae4c8c-854d-401e-92c4-71e75070e3d3
md"""
$np = 100$

$\sqrt{npq} = \sqrt{50} = 5 \sqrt{2}$

$x_j = \frac{j - np}{\sqrt{npq}}$

$b(n,p,j) ≈ \frac{\phi(x_j)}{\sqrt{npq}}$
"""

# ╔═╡ ce251561-f8bb-442c-a796-adfe31c49f42
md"""
**(a)**

$x_{100} = \frac{100 - 100}{5 \sqrt{2}} = 0$

$P(S_{200} = 100) = \frac{\phi(0)}{5 \sqrt{2}} = \frac{1}{10 \sqrt{\pi}} ≈ 0.0564$
"""

# ╔═╡ baaeeb7d-ba48-4922-8a71-26f7a62bfbf6
1 / 10sqrt(π)

# ╔═╡ 2c8604e2-fa43-4f67-bfb9-6b895d6033a3
md"""
**(b)**

$x_{90} = \frac{90 - 100}{5\sqrt{2}} = \frac{-10}{5\sqrt{2}} = -\frac{2}{\sqrt{2}}$

$P(S_{200} = 90) = \frac{\phi\left(-\frac{2}{\sqrt{2}}\right)}{5 \sqrt{2}} = \frac{10}{\sqrt{\pi}} e ≈ 0.0208$
"""

# ╔═╡ e40d957c-8732-409e-b638-002ca8f6e56d
exp(-1/2) / 10sqrt(π)

# ╔═╡ 3e48163f-7381-44e3-aed4-01125f78330c
md"""
**(c)**

$x_{80} = \frac{80 - 100}{5 \sqrt{2}} = \frac{-20}{5 \sqrt{2}} = -\frac{4}{\sqrt{2}}$

$P(S_{200} = 80) = \frac{\phi\left(-\frac{4}{\sqrt{2}}\right)}{5\sqrt{2}} ≈ 0.001033$
"""

# ╔═╡ f8c5511c-322e-463f-8afa-30998d3cf8fd
pdf(Normal(), -4/√2) / (5*√2)

# ╔═╡ d8ac627f-a34d-4a63-b5df-0bc26847aba2
# Simulation

let
	X = 80
	N = 100000
	
	sum([sum(rand(Bernoulli(), 200)) == X for n ∈ 1:N]) / N
end

# ╔═╡ c2681e2b-bff6-458a-af5d-8e71fa67df10
md"""
### Exercise 9.1 #3

A true-false examination has 48 questions.
June has probability 3/4 of answering a question correctly.
April just guesses on each question.
A passing score is 30 or more correct answers.
Compare the probability that June passes the exam with the probability that April passes it.
"""

# ╔═╡ 00c4bb71-3fe5-4d8d-8b1d-a339a195d7d2
md"""
**June**

$np = 36$

$\sqrt{npq} = \sqrt{9} = 3$

$\begin{align*}
P\left(a ≤ \frac{S_n - np}{\sqrt{npq}} ≤ b\right) &≈ P\left(\frac{29.5 - 36}{3} ≤ S_n^* ≤ \frac{48.5 - 36}{3}\right) \\
&= P(-2.17 ≤ S_n^* ≤ 4.17) \\
&≈ \text{NA}(0,2.17) + \text{NA}(0,4.17) \\
&= .4850 + .5 \\
&= 0.985
\end{align*}$
"""

# ╔═╡ c340683b-c7f7-435a-a246-8ac0125fa448
md"""
**April**

$np = 24$

$\sqrt{npq} = \sqrt{12} = 2 \sqrt{3}$

$\begin{align*}
P\left(a ≤ \frac{S_n - np}{\sqrt{npq}} ≤ b\right) &≈ P\left(\frac{29.5 - 24}{2 \sqrt{3}} ≤ S_n^* ≤ \frac{48.5 - 24}{2 \sqrt{3}}\right) \\
&= P(1.59 ≤ S_n^* ≤ 7.07) \\
&≈ \text{NA}(1.59, 7.07) \\
&= .5 - .4441 \\
&= 0.056
\end{align*}$
"""

# ╔═╡ 3a9e6f6b-9e76-4ba8-b57d-1f93f084c410
md"""
### Exercise 9.2 #1

A die is rolled 24 times.
Use the Central Limit Theorem to estimate the probability that

(a) the sum is greater than 84.

(b) the sum is equal to 84.
"""

# ╔═╡ e73d6242-17a5-4ae4-ae57-51badc97f5b8
let
	X = 1:6
	p = 1//6
	E(X) = sum([p * x for x ∈ X])
	μ = E(X)
	σ² = E(X.^2) - μ^2
	
	24μ, 24σ²
end

# ╔═╡ 5c4f7b17-5023-4f32-b7f8-a6ed43b09e22
10.5 / 10

# ╔═╡ 1bc77972-b409-4331-ba78-4d1cbcfd1477
md"""
$E(X_j) = \frac{7}{2}$

$V(X_j) = \frac{35}{12}$

$\mu(S_{24}) = 24 ⋅ \frac{7}{2} = 84$

$\sigma^2(S_{24}) = 24 ⋅ \frac{35}{12} = 70$

$\sigma(S_{24}) = \sqrt{70}$
"""

# ╔═╡ d216cc8c-d902-4d30-a9ba-e437db46c4e9
md"""
**(a)**

$\begin{align*}
P(S_{24} > 84) &≈ P\left(\frac{83.5 - 84}{\sqrt{70}} ≤ S_n^* ≤ \frac{144.5 - 84}{\sqrt{70}}\right) \\
&= P(-0.06 ≤ S_n^* ≤ 7.11) \\
&≈ \text{NA}(-0.06, 7.11) = 0.5238
\end{align*}$
"""

# ╔═╡ 14e852ca-23f7-49df-8b4a-e09616707686
# Simulation

let
	count = 0
	N = 100000
	for n ∈ 1:N
		if 84 ≤ sum(rand(1:6, 24)) ≤ 144
			count += 1
		end
	end

	count / N
end

# ╔═╡ b3f4791f-fc35-4623-b7fd-1e41ca0003f8
let
	μ = 84
	σ² = 70
	σ = sqrt(σ²)
	a = 84
	b = 144
	α = (a - 0.5 - μ) / σ
	β = (b + 0.5 - μ) / σ
	cdf(Normal(), β) - cdf(Normal(), α)
end

# ╔═╡ 34aa805f-a8f1-4126-a867-b04dd6c26fa6
# Using Normal table
0.5 + 0.0239

# ╔═╡ f21db93e-4d2c-40d4-b10e-b525801a3f32
md"""
**(b)**

$x_j = \frac{j - n\mu}{\sqrt{n\sigma^2}} = \frac{84 - 24(7/2)}{\sqrt{24(35/12)}} = 0$

$\begin{align*}
P(S_{24} = 84) &∼ \frac{\phi(x_j)}{\sqrt{n\sigma^2}} = 0.0477
\end{align*}$
"""

# ╔═╡ f02775cd-1161-444d-be05-c1fc15ea53df
let
	j = 84
	n = 24
	μ = 7//2
	σ² = 35//12
	
	xⱼ = (j - n*μ) / sqrt(n*σ²)
	P84 = pdf(Normal(), 0) / sqrt(n*σ²)
end

# ╔═╡ 21a2020c-335f-448c-a9c1-4e75ed534280
md"""
### Exercise 9.2 #2

A random walker starts at 0 on the $x$-axis and at each time unit moves 1 step to the right or 1 step to the left with probability 1/2.
Estimate the probability that, after 100 steps, the walker is more than 10 steps from the starting position.
"""

# ╔═╡ 50262e09-aee4-4132-8c54-18ec40ff6293
# Simulation

let
	count = 0
	N = 10000
	for i ∈ 1:N
		if abs(sum(rand([-1, 1], 100))) > 10
			count += 1
		end
	end
	count / N
end

# ╔═╡ a73f6df9-8af6-438e-ac2f-3a47369f6155
let
	X = [-1,1]
	E(X) = sum([x/2 for x ∈ X])
	μ = E(X)
	μ = 100μ
	σ² = E(X.^2) - μ^2
	σ² = 100σ²
	σ = sqrt(σ²)
	a = 11
	b = 100
	α = (a - μ) / σ
	β = (b - μ) / σ
	P1 = cdf(Normal(), β) - cdf(Normal(), α)
	P2 = cdf(Normal(), -α) - cdf(Normal(), -β)
	P1 + P2
end

# ╔═╡ 730a2396-6336-4477-a477-cbf252b4b50b
md"""
$p_X = \begin{pmatrix} -1 & 1 \\ 1/2 & 1/2 \end{pmatrix}$

$E(X_j) = 0$

$V(X_j) = 1$

$\mu(S_{100}) = 0$

$\sigma^2(S_{100}) = 100$

$\sigma = 10$

$P(S_{100} > 10) ≈ P\left(\frac{-100}{10} ≤ S_n^* ≤ \frac{-11}{10}\right) + P\left(\frac{11}{10} ≤ S_n^* ≤ \frac{100}{10}\right) = 0.2713$
"""

# ╔═╡ 3e11e6cf-f273-46a3-a191-59f20bb39d70
md"""
### Exercise 9.3 #10

A surveyor is measuring a height of a cliff known to be about 1000 feet.
He assumes his instrument is properly calibrated and that his measurement errors are independent, with mean $\mu = 0$ and variance $\sigma^2 = 10$.
He plans to take $n$ measurements and form the average.
Estimate, using (a) Chebeyshev's inequality and (b) the normal approximation, how large $n$ should be if he wants to be 95 percent sure that his average falls within 1 foot of the true value.
Now estimate, using (a) and (b), what value should $\sigma^2$ have if he wants to make only 10 measurements with the same confidence?
"""

# ╔═╡ 059be845-9c40-483d-8e2b-359e67f40cdc
md"""
**(a)**

$\sigma^2 = \frac{10}{n} \implies \sigma = \sqrt{\frac{10}{n}}$

$k\sigma = 1 \implies k\sqrt{\frac{10}{n}} = 1 \implies n = 10k^2$

$P\left(\left|\frac{S_n}{n} - \mu\right| > k\sigma\right) ≤ \frac{1}{k^2}$

$\begin{align*}
&\implies \frac{1}{k^2} = .05 \\
&\implies k = \sqrt{20} = 2\sqrt{5} \\
&\implies n = 10(2\sqrt{5})^2 = 10 (4 ⋅ 5) = 200
\end{align*}$
"""

# ╔═╡ c3d0df43-48ad-44c6-be5f-4a836930bf92
md"""
**(b)**

$\sigma^2 = \frac{10}{n} \implies \sigma = \sqrt{\frac{10}{n}}$

$k\sigma = 1 \implies n = 10k^2$

$P\left(\left|\frac{S_n}{n} - \mu\right| < 1\right) = P\left(-k\sigma ≤ S_n^* ≤ k\sigma\right)$
"""

# ╔═╡ a62747dd-8f27-4f2f-9bc7-6162291dbcaa
10*2^2

# ╔═╡ e0015ae8-9d76-4698-8f0d-17b52aa72843
md"""
### Exercise 9.3 #11

The price of one share of stock in the Pilsdorff Beer Company (see Exercise 8.2.12) is given by $Y_n$ on the $n$th day of the year.
Finn observes that the differences $X_n = Y_{n+1} - Y_n$ appear to be independent random variables with a common distribution having mean $\mu = 0$ and variance $\sigma^2 = 1/4$.
If $Y_1 = 100$, estimate the probability that $Y_{365}$ is

(a) $≥ 100$.

(b) $≥ 110$.

(c) $≥ 120$.
"""

# ╔═╡ 4a089fd6-e104-4bb7-b7b0-e5c8243508e6
md"""
### Exercise 9.3 #14

An astronomer makes $n$ measurements of the distance between Jupiter and a particular one of its moons.
Experience with the instruments used leads her to believe that for the proper units the measurements will be normally distributed with mean $d$, the true distance, and variance 16.
She performs a series of $n$ measurements.
Let

$A_n = \frac{X_1 + X_2 + ⋯ + X_n}{n}$

be the average of these measurements.

(a) Show that


$P\left(A_n - \frac{8}{\sqrt{n}} ≤ d ≤ A_n + \frac{8}{\sqrt{n}}\right) ≈ .95.$

(b) When nine measurements were taken, the average of the distances turned out to be 23.2 units.
    Putting the observed values in (a) gives the *95 percent confidence interval* for the unknown distance $d$.
    Compute this interval.

(c) Why not say in (b) more simply that the probability is .95 that the value of $d$ lies in the computed confidence interval?

(d) What changes would you make in the above procedure if you wanted to compute a 99 percent confidence interval?
"""

# ╔═╡ fe9df94e-7a15-4297-b345-bca21f2af153
md"""
### Exercise 10.1 #1

Find the generating functions, both ordinary $h(z)$ and moment $g(t)$, for the following probability distributions.

(a) The distribution describing a fair coin.

(b) The distribution describing a fair die.

(c) The distribution describing a die that always comes up 3.

(d) The uniform distribution on the set $\{n, n + 1, n + 2, …, n + k\}$.

(e) The binomial distribution on $\{n, n + 1, n + 2, …, n + k\}$.

(f) The geometric distribution on $\{0, 1, 2, …, \}$ with $p(j) = (2/3)^{j + 1}$.
"""

# ╔═╡ b0960497-1775-47e5-a781-a6e7ef5bf7ce
let
	n = 10
	k = 1
	collect(n:n+k)
end

# ╔═╡ 0557b16c-3656-4257-a331-7c3238db20e8
md"""
**(a)**

$g(t) = \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) = \sum_{j = 0}^1 e^{tj} \begin{pmatrix} n \\ j \end{pmatrix} p^j q^{n - j} = \sum_{j = 0}^1 \frac{1}{2}e^t = \frac{1 + e^t}{2}$

$h(z) = \frac{1 + z}{2}$

**(b)**

$g(t) = \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) = \sum_{j = 1}^6 \frac{1}{6} e^{tj} = \frac{1}{6} (e^t + e^{2t} + e^{3t} + e^{4t} + e^{5t} + e^{6t}) = \frac{e^t (e^{6t} - 1)}{6(e^t - 1)}$

$h(z) = \frac{z(z^6 - 1)}{6(z - 1)}$

**(c)**

$g(t) = \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) = \sum_{j = 1}^1 e^{3t} ⋅ 1 = e^{3t}$

$h(z) = z^3$

**(d)**

$g(t) = \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) = \sum_{j = 1}^{k} e^{t(j + n)} \frac{1}{k + 1} = \frac{e^{tn}}{k + 1} \sum_{j = 1}^k e^{tj}$

$h(z) = \frac{z^n}{k + 1} \sum_{j = 1}^k z^j$

**(e)**

$g(t) = \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) = \sum_{j = 1}^k e^{t(j + n)} \begin{pmatrix} k \\ j \end{pmatrix} p^j q^{k - j} = e^{tn} (pe^t - q)^k$

$h(z) = z^n (pz - q)^k$

**(f)**

$g(t) = \sum_{j = 1}^∞ e^{tx_j} P(X = x_j) = \sum_{j = 0}^∞ e^{tj} (2/3)^{j + 1} = \frac{2}{3} \sum_{j = 0}^∞ e^{tj} (2/3)^j$
$= \frac{2}{3} + \frac{2}{3}e^t + \left(\frac{2}{3}\right)^2 e^{2t} + ⋯ = \frac{2}{3} \sum_{j = 0}^∞ \left(\frac{2}{3} e^t\right)^j$
$= \frac{2}{3} \left(\frac{1}{1 - \left(\frac{2}{3} e^t\right)}\right) = \frac{2}{3} \left(\frac{1}{\frac{3 - 2e^t}{3}}\right) = \frac{2}{3} \left(\frac{3}{3 - 2e^t}\right) = \frac{2}{3 - 2e^t}$

$h(z) = \frac{3}{3 - 2z}$
"""

# ╔═╡ a14434a5-2bbd-42fc-a32d-4435fc2fcb93
md"""
### Exercise 10.1 #3

Let $p$ be a probability distribution on $\{0,1,2\}$ with moments $\mu_1 = 1$, $\mu_2 = 3/2$.

(a) Find its ordinary generating function $h(z)$.

(b) Using (a), find its moment generating function.

(c) Using (b), find its first six moments.

(d) Using (a), find $p_0$, $p_1$, and $p_2$.
"""

# ╔═╡ 5a7f8d14-7bab-4c52-83e5-e4b32477e9d3
md"""
**(a)**

$h'(1) = \mu_1 = 1$

$h''(1) = \mu_2 - \mu_1 = \frac{3}{2} - 1 = \frac{1}{2}$

$\begin{align*}
h(z) &= 
\end{align*}$
"""

# ╔═╡ c922a4ee-a5b8-4203-b751-71edc8048f3a
md"""
### Exercise 10.3 #1

Let $X$ be a continuous random variable with values in $[0,2]$ and density $f_X$.
Find the moment generating function $g(t)$ for $X$ if

(a) $f_X(x) = 1/2$.

(b) $f_X(x) = (1/2)x$.

(c) $f_X(x) = 1 - (1/2)x$.

(d) $f_X(x) = |1 - x|$.

(e) $f_X(x) = (3/8)x^2$.

*Hint*: Use the integral definition, as in Examples 10.15 and 10.16.
"""

# ╔═╡ 321daf21-8b9a-47ba-92a5-9fa40a212f2d
md"""
**(a)**

$u = tx \implies ∫_0^2 → ∫_0^{2t}$

$du = t \;dx \implies dx = \frac{du}{t}$

$g(t) = ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx = ∫_0^2 e^{tx} ⋅ \frac{1}{2} \;dx = \frac{1}{2t} ∫_0^{2t} e^u \;du = \frac{1}{2t} \left[e^u\right]_0^{2t} = \frac{e^{2t} - 1}{2t}$
"""

# ╔═╡ 320a5cbd-f018-4888-a79c-0de0d8547c3b
md"""
**(b)**

$\begin{align*}
g(t) &= ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx \\
&= ∫_0^2 e^{tx} ⋅ \frac{1}{2} x \;dx \\
&= \frac{1}{2} ∫_0^2 xe^{tx} \;dx
\end{align*}$

$u = x \implies du = dx$

$dv = e^{tx} \;dx \implies v = \frac{e^{tx}}{t}$

$\begin{align*}
g(t) &= \left.\frac{xe^{tx}}{t}\right|_0^2 - ∫_0^2 \frac{e^{tx}}{t} \;dx \\
&= \frac{2e^{2t}}{t} - \left[\frac{e^{tx}}{t^2}\right]_0^2 \\
&= \frac{2e^{2t}}{t} - \frac{e^{2t} - 1}{t^2} \\
&= \frac{2te^{2t} - e^{2t} + 1}{t^2} \\
&= \frac{e^{2t}(2t - 1) + 1}{t^2}
\end{align*}$
"""

# ╔═╡ 7c91a1f9-3f2e-4f33-953f-a92eab870d46
md"""
**(c)**
"""

# ╔═╡ e389f137-dfde-4ada-a074-164e8779bb7a
md"""
### Exercise 10.3 #3

Let $X$ be a continuous random variable with values in $[0,∞)$ and density $f_X$.
Find the moment generating functions for $X$ if

(a) $f_X(x) = 2e^{-2x}$.

(b) $f_X(x) = e^{-2x} + (1/2) e^{-x}$.

(c) $f_X(x) = 4xe^{-2x}$.

(d) $f_X(x) = \lambda(\lambda x)^{n - 1} e^{-\lambda x} / (n - 1)!$.
"""

# ╔═╡ 3315567e-ab70-4ca5-9a50-366925d1da16
md"""
**(a)**

$\begin{align*}
g(t) &= ∫_{-∞}^{+∞} e^{tx} f_X(x) \;dx \\
&= ∫_0^∞ e^{tx} (2e^{-2x}) \;dx \\
&= \lim_{b → ∞} \left[2 ∫_0^b e^{(t - 2)x} \;dx\right] \\
&= \lim_{b → ∞} \left[\frac{2e^{(t - 2)x}}{t - 2}\right]_0^b \\
&= \lim_{b → ∞} \left[\frac{2e^{(t - 2)b}}{t - 2} - \frac{2}{t - 2}\right] \\
&= -\frac{2}{t - 2} \\
&= \frac{2}{2 - t}
\end{align*}$
"""

# ╔═╡ 278ea4fc-ebcf-4989-b808-d969c22f09cf
md"""
### Exercise 11.1 #2

In Example 11.4, let $a = 0$ and $b = 1/2$.
Find $𝐏$, $𝐏^2$, and $𝐏^3$.
What would $𝐏^n$ be?
What happens to $𝐏^n$ as $n$ tends to infinity? Interpret this result.
"""

# ╔═╡ 845920d9-9af0-4492-b4a2-1c30e1cae42a
let
	a = 0
	b = 1/2
	P = [1 - a a
		 b     1 - b]
	P, P^2, P^3
end

# ╔═╡ ac7078b2-2d8f-44f5-8502-fa0dced63196
md"""
$\lim_{n → ∞} 𝐏^n = \begin{bmatrix} 1 & 0 \\ 1 & 0 \end{bmatrix}$

This implies that an absorbing Markov chain will eventually reach an absorbing state as more steps are taken.
"""

# ╔═╡ f86324a6-8286-47dd-8aef-76253a9322f3
md"""
### Exercise 11.1 #6

In Example 11.9, assume that we start with a hybrid bred to a hybrid.
Find $𝐮^{(1)}$, $𝐮^{(2)}$, and $𝐮^{(3)}$.
What would $𝐮^{(n)}$ be?
"""

# ╔═╡ 9e7f1139-914d-4500-bc83-c11849064397
let
	u = [0.25 0.5 0.25]
	P = [.5 .5 0; .25 .5 .25; 0 .5 .5]
	u*P, u*P^2, u*P^3
end

# ╔═╡ e5dbc87c-a584-4acc-a4d1-9e0971fba005
md"$𝐮^{(n)} = \begin{bmatrix} 1/4 & 1/2 & 1/4 \end{bmatrix}$"

# ╔═╡ 36f1b256-85fb-4f8f-a953-4a4f5a091a5e
md"""
### Exercise 11.1 #7

Find the matrices $𝐏^2$, $𝐏^3$, $𝐏^4$, and $𝐏^n$ for the Markov chain determined by the transition matrix $𝐏 = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix}$.
Do the same for the transition matrix $𝐏 = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$.
Interpret what happens in each of these processes.
"""

# ╔═╡ 1e28a003-1d1d-4c7c-a171-daa02f469e2e
let
	P = [1 0; 0 1]
	
	P^2, P^3, P^4
end

# ╔═╡ 5e011dd7-5e53-413b-a639-ef00686337eb
let
	P = [0 1; 1 0]
	
	P^2, P^3, P^4
end

# ╔═╡ ef248c01-b156-4506-bc98-c32413bd9dcc
md"""
### Exercise 11.1 #8

A certain calculating machine uses only the digits 0 and 1.
It is supposed to transmit one of these digits through several stages.
However, at every stage, there is a probability $p$ that the digit that enters this stage will be changed when it leaves and a probability $q = 1 − p$ that it won’t. 
Form a Markov chain to represent the process of transmission by taking as states the digits 0 and 1.
What is the matrix of transition probabilities?
"""

# ╔═╡ fc2ea564-aae1-40a2-a910-b7a5f7095038
md"""
$\begin{bmatrix} q & p \\ p & q \end{bmatrix}$
"""

# ╔═╡ 2d2b7c7a-c86a-4d1f-9388-2e552fdd8faf
md"""
### Exercise 11.2 #5

For Example 11.11, verify that the following matrix is the inverse of $𝐈 - 𝐐$ and hence is the fundamental matrix $𝐍$.

$𝐍 = \begin{pmatrix} 8/3 & 1/6 & 4/3 & 2/3 \\ 4/3 & 4/3 & 8/3 & 4/3 \\ 4/3 & 1/3 & 8/3 & 4/3 \\ 2/3 & 1/6 & 4/3 & 8/3 \end{pmatrix}\;.$

Find $𝐍𝐜$ and $𝐍𝐑$.
Interpret the results.
"""

# ╔═╡ b4bc1ed5-5ba8-43e5-84f7-5aaa00dbdcd8
let
	𝐏 = [1.000 .000 .000  .000 .000  .000
		  .250 .500 .000  .250 .000  .000
		  .000 .000 .000 1.000 .000  .000
		  .062 .250 .125  .250 .250  .062
		  .000 .000 .000  .250 .500  .250
		  .000 .000 .000  .000 .000 1.000]
	
	# Canonical form
	𝐏 = [ .500 .000  .250 .000  .250  .000
		  .000 .000 1.000 .000  .000  .000
		  .250 .125  .250 .250  .062  .062
		  .000 .000  .250 .500  .000  .250
		  .000 .000  .000 .000 1.000  .000
	      .000 .000  .000 .000  .000 1.000]

	𝑡 = 4
	𝑟 = 2
	𝐜 = ones(𝑡)
	𝐐 = Array{Float64}(undef, 0, 𝑡)
	for i ∈ 1:size(𝐏, 1)
		if 𝐏[i,i] ≠ 1
			𝐐 = [𝐐; 𝐏[i,1:𝑡]']
		end
	end
	𝐑 = 𝐏[1:end-𝑟, 1:end-𝑟]
	𝐍 = inv(I - 𝐐)
	[rationalize.(A) for A ∈ [𝐍, 𝐍*𝐜, 𝐍*𝐑]]
end

# ╔═╡ 744a4408-5005-408e-80e5-0891ec9b6a12
8//3 + 4//3 + 1//6 + 2//3

# ╔═╡ fa6f42ef-36c6-4ebb-a24b-fadf8eb545f9
md"""
### Exercise 11.3 #3

Which of the following matrices are transition matrices for regular Markov chains?

(a) $𝐏 = \begin{pmatrix} .5 & .5 \\ .5 & .5 \end{pmatrix}.$

(b) $𝐏 = \begin{pmatrix} .5 & .5 \\ 1 & 0 \end{pmatrix}.$

(c) $𝐏 = \begin{pmatrix} 1/3 & 0 & 2/3 \\ 0 & 1 & 0 \\ 0 & 1/5 & 4/5 \end{pmatrix}.$

(d) $𝐏 = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}.$

(e) $𝐏 = \begin{pmatrix} 1/2 & 1/2 & 0 \\ 0 & 1/2 & 1/2 \\ 1/3 & 1/3 & 1/3 \end{pmatrix}.$
"""

# ╔═╡ 81fb81a7-4bee-4a31-9077-5be0a333ec73
md"""
**Solution.**

(a) Yes

(b) Yes

(c) No

(d) No

(e) Yes
"""

# ╔═╡ 4751b837-0501-4668-8f29-4b4eb4f69dc3
md"""
### Exercise 11.2 #2

Consider the Markov chain with transition matrix

$𝐏 = \begin{pmatrix} 1/2 & 1/3 & 1/6 \\ 3/4 & 0 & 1/4 \\ 0 & 1 & 0 \end{pmatrix}\;.$

(a) Show that this is a regular Markov chain.

(b) The process is started in state 1; find the probability that it is in state 3 after two steps.

(c) Find the limiting probability vector $𝐰$.
"""

# ╔═╡ 8853ceba-27a7-4483-b2f1-208d19b3f0cb
let
	P = [1//2 1//3 1//6; 3//4 0 1//4; 0 1 0]
	P^3 # ⟹ regular
end

# ╔═╡ f0188efd-e328-4132-9003-73dbe63a3d7e
let
	P = [1//2 1//3 1//6; 3//4 0 1//4; 0 1 0]
	P^2
end

# ╔═╡ 680cf7c4-de1f-4e1c-ac8b-379273903b8f
md"""
(b)

$p_{13}^{(2)} = \frac{1}{6}$
"""

# ╔═╡ 37efa7d4-7fd7-43fc-ae94-9b15f3fe2925
md"""
(c)

$𝐰𝐏 = \begin{pmatrix} w_1 & w_2 & w_3 \end{pmatrix} \begin{pmatrix} 1/2 & 1/3 & 1/6 \\ 3/4 & 0 & 1/4 \\ 0 & 1 & 0 \end{pmatrix} = \begin{pmatrix} \frac{w_1}{2} + \frac{3w_2}{4} & \frac{w_1}{3} + w_3 & \frac{w_1}{6} + \frac{w_2}{4}\end{pmatrix}$

$\begin{align*}
\frac{w_1}{2} + \frac{3w_2}{4} &= w_1 \\
\frac{w_1}{3} + w_3 &= w_2 \\
\frac{w_1}{6} + \frac{w_2}{4} &= w_3
\end{align*}$

Let $w_1 = 1$.
Then

$\frac{1}{2} + \frac{3w_2}{4} = 1 \implies w_2 = \frac{2}{3}$

$\frac{1}{3} + w_3 = \frac{2}{3} \implies w_3 = \frac{1}{3}$

$𝐰 = \frac{\begin{pmatrix} 1 & \frac{2}{3} & \frac{1}{3} \end{pmatrix}}{2} = \begin{pmatrix} \frac{1}{2} & \frac{1}{3} & \frac{1}{6} \end{pmatrix}$
"""

# ╔═╡ 8c84a358-6efa-49b5-8eb7-ea57eaa1f996
md"""
### Exercise 11.3 #3

Consider the Markov chain with general $2 × 2$ transition matrix

$𝐏 = \begin{pmatrix} 1 - a & a \\ b & 1 - b \end{pmatrix} \;.$

(a) Under what conditions is $𝐏$ absorbing?

(b) Under what conditions is $𝐏$ ergodic but not regular?

(c) Under what conditions is $𝐏$ regular?
"""

# ╔═╡ 9f7529fa-dfa3-4e30-9db9-5921475b0d4b
md"""
**Solution.**

(a) When $a = 0$ or $b = 0$.

(b) When $a = b = 1$

(c) When $0 < a < 1$ or $0 < b < 1$
"""

# ╔═╡ 3e7bda6b-9c58-41ff-9c97-ac6711d11f15
md"""
### Exercise 11.3 #6

Consider the Markov chain with transition matrix in Exercise 3, with $a = b = 1$.
Show that this chain is ergodic but not regular.
Find the fixed probability vector and interpret it.
Show that $𝐏^n$ does not tend to a limit, but that

$𝐀_n = \frac{𝐈 + 𝐏 + 𝐏^2 + ⋯ + 𝐏^n}{n + 1}$

does.
"""

# ╔═╡ febd2b79-886b-4e6c-83b9-c6dee56db722
let
	a = b = 1
	P = [1 - a     a
	         b 1 - b]
	A(n) = sum([P^i for i ∈ 1:n]) / (n + 1)
	[[P^n, A(n)] for n ∈ (10:15).^2]
end

# ╔═╡ d1835207-38b2-4ef7-8d2e-6aa9c3535821
md"""
### Exercise 11.3 #7

Consider the Markov chain with transition matrix of Exercise 3, with $a = 0$ and $b = 1/2$.
Compute directly the unique fixed probability vector, and use your result to prove that the chain is not ergodic.
"""

# ╔═╡ 5905f5b5-a66d-4385-91e5-86f2fbd2557c
let
	a = 0
	b = 1/2
	P = [1 - a     a
	         b 1 - b]
end

# ╔═╡ 5cb0f419-7a0b-4ba8-86dd-92727e5f41fb
md"""
$\begin{pmatrix} w_1 & w_2 \end{pmatrix} \begin{bmatrix} 1 & 0 \\ 1/2 & 1/2 \end{bmatrix} = \begin{pmatrix} w_1 & w_2 \end{pmatrix}$

$\begin{align*}
w_1 + \frac{w_2}{2} &= w_1 \\
\frac{w_2}{2} &= w_2
\end{align*}$

$1 + \frac{w_2}{2} = 1 \implies w_2 = 0 \implies w_1 = 1 \implies 𝐰 = \begin{pmatrix} 1 & 0 \end{pmatrix}$
"""

# ╔═╡ e4356df6-065f-4bcb-bff4-a61144289694
md"""
### Exercise 11.3 #24

A certain experiment is believed to be described by a two-state Markov chain with the transition matrix $𝐏$, where

$𝐏 = \begin{pmatrix} .5 & .5 \\ p & 1 - p \end{pmatrix}$

and the parameter $p$ is not known.
When the experiment is performed many times, the chain ends in state one approximately 20 percent of the time and in state two approximately 80 percent of the time.
Compute a sensible estimate for the unknown parameter $p$ and explain how you found it.
"""

# ╔═╡ 8cef9ae4-1078-4537-9a20-e128339911eb
md"""
**Solution.**

$\begin{pmatrix} 0.2 & 0.8 \end{pmatrix} \begin{bmatrix} .5 & .5 \\ p & 1 - p \end{bmatrix} = \begin{pmatrix} 0.2 & 0.8 \end{pmatrix}$

$\begin{align*}
0.1 + 0.8p &= 0.2 \\
0.1 + 0.8(1 - p) &= 0.8
\end{align*}$

$p = \frac{0.1}{0.8} = 0.125$
"""

# ╔═╡ 6c41dfc7-646a-49c4-9fc3-5326bf893cef
md"""
### Exercise 11.3 #25

Prove that, in an $r$-state ergodic chain, it is possible to go from any state to any other state in at most $r - 1$ steps.
"""

# ╔═╡ b40896b6-c8ce-43bd-9fe5-e1c2ef046158
md"""
**Solution.**
To each Markov chain we can associate a *directed graph*, whose vertices are the states $i$ of the chain, and whose edges are determined by the transition matrix: the graph has an edge from $i$ to $j$ if and only if $p_{ij} > 0$.
"""

# ╔═╡ 18a1dad3-9bc7-4ea5-9ff5-eb628e512567
md"""
### Exercise 11.3 #26

Let $𝐏$ be the transition matrix of an $r$-state ergodic chain.
Prove that, if the diagonal entries $p_{ii}$ are positive, then the chain is regular.
"""

# ╔═╡ 14fc559e-1e32-4fff-ad38-0e4ebfc079da
md"""
**Solution.**
"""

# ╔═╡ 9810b029-90b2-48f8-b7a5-4f7f2aacf08c
md"""
### Exercise 11.3 #27

Prove that if $𝐏$ is the transition matrix of an ergodic chain, then $(1/2)(𝐈 + 𝐏)$ is the transition matrix of a regular chain.
*Hint*: Use Exercise 26.
"""

# ╔═╡ ee729c71-0e2f-40d9-938a-b13eeb80efd5
md"""
**Solution.**
"""

# ╔═╡ 81d5191d-e9dc-4867-8910-3e8322ab067b
md"""
### Exercise 11.3 #28

Prove that $𝐏$ and $(1/2)(𝐈 + 𝐏)$ have the same fixed vectors.
"""

# ╔═╡ c9f2fcca-8bb8-4e95-b8c3-b4ea95575b03
md"""
**Solution.**
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Combinatorics = "861a8166-3701-5b0c-9a16-15d98fcdc6aa"
Distributions = "31c24e10-a181-5473-b8eb-7969acd0382f"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
QuadGK = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"

[compat]
Combinatorics = "~1.0.2"
Distributions = "~0.25.15"
Plots = "~1.21.1"
PlutoUI = "~0.7.9"
QuadGK = "~2.4.2"
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
git-tree-sha1 = "bdc0937269321858ab2a4f288486cb258b9a0af7"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.3.0"

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
git-tree-sha1 = "c2dbc7e0495c3f956e4615b78d03c7aa10091d0c"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.15"

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
git-tree-sha1 = "7c365bdef6380b29cfc5caaf99688cd7489f9b87"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.2"

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

[[IrrationalConstants]]
git-tree-sha1 = "f76424439413893a832026ca355fe273e93bce94"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.0"

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
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "3d682c07e6dd250ed082f883dc88aee7996bf2cc"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.0"

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
git-tree-sha1 = "32efa73dece357e9c834cae8af00265752c80061"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.3.5"

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
deps = ["ChainRulesCore", "LogExpFunctions", "OpenSpecFun_jll"]
git-tree-sha1 = "a322a9493e49c5f3a10b50df3aedaf1cdb3244b7"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.6.1"

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
git-tree-sha1 = "fed1ec1e65749c4d96fc20dd13bea72b55457e62"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.9"

[[StatsFuns]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "46d7ccc7104860c38b11966dd1f72ff042f382e4"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.10"

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
# ╟─3fafaca6-0516-11ec-123d-1f912a822711
# ╟─f73c590c-661c-4181-a43f-e1a97cd9c90e
# ╟─c1ba23ad-9bdd-4cb0-964f-7b762107a1ad
# ╟─0201891e-9760-4c48-8be9-6515e637f796
# ╟─b1baad94-cdc3-4076-bd5f-15fd36a54747
# ╟─9a78bed1-57b8-45d3-ab7a-993e8bdd5c64
# ╟─930312f3-ea49-4496-851c-ca7a6ecd84a5
# ╟─6fd11312-a630-477e-821f-99891a9f4fa1
# ╟─f6617221-031a-41f4-a029-48ce0e208076
# ╟─0371ddaf-3cdb-444c-8791-c4a2410075a7
# ╟─92b5313c-09c2-43d6-8ead-0fa22d580f13
# ╟─f791d57b-bf9d-4cfb-b1fc-ade11bfdcd65
# ╟─558abcba-b4e5-41ef-96a5-c950810e35a4
# ╟─6d6abda1-b343-4a28-977e-86c79a3e7f8c
# ╟─e93f4c8c-7079-4ded-b5e2-57182a983d8e
# ╟─dc0e1c09-7332-4340-94e7-31fc6fa63dfc
# ╟─d1067117-ae7f-40c4-b704-da4994777f2d
# ╟─0e22ecb7-016d-497b-9858-593ba1a6f632
# ╠═b36df924-fc07-4971-a771-0459e7cdcbf6
# ╟─eb7bafe5-4411-4dae-8de2-db3051061c41
# ╟─85e38c7a-56be-4fca-836a-5b2dc37bcb89
# ╟─8477f9f4-fba9-4d62-8c11-222a9be83add
# ╠═dcc865f9-55ad-4940-b783-693e2d50396d
# ╠═59db96e6-bccd-41aa-b26b-25ba26e30c4a
# ╟─938acc94-2625-45a3-9afd-b322123069a6
# ╟─4b4b1147-3f18-42bf-a7a6-275a45002730
# ╟─d10f07f4-fb06-4f87-9311-ab1efb4e1965
# ╟─c399bc3e-65ec-4426-8c4e-4c5d1350158e
# ╠═44dcc1d0-4b26-493a-ba0a-2a5f9e767d53
# ╠═4d6c2930-641d-449b-83f7-56a0b31cd92e
# ╟─78fa60f3-643d-4360-92b0-6d385540d060
# ╟─1cc0a22e-a8c6-4bb4-94ed-cb2426047af1
# ╟─9359260b-fe39-40f3-b61a-698c2cf6658d
# ╟─347e2f44-aa02-4634-a3f5-55691dbf1fc3
# ╟─cdc7b379-234c-4656-8600-70ab52cd3bdf
# ╟─bcbacde8-2d2c-44d4-8fa9-06c4b219a4db
# ╟─cb2f95d3-7365-4cfd-9c03-f9eccca09be1
# ╟─bb496991-e0d9-491c-9cf4-eabaaa569c52
# ╟─3576de1f-0585-49bb-8565-3fb9cca33cae
# ╟─b26d80da-18a9-4525-8339-63672cfa2fb7
# ╟─7393170d-050a-48e4-8171-b73e116848de
# ╟─88deb21b-7456-4bad-8780-f4b3ce47586f
# ╟─cddcbdec-06f1-483d-8752-21849f0189c8
# ╟─4bd7061a-569c-48a9-8467-105e96497ee8
# ╟─1303fc83-0e13-462a-a679-001db32b95b4
# ╟─017769f2-fcda-49c2-8dde-0232c12f4429
# ╟─ee07321e-c800-4ec7-a62e-a9ac472e25e5
# ╟─bfcc3015-5d41-4e0b-951f-1258a10fc1ee
# ╟─758e61fb-0145-4aa1-a895-f8d7770123c9
# ╟─dedbb77c-befa-4ea9-9e95-c6169730be4f
# ╟─a63dd911-1f3e-4d3a-80da-4f33b46e8916
# ╟─4165c37c-a95f-4967-990e-a611999440cd
# ╟─88190655-8c84-493c-9bfd-842d7ffae8bb
# ╟─b1484369-53d7-44de-b8d8-dab14ecc1cfb
# ╟─f61d9c95-52e8-4a18-a6c2-dd7f71f9f6e5
# ╠═3cbbe80b-6b88-45b9-931c-02b35ab13fff
# ╟─db03912b-db3b-43a3-ab5a-bb37708869d8
# ╟─53afb60d-486b-4095-b4b2-619ad2098c39
# ╟─ff796362-71ff-488d-90b0-ed12b0c8b722
# ╟─b7ab1b9e-5d69-4cc7-9e7b-08d91f7ad458
# ╟─66d81005-2e93-42d5-a3a8-e8a8ec045ba2
# ╟─b2aea670-cb00-4461-8a45-88ea609c38ea
# ╠═960a5e1c-2ffe-4779-b497-f2f7952855e3
# ╟─76f410a6-e3f1-4146-a08e-bfbca36670ef
# ╠═ecef6888-02bf-477e-b96d-73af573ffd9a
# ╟─7bdc52d1-760b-4f9f-95ab-a938ef075315
# ╟─bcde84fd-599c-407f-8669-402c3b435aee
# ╟─c8f6990c-d566-4fa5-a0d8-3a1101fa6f54
# ╟─3fd268ce-7197-4ace-be30-decf189bb106
# ╟─1c0ef61e-09f1-4b55-835b-b097319f7abb
# ╟─c11136e2-d001-4cbb-9eac-85343dd9f912
# ╠═32b21e35-162c-44c4-aad1-9b9cc6acab82
# ╠═53c3e940-028a-40d2-a528-9682543c64ad
# ╟─baf134a0-6f2d-47a2-8f9a-f810b15fbd25
# ╟─843b476c-7213-4a94-8f61-1d3906d0ae6d
# ╟─5ee8dfa2-b2df-46eb-b6de-3c7575ad3987
# ╟─58e5653d-f0b5-4e61-9f03-9e427a63e8e0
# ╟─32364c9d-1841-4ea4-af38-6d77b2acd2a1
# ╟─8b540489-2de3-45ab-84eb-bae3045029cb
# ╟─19e659ae-92d8-4b2f-beb2-2f15d3ae3ae0
# ╟─cd9288fb-67e7-4605-9d82-04cae7fb27e6
# ╟─a59c8fff-8f00-46f1-92ab-03afb88e7baa
# ╟─a8de3406-f2ea-4a19-9074-41ad887722a8
# ╟─dc636909-d0ad-4add-9479-5329654e1046
# ╟─889dd7ca-8440-4259-a054-248b545201d4
# ╟─87206487-ff61-4c17-ad68-6a44678f5038
# ╟─de2f8cb0-2ed3-4b28-82bb-a35d996cf7f4
# ╟─67edcddc-b130-408d-8080-7428643ae336
# ╠═95dc0e70-14f6-4c55-bcd9-bdd3a1ab6643
# ╟─ed661e78-765a-4a2c-b40c-ae20d6f4bc86
# ╟─4b4bc94a-fd1d-447b-bc5e-4725acfa8078
# ╟─31a51611-2cd4-4d0d-8a2a-92d3724c6827
# ╟─adb69aca-b920-4164-a15c-524073b38238
# ╟─b9b2b897-d35d-4f05-98d1-0a625ea548da
# ╟─625f8bff-a457-44f1-aef5-d8d608dd1f8f
# ╟─44373fb3-4e53-460f-9240-39037077ed79
# ╟─ebf9318b-8287-45ed-b6a9-a1ada8b4226b
# ╠═37cdd07f-42d7-427e-88f8-f69d51b43b74
# ╟─5feb7f4f-7938-4129-95b0-367896876265
# ╠═99cbe94a-0050-44db-ae3b-4138f587325d
# ╟─e8d93391-281b-4485-9d62-73f26f2e0678
# ╠═eba066e0-7be9-4c27-bea6-287436aed010
# ╟─07992d2c-3b3e-493f-80ac-ba2f010edd55
# ╟─334f1ea5-d8fb-43e2-9a2d-b33967d55604
# ╟─64218544-e6d5-49ec-885b-0472ccc7ff89
# ╟─840425fb-1dc0-4c09-af7d-26964fba61a5
# ╟─c3d40d5e-0744-4d69-8202-ecb16e136c83
# ╟─9d42cafc-b5b1-405a-8f2d-ddedc22f9ac3
# ╟─4443d9c0-2929-4321-b5e6-acdf2090a32d
# ╟─57c14941-f3fd-480e-bdd6-cd00e3057783
# ╟─9790c0e5-0623-4155-9135-fd0e5428cc67
# ╟─a46ea122-ddfa-4ba4-947e-8aae3e8db81f
# ╟─809ed195-1412-4867-b1fe-686e3b532c47
# ╟─df79a956-4acb-4841-85c2-17a2b0b490c4
# ╟─6b369f36-d1d3-46a0-9a0a-7b3449c8622d
# ╠═b17221b1-b65b-4d76-a615-5ae05b6f9e55
# ╟─9d2bbf1d-0a72-4317-b297-87d591beb3aa
# ╟─8782362e-3920-42ba-a453-eec616fffdc2
# ╟─d6d87956-4668-4ef0-9f94-497d724711c2
# ╟─4d52e3b4-24da-43ee-849b-be2ce96af8d1
# ╟─98f9f085-0558-4d17-b2b3-d1811afdab04
# ╟─f4ad2137-6a75-472d-81f0-65bd2f331f6c
# ╟─af309461-1415-4668-a959-a160a56793a1
# ╟─f3660892-bcbb-4212-84d0-443866e92118
# ╟─72d6cf12-bc23-4bdd-b0f1-480b8f324088
# ╟─89068e5a-2174-42c8-91d1-60fdf2e9c979
# ╟─91cbb957-bab8-4ad4-a4d1-22f95b2063ec
# ╟─8b61ef17-aea3-4275-806d-1fd59572bd78
# ╟─428091c0-9563-49b3-b3ec-e04b62b3f3ca
# ╟─0a895c88-6bbd-4bf9-abd0-c65fe4eb7bbb
# ╟─64a7d1b4-1e20-4f8b-928b-9e51a7cbca56
# ╟─a96f03b7-f7b7-4f6a-a07f-18c9e0ab08f4
# ╟─6e448615-3624-45f0-a53d-84062f7e7952
# ╟─8fe75eaa-a205-4fed-87a8-c90599950c29
# ╟─449e33c4-6421-4f8c-b369-d623b22f8b67
# ╟─4db7f519-c949-4695-adaa-6d929ace45ce
# ╠═4ca5d5e1-1ac7-4f73-9d99-edd2609c78e9
# ╟─2a745849-2ad2-42fb-9f76-da0b5e96dc82
# ╟─79b0e3ed-ec94-41a5-a3c0-0310955eca7b
# ╟─4147db21-d8a3-46a7-a357-b45e0e596391
# ╟─929e81d5-ee0c-48f9-9779-a5dcdca61561
# ╟─4ab90b83-32c6-4e35-a382-4f950d1b62ba
# ╟─23d59281-f651-4318-b35c-925a519abe76
# ╟─94e17cbd-78e4-453e-8217-9010daf7b113
# ╟─ec26d2e0-7096-433c-8dfd-f4c0f7be5917
# ╟─94f905c4-89de-4b66-9657-0fa73968e8ae
# ╟─43a11079-7637-40c8-aa3a-6eab53793d02
# ╠═b09602b3-2655-4a3b-805d-1fcf86835724
# ╟─ccdb2c90-d164-4abb-8ea0-beac6cca3e00
# ╟─fba78c52-1565-480e-86b9-9411e411a2c5
# ╟─3a1ef7b0-f2cf-4f08-912c-af7d01beb51e
# ╟─9f619140-dc53-48e5-9da0-f90d6a19e805
# ╠═ddd954b9-0f98-4311-a7f0-6bd2022f7712
# ╠═72b8422b-5efd-4443-9c37-1dea8f2768a9
# ╟─acd69121-b2c6-4c3d-b6ed-200cc49440fa
# ╟─c8372676-860d-48e5-a9f5-4959abf1c67e
# ╟─6a8d6d71-6508-4a85-9ff6-2fbf2b720d69
# ╠═2d71df1f-793c-46f7-9525-e56bdb1c5b79
# ╠═b9b28967-13f6-4d0d-b81b-ef76f32e07f0
# ╟─402455f8-f8a8-4770-bad1-19ace030f619
# ╟─b79d4f20-4ff4-413c-b031-651d4925d3cf
# ╟─43cfa0ae-5785-4402-b3fe-d99204c5f0a6
# ╟─a68e22bd-2a4a-4ab6-892f-7d6bf0d6c98c
# ╟─4d334cc7-12ae-47c9-a3dd-e2615fda4c54
# ╠═e1d0d507-3ea4-4333-aaa8-2d5a568d7a2b
# ╠═8d03ad36-4c56-465d-bdd2-7f5bc2d0615b
# ╟─888fe3a2-76ed-436f-a6d4-02aba5c125d0
# ╠═b8cebdf3-e90c-4d89-89b5-f7009174d8f7
# ╠═a54b1309-93ac-4ccc-90d7-b78fdde48d7b
# ╟─827ae940-f339-41d1-a2d4-03e0c97c90b7
# ╟─fa371210-3087-4279-bbc9-9a8ba69e6710
# ╟─1395dd19-ce33-408a-beac-5d742eb7e944
# ╟─03fcdd63-dbe7-47c1-920e-163de501afc0
# ╠═f5eb9f87-7ee9-4c1f-9981-db0d04d15dad
# ╟─c4197200-72da-45f8-8c68-372e28196bfb
# ╟─291bf333-c326-47e2-9d9c-24c8b135a9f9
# ╟─074c1c6e-2b9c-4c56-b344-12e4562a8739
# ╟─bab5e95d-de79-46a5-87e7-e55e313fb97c
# ╟─3816685b-37b3-44cd-8f52-645bfb183002
# ╟─3813ead1-3ed9-474b-af53-3d0e4be94ca6
# ╟─5639358b-4569-48d9-bf89-809ad642b8cf
# ╟─0e227aa3-cabd-4348-b66f-f280da2c0831
# ╟─8f52804f-0f30-4f5c-8738-c173a41eb95e
# ╟─aa1008d7-3c88-4a94-8a15-c06b686902b1
# ╟─73166942-60ca-45fc-916b-6f92841d39f3
# ╟─d2e829a1-0f4b-4829-8777-e83757682d3c
# ╟─0e2726f6-816d-4b9c-bf56-8162d894b974
# ╟─c5dc7cae-a296-489f-95b1-31a1a8afa2f4
# ╟─2c4caa88-cdf8-40e6-95ea-a3b624b5ed23
# ╟─81cebd4a-1b94-41f3-8fa0-f95c6dda22d9
# ╟─7857ef08-85c3-4a7a-9447-1d166a845a42
# ╟─c764e746-137e-4669-a3db-c497b7c0c28c
# ╟─c5678806-288e-4685-9320-5275ef0f05a5
# ╟─f89646e9-afc8-4f89-8efa-b0fb79d92705
# ╟─a6bc6b86-da10-4ee7-a00b-9f54df2d3e5b
# ╟─199336b6-9581-402f-b48b-7104aaf6da08
# ╟─dc05d712-7afc-47e4-b521-7e0158e45cd6
# ╟─7e109b78-ea8e-4ce4-aadb-04a30162a22a
# ╟─222e520e-1641-436b-a0e3-cf9b607fe2cd
# ╟─dd1fb462-efae-43c8-b57c-140e85d7c2a5
# ╟─715103e7-8538-4e9e-96e3-4634eb8e5f04
# ╟─d0206875-8ac8-4a99-a2d6-df955bff0089
# ╟─8a402036-17e5-4454-961d-ac3215203729
# ╟─73357970-ce64-4b66-9229-4814806fbeae
# ╟─147f1d71-8f43-4236-af8e-80c806a9c588
# ╟─f0e7d2da-5c04-4376-ac59-48f74b20cb46
# ╟─dc0b6393-0e29-46bf-bc95-28f5d220a9ca
# ╟─48aa0829-f278-4cce-963a-5e27cdc4d108
# ╟─72af4048-3d38-47ce-bc45-79c7a122ccce
# ╟─5f212384-7cf1-4659-aae3-b8a8a4d767da
# ╟─f57182dd-e38d-42f8-b98d-c2afb1890848
# ╟─6e5aa17d-66ae-4dac-881e-f674b1029de1
# ╟─c6eff89e-a123-4aaf-aeb3-903a27723034
# ╠═c289f7a5-9ffc-4483-ae74-4267bca6fff6
# ╟─016e496d-27be-45af-a1c1-134c64935254
# ╟─b4f89164-78c0-473b-832f-7d730dae6862
# ╠═bcd27557-27b4-42f5-aa73-61ef72e15e4a
# ╟─ee9f80ea-8393-48bc-8050-41a636a8d545
# ╟─f6fd0afb-5235-4989-be28-6d11dee51f24
# ╠═8e28063d-2d22-49af-b8d7-02d688f70a94
# ╟─819bdbc6-48aa-41d9-adee-749c3713a9a4
# ╠═94b3ccf0-520b-4bc2-8848-02ee1128ade8
# ╟─8b707518-5212-46a5-a6f4-590ef87c1dc6
# ╟─b0c22deb-b629-44fe-b3c5-1ecd21a9893f
# ╠═258533bc-338e-405f-bc8e-cf58102c0f98
# ╟─111dcc21-24c1-4f3c-8488-35a0a9dfac4d
# ╠═b68b331b-3406-4beb-9b38-6b28c737563c
# ╟─49b09e56-902b-46a1-b25e-99fdaaf88d5b
# ╟─b75188db-f025-4218-8721-09bb78e23657
# ╠═1cf51b19-8357-47cf-8a7c-6b680ed0d48b
# ╠═5a787284-628d-4892-ab8d-15694393566b
# ╠═4849321b-9af8-4f2e-9b21-61c4df7823c4
# ╟─9cfb1366-e5dc-4c33-acf6-96a424640c59
# ╟─db4022e1-e57c-4397-a735-66439d8e246b
# ╟─f3a22c42-5fe7-46b8-8d57-78d4c1fba6a8
# ╟─bce0f193-2023-4a7b-8042-a0d56ec80a51
# ╟─97449c05-1d81-44b2-8960-962eb7c706ae
# ╟─2dec1cfd-70ea-4ce3-8af5-97b37f6ef4cd
# ╟─da441abf-70fb-428b-86e0-7d0ab49185a7
# ╟─c3918cf4-bc7c-41a1-a1dc-7ef775362e06
# ╟─66a13a54-201c-43a0-af84-b8103ab52098
# ╟─953284bc-1595-4a31-9199-6cf4e042a7c9
# ╟─a96f3849-5e60-4cd5-a8e8-da9fc4a2bba2
# ╟─563db2e8-987e-442e-98de-6479518728b0
# ╟─09f1bfc5-e551-4d74-970f-5d04a2186fda
# ╟─0f8db65d-3bd6-4857-af05-12758c6d35f9
# ╟─1ae1ce40-b927-416e-b16c-90217279beb2
# ╟─b5bc13e4-cafc-4d9d-9d05-4c4cfa8c26c6
# ╟─cb04922b-af75-4aa4-b1f1-600807cb6626
# ╠═c63acbd4-9b53-4b80-a6b7-d38f603e94b7
# ╟─27f64b77-be9e-41c9-8915-12e5849c249f
# ╟─2ee2a5cd-7688-41b9-bbed-824fbf606d89
# ╟─f11db5a3-22df-45cb-91d3-1457515e15b5
# ╟─95aa3b6d-3d23-44bf-9a37-cd6014f1e072
# ╟─923a0b12-73fd-415b-a989-2414c879a4b8
# ╟─09a9075d-dd72-493a-9046-d087f1ddbef6
# ╟─6aae4c8c-854d-401e-92c4-71e75070e3d3
# ╟─ce251561-f8bb-442c-a796-adfe31c49f42
# ╠═baaeeb7d-ba48-4922-8a71-26f7a62bfbf6
# ╟─2c8604e2-fa43-4f67-bfb9-6b895d6033a3
# ╠═e40d957c-8732-409e-b638-002ca8f6e56d
# ╟─3e48163f-7381-44e3-aed4-01125f78330c
# ╠═f8c5511c-322e-463f-8afa-30998d3cf8fd
# ╠═d8ac627f-a34d-4a63-b5df-0bc26847aba2
# ╟─c2681e2b-bff6-458a-af5d-8e71fa67df10
# ╟─00c4bb71-3fe5-4d8d-8b1d-a339a195d7d2
# ╟─c340683b-c7f7-435a-a246-8ac0125fa448
# ╟─3a9e6f6b-9e76-4ba8-b57d-1f93f084c410
# ╠═e73d6242-17a5-4ae4-ae57-51badc97f5b8
# ╟─5c4f7b17-5023-4f32-b7f8-a6ed43b09e22
# ╟─1bc77972-b409-4331-ba78-4d1cbcfd1477
# ╟─d216cc8c-d902-4d30-a9ba-e437db46c4e9
# ╠═14e852ca-23f7-49df-8b4a-e09616707686
# ╠═b3f4791f-fc35-4623-b7fd-1e41ca0003f8
# ╠═34aa805f-a8f1-4126-a867-b04dd6c26fa6
# ╟─f21db93e-4d2c-40d4-b10e-b525801a3f32
# ╠═f02775cd-1161-444d-be05-c1fc15ea53df
# ╟─21a2020c-335f-448c-a9c1-4e75ed534280
# ╠═50262e09-aee4-4132-8c54-18ec40ff6293
# ╠═a73f6df9-8af6-438e-ac2f-3a47369f6155
# ╟─730a2396-6336-4477-a477-cbf252b4b50b
# ╟─3e11e6cf-f273-46a3-a191-59f20bb39d70
# ╟─059be845-9c40-483d-8e2b-359e67f40cdc
# ╟─c3d0df43-48ad-44c6-be5f-4a836930bf92
# ╠═a62747dd-8f27-4f2f-9bc7-6162291dbcaa
# ╟─e0015ae8-9d76-4698-8f0d-17b52aa72843
# ╟─4a089fd6-e104-4bb7-b7b0-e5c8243508e6
# ╟─fe9df94e-7a15-4297-b345-bca21f2af153
# ╠═b0960497-1775-47e5-a781-a6e7ef5bf7ce
# ╟─0557b16c-3656-4257-a331-7c3238db20e8
# ╟─a14434a5-2bbd-42fc-a32d-4435fc2fcb93
# ╠═5a7f8d14-7bab-4c52-83e5-e4b32477e9d3
# ╟─c922a4ee-a5b8-4203-b751-71edc8048f3a
# ╟─321daf21-8b9a-47ba-92a5-9fa40a212f2d
# ╟─320a5cbd-f018-4888-a79c-0de0d8547c3b
# ╠═7c91a1f9-3f2e-4f33-953f-a92eab870d46
# ╟─e389f137-dfde-4ada-a074-164e8779bb7a
# ╟─3315567e-ab70-4ca5-9a50-366925d1da16
# ╟─278ea4fc-ebcf-4989-b808-d969c22f09cf
# ╠═845920d9-9af0-4492-b4a2-1c30e1cae42a
# ╟─ac7078b2-2d8f-44f5-8502-fa0dced63196
# ╟─f86324a6-8286-47dd-8aef-76253a9322f3
# ╠═9e7f1139-914d-4500-bc83-c11849064397
# ╟─e5dbc87c-a584-4acc-a4d1-9e0971fba005
# ╟─36f1b256-85fb-4f8f-a953-4a4f5a091a5e
# ╠═1e28a003-1d1d-4c7c-a171-daa02f469e2e
# ╠═5e011dd7-5e53-413b-a639-ef00686337eb
# ╟─ef248c01-b156-4506-bc98-c32413bd9dcc
# ╟─fc2ea564-aae1-40a2-a910-b7a5f7095038
# ╟─2d2b7c7a-c86a-4d1f-9388-2e552fdd8faf
# ╠═b4bc1ed5-5ba8-43e5-84f7-5aaa00dbdcd8
# ╠═744a4408-5005-408e-80e5-0891ec9b6a12
# ╟─fa6f42ef-36c6-4ebb-a24b-fadf8eb545f9
# ╟─81fb81a7-4bee-4a31-9077-5be0a333ec73
# ╟─4751b837-0501-4668-8f29-4b4eb4f69dc3
# ╠═8853ceba-27a7-4483-b2f1-208d19b3f0cb
# ╠═f0188efd-e328-4132-9003-73dbe63a3d7e
# ╟─680cf7c4-de1f-4e1c-ac8b-379273903b8f
# ╟─37efa7d4-7fd7-43fc-ae94-9b15f3fe2925
# ╟─8c84a358-6efa-49b5-8eb7-ea57eaa1f996
# ╟─9f7529fa-dfa3-4e30-9db9-5921475b0d4b
# ╟─3e7bda6b-9c58-41ff-9c97-ac6711d11f15
# ╠═febd2b79-886b-4e6c-83b9-c6dee56db722
# ╟─d1835207-38b2-4ef7-8d2e-6aa9c3535821
# ╠═5905f5b5-a66d-4385-91e5-86f2fbd2557c
# ╟─5cb0f419-7a0b-4ba8-86dd-92727e5f41fb
# ╟─e4356df6-065f-4bcb-bff4-a61144289694
# ╟─8cef9ae4-1078-4537-9a20-e128339911eb
# ╟─6c41dfc7-646a-49c4-9fc3-5326bf893cef
# ╟─b40896b6-c8ce-43bd-9fe5-e1c2ef046158
# ╟─18a1dad3-9bc7-4ea5-9ff5-eb628e512567
# ╠═14fc559e-1e32-4fff-ad38-0e4ebfc079da
# ╟─9810b029-90b2-48f8-b7a5-4f7f2aacf08c
# ╠═ee729c71-0e2f-40d9-938a-b13eeb80efd5
# ╟─81d5191d-e9dc-4867-8910-3e8322ab067b
# ╠═c9f2fcca-8bb8-4e95-b8c3-b4ea95575b03
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
