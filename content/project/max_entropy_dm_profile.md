+++
# Date this page was created.
date = "2016-04-27"

# Project title.
title = "Uncertainty in the Dark Matter Velocity Profile"

# Project summary to display on homepage.
summary = "Using Quantified Maximum Entropy to model uncertainty in the dark matter velocity profile."

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "max_ent_web.png"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["dm", "bayesian", "np"]

# Does the project detail page use math formatting?
math = false

+++


Direct detection experiments search for dark matter in interactions with detectors on earth. The relative velocity of dark matter with respect to the detectors is,
however, unknown. In [[1]](/publication/max_ent_1), we pioneered the use of Quantified Maximum Entropy to model the uncertainty in the velocity distribution and applied it to DAMA/LIBRA. In [[2]](/publication/max_ent_1) we developed a novel numerical approximation and applied it to XENON1T.

In both works, we constructed an entropic prior for the velocity distribution,
$$
p(f) \propto e^{\beta S[f, m]},
$$
where $\beta$ is a hyperparameter governing the strength of our belief in the default distribution, $m$, and
$$
S[f, m] = \int f(v) \ln\left(\frac{f(v)}{m(v)}\right) dv
$$
is the relative entropy between the distributions $f$ and $m$.
