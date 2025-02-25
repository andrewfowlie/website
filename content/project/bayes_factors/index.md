+++
# Date this page was created.
date = "2016-04-27"

# Project title.
title = "Bayes factors"

# Project summary to display on homepage.
summary = 'Anomalies in high-energy physics with Bayes factors'

[image]
  caption = "Image from [Bayesian spectacles](https://www.bayesianspectacles.org/library/) under [CC license](https://creativecommons.org/licenses/by-sa/2.0/)"
  focal_point = "Smart"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["bayes-factors", "bayesian", "np", "dm"]

# Does the project detail page use math formatting?
math = true

+++

### [Is it permitted for a physicist to join the fun in this Neo-Bayesian vs. orthodox fight?](/resources/jaynes/bayes_again.pdf)

Anomalies in high-energy physics are almost always judged by (global) $p$-values and significances. I propose that we instead judge anomalies using so-called Bayes factors. I applied this to [indirect searches for dark matter by DAMPE](https://arxiv.org/abs/1712.05089) and the [750 GeV diphoton excess](https://arxiv.org/abs/1607.06608).

Summarising [Berger et al, 2001](http://www.jstor.org/stable/4356165?seq=1#page_scan_tab_contents),

+ Bayes factors are easy to understand - $p$-values, on the other hand, are frequently misinterpreted, even by scientists.
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

There are many interesting discussions about the merits of Bayes factors at [Bayesian Spectacles](https://www.bayesianspectacles.org/). For an early discussion, see [Rozeboom, 1960](stats.org.uk/statistical-inference/Rozeboom1960.pdf).

It is often remarked that $p$-values overstate the evidence against the null (see e.g. [Berger & Selke, 1987](https://amstat.tandfonline.com/doi/abs/10.1080/01621459.1987.10478397)). I investigated this in the context of [resonance searches at the LHC](https://arxiv.org/abs/1902.03243), finding that indeed $p$-values could overstate the evidence against the background-only model by about $1\sigma$ in that setting.
