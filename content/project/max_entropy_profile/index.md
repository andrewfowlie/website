+++
# Date this page was created.
date = "2016-04-27"

# Project title.
title = "Uncertainty in the Dark Matter Velocity Profile"

# Project summary to display on homepage.
summary = "Using Quantified Maximum Entropy to model uncertainty in the dark matter velocity profile."

[image]
  focal_point = "Smart"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["dm", "bayesian", "np"]

# Does the project detail page use math formatting?
math = false

+++


Direct detection experiments search for dark matter in interactions with detectors on earth. The relative velocity of dark matter with respect to the detectors is,
however, unknown. In [[1]](https://arxiv.org/abs/1708.00181), we pioneered the use of Quantified Maximum Entropy (see e.g., [Skilling](https://link.springer.com/chapter/10.1007/978-94-009-0683-9_21)) to model the uncertainty in the velocity distribution and applied it to DAMA/LIBRA. In [[2]](https://arxiv.org/abs/1809.02323) we developed a novel numerical approximation and applied it to XENON1T.

In both works, we constructed an entropic prior for the velocity distribution,
$$
p(f) \propto e^{\beta S[f, m]},
$$
where $\beta$ is a hyperparameter governing the strength of our belief in the default distribution, $m$, and
$$
S[f, m] = \int f(v) \ln\left(\frac{f(v)}{m(v)}\right) dv
$$
is the relative entropy between the distributions $f$ and $m$.
