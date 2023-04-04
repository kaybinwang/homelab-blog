---
title: Home
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
scale out our system as we need it. This is so that we can:
  1) Save money by only purchasing new hardware when we need it
  2) Learn how to safely add and upgrade hardware in an existing system

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

## Timeline
I call this a psuedo blog since the posts are not organized chronologically.
This is so that readers can see all the content upfront and focus on whatever
topics that they are interested in.

Here's the timeline if you are interested in seeing how the build developed
chronologically.
  1. [Initial Hardware]({{< ref "/nodes/hardware/initial-hardware" >}})
  2. [Operating System]({{< ref "/nodes/operating-system" >}})
