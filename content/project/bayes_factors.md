+++
# Date this page was created.
date = "2016-04-27"

# Project title.
title = "Bayes factors"

# Project summary to display on homepage.
summary = 'Anomalies in high-energy physics with Bayes factors. (Image from [Bayesian spectacles](https://www.bayesianspectacles.org/library/) under [CC license](https://creativecommons.org/licenses/by-sa/2.0/).)'

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "bayesian_magic.jpg"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["bayes-factors", "bayesian", "np", "dm"]

# Does the project detail page use math formatting?
math = false

+++

Anomalies in high-energy physics are almost always judged by (global) $p$-values and significances. I propose that we instead judge anomalies using so-called Bayes factors. I applied this to [indirect searches for dark matter by DAMPE](/publication/dampe_significance) and the [750 GeV diphoton excess](/publication/diphoton). 

Summarising [Berger et al, 2001](http://www.jstor.org/stable/4356165?seq=1#page_scan_tab_contents),

+ Bayes factors are easy to understand - *p*-values, on the other hand, are frequently misinterpreted, even by scientists.
+ Bayes factors may be applied to more than two models, non-nested models and cases in which asymptotic formulae cannot apply.
+ Bayes factors include an automatic Occam's razor, punishing e.g., fine-tuning.

Bayes factors are ratios of evidences,
$$
\text{BF} = \frac{\text{Evidence for model $A$}}{\text{Evidence for model $B$}},
$$
where an evidence is the probability of our observed data given a particular model. Bayes factors
update our relative belief in models in light of experimental data, 
$$
\text{Relative belief after data} = \text{BF} \times \text{Relative belief before data}.
$$
For example, a Bayes factor of ten in favour of model $A$ means that it is ten times more 
plausible relative to model $B$ than it was before our experiment.
