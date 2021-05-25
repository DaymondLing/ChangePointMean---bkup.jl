# ChangePointMean

Detect change point of mean shift via cumsum randomization.

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://DaymondLing.github.io/ChangePointMean.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://DaymondLing.github.io/ChangePointMean.jl/dev)
[![Build Status](https://github.com/DaymondLing/ChangePointMean.jl/workflows/CI/badge.svg)](https://github.com/DaymondLing/ChangePointMean.jl/actions)

## Installation

This package is not registered in Julia's general registry.
You can add it via its URL:

```
] add https://github.com/DaymondLing/ChangePointMean.jl
```

## Purpose

If you are looking for general purpose change point detection, e.g.,
change in mean or variance or slope, this is not it.
[Changepoints](https://github.com/STOR-i/Changepoints.jl) is probably what you are looking for.

This is a simple (but useful) package for detecting mean shift in time series
via randomization test. It is non-parametric in the sense that there are
no distribution assumptions.
References can be found here:

- https://variation.com/wp-content/uploads/change-point-analyzer/change-point-analysis-a-powerful-new-tool-for-detecting-changes.pdf

- https://support.sas.com/resources/papers/proceedings17/1489-2017.pdf

## Current capabilities

This package has three exported functions:

- `mcpoint` returns the index of a change point (beginning of change)
if there is one, 0 otherwise

- `mcplast` returns the index of the most recent change point if there is one,
0 otherwise. This function repeatedly calls `mcpoint` on the more recent
(higher index) segment until it cannot detect any more changes.

- `mcpall` returns a vector of all change points, length of vector is
the number of change points detected via recursive partitioning.
This function recursively calls `mcpoint` on all resulting segments until
no changes can be detected.

There are two unexported functions:

- `mcppv` examines a vector and calculates the p-value of there being a
change point in mean via randomization test of the CUMSUM of the centered series.

- `mcptime` estimates the location of the change point by looking for the
point with minimum overall sum of squares.

`mcpoint` is built on top of these two functions.
