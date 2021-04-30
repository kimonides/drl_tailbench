# drl_tailbench
[Tailbench](http://tailbench.csail.mit.edu/) is a benchmarking suit for Latency-Critical Applications.  
drl_tailbench is a custom tailbench made for the purposes of [Dynamic Resource Allocation](https://github.com/kimonides/Dynamic-Resource-Allocation)
so as to be able to test the project.  
The original Tailbench has only the choice for constant Requests per Second while in contrast drl_tailbench can also take a file with tuples
of (time,RPS) and run them in a loop forever(for example to simulare RPS over the duration of a day).

## Description

The controller leverages deep reinforcement learning to achieve the best possible resource utilization by making sure that the latency critical application gets all the resources it needs to achieve a good response time while giving any unneeded resources to batch workloads.

## Getting Started

### Dependencies
* Python3
* Stable Baselines 3
* [Custom PCM for this project](https://github.com/kimonides/drl_pcm)
* [Custom Tailbench for testing purposes](https://github.com/kimonides/drl_tailbench)
* Numpy

### Installing

* To install drl_tailbench in the host machine just check tailbench/README
* To build the docker image just run the Dockerfile

### Executing program
Check tailbench/README

