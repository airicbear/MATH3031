### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 680ca916-cf7f-4eff-a7fa-d4647fa232e4
md"# Exam 1 Review"

# ╔═╡ 4595ce55-6322-45b0-86f6-ba1be39d241d
md"""
## Counting

1. Multiplication Principle

2. Division Principle

3. ``2^n`` - subsets of a set of size ``n``

4. ``n!`` - rearrangements of ``n`` distinct objects

5. ``P(n, k) = \frac{n!}{(n - k)!}`` - arrangements of ``k`` out of ``n`` things

6. ``C(n, k) = \begin{pmatrix} n \\ k \end{pmatrix} = \frac{n!}{k! (n - k)!}`` - ``k``-subsets of a set of size ``n``

7. Binomial Theorem:

   $(x + y)^n = \sum_{k = 0}^n \begin{pmatrix} n \\ k \end{pmatrix} x^k y^{n - k}$
"""

# ╔═╡ d6ab37d2-af96-4c16-870f-e821d0cbdbe3
md"""
## Discrete Probability Spaces

- Sample space ``Ω``, outcome ``\omega ∈ Ω``, event ``A ⊆ Ω``

- Random variable ``X : Ω → ℝ``

- Distribution on ``Ω``, distribution on ``X``

- Uniform - ``P(\omega) = 1/n``

- Binomial ``(n,p)`` - ``P(X = k) = \begin{pmatrix} n \\ k \end{pmatrix} p^k (1 - p)^{n - k}``, ``E(X) = np``, ``V(X) = np(1 - p) = npq``

- Poisson (``\lambda``) - ``P(X = k) = (\lambda ^k / k!) e^{-\lambda}``, ``E(X) = \lambda``, ``V(X) = \lambda``
"""

# ╔═╡ 7dc70d0f-bcf2-480f-96fb-80dfbb0331fb
md"""
## Continuous Probability Spaces

1. p.d.f - ``f(x)`` so that ``\displaystyle P(a ≤ X ≤ b) = ∫_a^b f(x) \;dx``

2. c.d.f. - ``F(x)`` so that ``\displaystyle F(x) = P(X ≤ x) = ∫_{-∞}^x f(t) \;dt``

3. Uniform - ``f(x)`` constant on a bounded interval ``[a, b]``,
   ``E(X) = (a + b)/2``, ``V(X) = (b - a)^2 / 12``

4. Exponential (``\lambda``) - ``f(x) = \lambda e^{-\lambda x}`` for ``x ≥ 0`` (0 otherwise),
   ``E(X) = 1/\lambda``, ``V(X) = 1/\lambda^2``
"""

# ╔═╡ fda7ef6b-401c-456c-ac69-32e1233d6060
md"""
## Conditional Probability

- ``P(A ∣ B) = \frac{P(A ∩ B)}{P(B)}``

- Independent Events: ``P(A ∣ B) = P(A)`` and ``P(B ∣ A) = B``
  (or at least one has probability 0).
  Equivalently: ``P(A ∩ B) = P(A)P(B)``

- Independent Discrete Variables: ``P(X = a, Y = b) = P(X = a)P(Y = b)`` for all ``a,b``.

- Independent Continuous Variables: ``F(x,y) = F_X(x) F_Y(y)`` for all ``x,y``.
  Equivalently: ``f(x,y) = f_X(x) f_Y(y)`` for all ``x,y``.

- Bayes' Theorem: ``\displaystyle P(H ∣ E) = \frac{P(E ∣ H)P(H)}{P(E ∣ H)P(H) + P(E∣\bar{H})P(\bar{H})}``
"""

# ╔═╡ 76572d08-6e7d-45d9-b2dd-20201a34134a
md"""
## Expected Value - ``\mu``

- If ``X`` is discrete, ``E(X) = \sum_x xP(X = x)`` (if converges absolutely)

- If ``X`` is continuous, ``E(X) = ∫_{-∞}^{+∞} xf(x) \;dx`` (if converges absolutely)

- (Linearity) ``E(aX + bY) = aE(X) + bE(Y)``.

- If ``X,Y`` independent, then ``E(XY) = E(X)E(Y)``.
"""

# ╔═╡ 5f49b5fd-ef6b-4c3c-9863-109fc9b0fbc2
md"""
## Variance - ``\sigma^2``

1. ``V(X) = E((X - \mu)^2) = E(X^2) - \mu^2``

2. ``V(X + c) = V(X), \; V(cX) = c^2 V(X)``

3. If ``X, Y`` independent, then ``V(X + Y) = V(X) + V(Y)``.

4. Standard Deviation ``\sigma = \sqrt{V(X)}``
"""

# ╔═╡ 12d22ca2-4262-11ec-36a2-371780257967
md"# Exam 2 Review"

# ╔═╡ dc7d6dac-ee96-4d54-aa57-09b9588826e4
md"""
## Convolution

1. If $X, Y$ are independent and $Z = X + Y$, then (discrete version)

   $p_Z(k) = p_X ∗ p_Y = \sum_i p_X(i) p_Y(k - i) = \sum_i P(X = i) P(Y = k - i)$

   or (continuous version)

   $f_Z(z) = (f_X ∗ f_Y)(z) = ∫_{-∞}^∞ f(z - y) g(y) \;dy = ∫_{-∞}^∞ f(x) g(z - x) \;dx$

2. The convolution of binomial distributions $X$ with parameters $n, p$ and $Y$ with parameters $m, p$ is binomial with parameters $n + m, p$.

3. The convolution of normal distributions $X$ with mean $\mu_1$ and variance ${\sigma_1}^2$ and $Y$ with mean $\mu_2$ and variance ${\sigma_2}^2$ is normal with mean $\mu_1 + \mu_2$ and variance ${\sigma_1}^2 + {\sigma_2}^2$.
"""

# ╔═╡ 449af5cd-4cbd-45d4-b4d3-9719944d9eed
md"""
## Law of Large Numbers

1. Chebyshev's Inequality: if $E(X) = \mu$, then $P(|X - \mu| ≥ \epsilon) ≤ \frac{V(X)}{\epsilon^2}$.

2. LLN: If $X_i$ are individual trials with $E(X_i) = \mu$ and $S_n = X_1 + ⋯ + X_n$, then

$\begin{align*}
P\left(\left|\frac{S_n}{n} - \mu\right| ≥ \epsilon\right) &→ 0 \\
P\left(\left|\frac{S_n}{n} - \mu\right| < \epsilon\right) &→ 1 \\
\end{align*}$
"""

# ╔═╡ c7814baa-3d36-4e0b-8cd9-0491933ab8c1
md"""
## Central Limit Theorem

1. Standardized sums: $\displaystyle S_n^∗ = \frac{S_n - n\mu}{\sqrt{n\sigma^2}} = \frac{j - n\mu}{\sqrt{n\sigma^2}}$

2. ``\phi(x)`` is the standard normal density function, $\displaystyle \text{NA}(a, b) = ∫_a^b \phi(x) \;dx$.

3. CLT v1: For large $n$, $\displaystyle P(S_n = j) ≈ \frac{\phi(x_j)}{\sqrt{n\sigma^2}}$

4. CLT. v2: For large $n$, $P(i ≤ S_n ≤ j)$ is approximately

   $P\left(\underbrace{\frac{i - n\mu - 0.5}{\sqrt{n\sigma^2}}}_{a^*} ≤ S_n^* ≤ \underbrace{\frac{j - n\mu + 0.5}{\sqrt{n\sigma^2}}}_{b^*}\right) ≈ \text{NA}(a^∗, b^∗)$
"""

# ╔═╡ 5d383c6a-8304-40d1-9a6a-353d9030b3aa
md"""
## M.G.F. (Discrete)

1. The $k$th moment: $\displaystyle \mu_k = E(X^k) = \sum x^k P(X = x)$

2. Moment generating function:

   $g_X(t) = E(e^{tX}) = \sum_{k = 0}^{∞} \frac{\mu_k t^k}{k!} = \sum_{j = 1}^{∞} e^{tx_j} P(X = x_j)$

3. Calculating moments: $\mu_k = g^{(k)}(0)$

4. ``X`` binomial with parameters $n, p: g(t) = (pe^t + q)^n$

5. ``X`` geometric with parameter $\displaystyle p: g(t) = \frac{pe^t}{1 - qe^t}$

6. ``X`` Poisson with parameter $\lambda: g(t) = e^{\lambda (e^t - 1)}$.
"""

# ╔═╡ bec19731-a093-4992-bb0d-cb10d5a50dae
md"""
## M.G.F. (Continuous)

1. The $k$th moment: $\displaystyle \mu_k = E(X^k) = ∫_{-∞}^∞ x^k f_X(x) \;dx$

2. Moment generating function:

   $g_X(t) = E(e^{tX}) = \sum_{k = 0}^∞ \frac{\mu_k t^k}{k!} = ∫_{-∞}^∞ e^{tx} f_X(x) \;dx$

3. Calculating moments: $\mu_k = g^{(k)}(0)$

4. ``X`` uniform on $\displaystyle [a, b]: g(t) = \frac{e^{bt} - e^{at}}{(b - a)t}$

5. ``X`` exponential with parameter $\lambda: g(t) = \frac{\lambda}{t - \lambda}$ (for $t < \lambda$)

6. (D/C) If $Y = aX$, $g_Y(t) = g_X(at)$

7. (D/C) If $Y = X + b$, $g_Y(t) = e^{bt} g_X(t)$

8. (D/C) If $X, Y$ independent, then $g_{X + Y}(t) = g_X(t) g_Y(t)$.
"""

# ╔═╡ 3b3c6cc6-eefe-41ff-b2df-1bb80b549b1c
md"""
## Markov Chains

1. Transition matrix $𝐏$, $p_{ij}$ is $P(s_i → s_j)$

2. ``i, j`` entry of $𝐏^n$ is $p_{ij}^{(n)}$, $P(s_i \overset{n \text{ steps}}⟶ s_j)$

3. State $s_i$ is absorbing if $P(s_i → s_i) = 1$, $𝐏$ is absorbing if all states can eventually absorb

4. For absorbing chains, there is a canonical form $𝐏 = \begin{bmatrix} 𝐐 & 𝐑 \\ 𝟎 & 𝐈 \end{bmatrix}$

5. Fundamental matrix: $𝐍 = (𝐈 - 𝐐)^{-1}$, $n_{ij}$ is expected number of times in state $s_j$ if starting in $s_i$

6. ``𝐭 = 𝐍\begin{bmatrix} 1 \\ ⋮ \\ 1 \end{bmatrix}`` entries measure expected time until absorbing

7. ``𝐁 = 𝐍𝐑`` entries measure probability of absorbing into particular states
"""

# ╔═╡ 34a7bf93-286f-43a1-b41c-53b832174dc4
md"# Final Exam Review"

# ╔═╡ 51bf55cc-dd45-496c-9275-f60fd05c2484
md"""
## Regular/Ergodic Markov Chains

1. ``𝐏`` is *ergodic* if you can get from any state to any state eventually.

2. ``𝐏`` is *regular* if you can get from any state to any state in some fixed number of steps.
   Equivalently, ``𝐏`` is *regular* if ``𝐏^n`` is strictly positive for some ``n``.

3. All regular chains are ergodic, but not the other way around.

4. A *fixed probability vector* ``𝐰`` satisfies ``𝐰𝐏 = 𝐰``.
   An ergodic ``𝐏`` has a unique fixed probability vector, all of whose entries are positive.

5. (Regular) ``\displaystyle \lim_{n → ∞} 𝐏^n = 𝐖``, all of whose rows are ``𝐰``.

6. (Ergodic) ``\displaystyle \lim_{n → ∞} 𝐀^n = 𝐖``, all of whose rows are ``𝐰``.

   ``\displaystyle \left(𝐀_n = \frac{𝐈 + 𝐏 + 𝐏^2 + ⋯ + 𝐏^n}{n + 1}\right)``
"""

# ╔═╡ 260b1568-7093-4ed0-bc84-8a6489a66dbc
md"""
## Mean First Passage/Recurrence Time

1. Let ``𝐏`` be ergodic with fixed probability vector ``𝐰``.

2. ``m_{ij}`` is the expected number of steps to get to ``s_j`` when starting at ``s_i``.
   ``m_{ii} = 0``.
   To find ``m_{ij}``, rewrite ``𝐏`` as ``\hat{𝐏}`` with ``s_j`` as an absorbing state and find ``𝐍``.

3. ``r_i`` is the expected number of steps to get back to ``s_i`` when starting at ``s_i``.
   For each ``i``, ``r_i = 1/w_i``.

4. Relationship: ``r_i = 1 + \sum_k p_{ik} m_{ki}``.
"""

# ╔═╡ Cell order:
# ╟─680ca916-cf7f-4eff-a7fa-d4647fa232e4
# ╟─4595ce55-6322-45b0-86f6-ba1be39d241d
# ╟─d6ab37d2-af96-4c16-870f-e821d0cbdbe3
# ╟─7dc70d0f-bcf2-480f-96fb-80dfbb0331fb
# ╟─fda7ef6b-401c-456c-ac69-32e1233d6060
# ╟─76572d08-6e7d-45d9-b2dd-20201a34134a
# ╟─5f49b5fd-ef6b-4c3c-9863-109fc9b0fbc2
# ╟─12d22ca2-4262-11ec-36a2-371780257967
# ╟─dc7d6dac-ee96-4d54-aa57-09b9588826e4
# ╟─449af5cd-4cbd-45d4-b4d3-9719944d9eed
# ╟─c7814baa-3d36-4e0b-8cd9-0491933ab8c1
# ╟─5d383c6a-8304-40d1-9a6a-353d9030b3aa
# ╟─bec19731-a093-4992-bb0d-cb10d5a50dae
# ╟─3b3c6cc6-eefe-41ff-b2df-1bb80b549b1c
# ╟─34a7bf93-286f-43a1-b41c-53b832174dc4
# ╟─51bf55cc-dd45-496c-9275-f60fd05c2484
# ╟─260b1568-7093-4ed0-bc84-8a6489a66dbc
