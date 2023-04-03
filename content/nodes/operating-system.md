---
title: Operating System
weight: 2
---
# Operating System
Now that we have assembled the [hardware]({{< ref "/nodes/initial-hardware" >}}),
we'll move onto installing and configuring the operating system.

## Selection Criteria
The hardest part is choosing which OS to install. There are so many different
options out there -- several of which are suitable for running a headless
server. Some operating systems like [Talos Linux](https://www.talos.dev/), are
even futher optimized for only running Kubernetes.

Since we have no functional requirements at the moment, we'll optimize for
simplicity and iteration speed. This is so that we can quickly develop a working
prototype that we can iterate on. In the face of unknown requirements, we'll
follow the [KISS principle](https://en.wikipedia.org/wiki/KISS_principle) and choose
the simplest option with the most support.

As a result, we'll be installing [Raspberry Pi
OS](https://www.raspberrypi.com/software/) onto each node. Choosing this
operating system has some nice benefits that will make our lives easier for the
initial setup.
  - Specifically designed for Raspberry Pi hardware
  - Provides simple interfaces for configuring firmware (e.g. fan controls)

Note that this is not a permanent decision. As our cluster develops, we'll
discover new requirements and those new requirements might require a completely
different operating system. However, at this point in time, it's too early to
predict what those future requirements might be.

## Installation

### Raspberry Pi OS
We can install Raspberry Pi OS onto each node using the [Raspberry Pi
Imager](https://www.raspberrypi.com/software/). This tool can flash our SD cards
using a pre-built OS image. It can also configure other things like enabling SSH,
setting your username and password, etc.

Download and launch the tool. We'll select `Raspberry Pi OS Lite (64-bit)` for
the `Operating System`. Raspberry Pi OS Lite is a stripped down version of
Raspberry OS. It's perfect for our use case because it doesn't include
unnecessary bloat like a GUI.

{{< hint info >}}
**Note**

We technically could get away with using a 32-bit architecture since each node
only has access to 4GB of RAM. However, there's usually much better software
support for 64-bit architecture when it comes to servers (e.g. `arm64`).
{{< /hint >}}

### Update System
Now we can SSH into each node so that we can configure the system.
```bash
ssh <username>@<node-hostname>
```

Once we're on the node, we can update the system and packages.
```bash
$ sudo apt-get update && sudo apt-get upgrade
```

      sudo sdfu
      sdfsdf

### Define Static IP
Now, we want to define a static IP address for each node so that we don't need
to worry about the IP address changing or getting reassigned to a different
machine on the network. This will simplify the way the nodes communicate with
each other.

{{< hint info >}}
**Note**

It's possible for all the nodes in the cluster to have dynamic IPs, but this
requires a more advanced setup.
{{< /hint >}}

We need to choose an IP address that's on the same subnet as our LAN router
that's also outside the router's (or DHCP server's) assignable IP address range.
For example, my LAN subnet is `192.168.1.0/24` which means my router assigns IP
addresses from `192.168.1.1` to `192.168.1.255`.

Edit `/etc/dhcpcd.conf` so that it looks like this

    interface eth0
    static ip_address=192.168.1.164/24
    static routers=192.168.1.1
    static domain_name_servers=192.168.1.1 8.8.8.8

### Modify Fan Thresholds
Make changes

### Reboot
`sudo reboot`

## Repeat
Now just repeat the same setup for all the other nodes and we're done!

Note that this process is very manual, but we're only managing two nodes at the
moment. Eventually we'll want to automate it. I know there are tools out there
like `ansible`, `chef`, `salt`, etc.
