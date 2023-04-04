---
weight: 1
---
# Building a Minimal Raspberry Pi Cluster
Our first step is picking out the clusters hardware!

I decided to build the Kuberenetes cluster using Raspberry Pis. This is because
Raspberry Pis are generally low-cost, making them cheap to add and easy to
replace. In order to [scale responsibility]({{< ref "/#scale-responsibly" >}}),
we will only use two Raspberry Pis for the initial build. This will reduce
upfront costs and we will only add more nodes to the system when we need to.

Here's the list of hardware I'll be using.
  - 2 x [Raspberry Pi Model B w/ 4GB
    RAM](https://www.canakit.com/raspberry-pi-4-4gb.html): Latest Raspberry
    Pi model. I opted for the 4GB model since it's sufficient for most use cases
    and we currently don't have any high memory requirements at the moment.
  - 2 x [32GB microSDHC Memory
    Card](https://www.amazon.com/gp/product/B06XWMQ81P): System storage for each
    Raspberry Pi. You can get much better results using USBs or even SSDs, but
    it comes at a higher cost.
  - 2 x [Raspberry Pi PoE
    HAT](https://www.canakit.com/raspberry-pi-poe-hat.html) (optional): Used to
    power the Rasperry Pi over Ethernet, hence PoE. This costs extra but reduces
    the amount of cables needed to power each Raspberry Pi.
  - 1 x [Cat6A Ethernet Cable (6
    in)](https://www.amazon.com/gp/product/B07957VQBJ): Used to network the
    cluster nodes together. Can also power the Rasperry Pi when used with the
    PoE HAT.
  - 1 x [5 Port Network Switch](https://www.amazon.com/gp/product/B076HZFY3F)
    (PoE ports optional): Used to network the cluster nodes together using
    ethernet cables. PoE ports only necessary if you plan to use
    Power-over-Ethernet.
  - 1 x Cluster Case (optional): Enclosure to help keep everything organized and
    bundled together.

At this time, the total costs came in around $250 USD. Not bad!

## Assembly
