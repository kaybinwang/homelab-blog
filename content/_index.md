---
title: Introduction
type: docs
---
# Introduction
Hello! This is my pseudo-blog that documents my journey around building a small
production Kubernetes cluster at home (i.e. a
[homelab](https://www.reddit.com/r/homelab/wiki/introduction/)).

## Motivation
You might be wondering, "Why would you build a cluster when services like AWS,
GCP, and Azure already exist?".

Well, I want to build a cluster because I like learning. I'm a software engineer
by day and I like to play with new technologies. Companies often have tight
access controls around their infrastructure since they don't want someone to
accidentally bring down their service. Building and maintaining a cluster allows
me to experiment with new technologies that I normally wouldn't get a chance to
at my job.

## Philosophy
Before we start, I want to set up some rules that I'll adhere to throughout the
process.

### Scale Responsibly
Some homelab setups immediately jump into a highly available cluster with
multiple redundancies throughout the stack. Instead, we'll start from zero and
scale out our system as we need it. This is to help:
  1) save costs on unnecessary hardware until we need it
  2) learn how to safely scale out an existing system

### Minimize Downtime
The cluster is a production environment. This means we need to minimize downtime
as much as possible. If we need to take nodes offline, then we need to come up
with a strategy to safely do that without any outages.

### Aggressively Test
Something that isn't talked about in a lot of homelab setups is testing.
Homelabs contain a lot of moving parts and something as simple as upgrading a
dependency could break the entire system. Instead, we will place an emphasis on
making sure every new feature is protected by at least one functional test.
Testing infrastructure can be tricky, so we'll have to come up with creative
strategies.
