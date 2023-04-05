# Installing K3s

## What is K3s
Kubernetes (sometimes stylized as k8s) is a container orchestration framework
that abstracts the operational overhead of deploying and managing containers
across multiple nodes inside a cluster.

Kubernetes is usually deployed in cloud environments and has a lot of
integrations with different cloud providers. This adds a lot of unnecessary
bloat for folks that want to deploy Kubernetes onto a bare metal cluster.

K3s (a play on k8s) is a Kubernetes distribution that strips down a lot of the
unnecessary parts. It is optimized for bare metal environments. It's often used
in edge environments.

## Installation
Now we need to install Kubernetes onto each node. The installation process
depends on whether the node will be a server node or an agent node.

### Server Node
First we install k3s onto the server nodes by running the following command.
```bash
$ curl -sfL https://get.k3s.io | sh -s - --disable=servicelb,cloud-controller,helm-controller
```

{{< hint info >}}
**Note:**
You can pass the `--disable` flag to disable installing certain services. For
example, if you plan on install MetalLB, you should disable the built in
service load-balancer by providing this option `--disable=servicelb`.
{{< /hint >}}

Note that we disable the following services:
  - servicelb (replaced with MetalLB)
  - cloud-controller (unused)
  - helm-controller (unused)

After this is installed, you can view the cluster's `kubeconfig` using the following command.

```bash
$ cat /etc/rancher/k3s/k3s.yaml
```

You should copy this to your local system's `~/.kube/config` and modify the
`127.0.0.1` host with the server node IP so that you can access the cluster
locally.

Finally, if you plan on adding agent nodes then you should print out the node
token by running
```bash
$ cat /var/lib/rancher/k3s/server/node-token
```
We will need this token in the next step.

### Agent Node
Next we install the k3s onto the agent nodes by running the following command.
```bash
$ curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -
```
You need to substitute a value for `myserver` and `mynodetoken`.

## Testing
After installing, let's test it out
```bash
$ sudo kubectl get nodes
NAME       STATUS   ROLES                  AGE   VERSION
applepi    Ready    control-plane,master   20m   v1.25.7+k3s1
bananapi   Ready    <none>                 20m   v1.25.7+k3s1
```
