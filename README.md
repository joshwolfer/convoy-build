# Build a Docker image containing Consul and Envoy

Originally stolen from: [https://hub.docker.com/r/nicholasjackson/consul-envoy](https://hub.docker.com/r/nicholasjackson/consul-envoy)

This repo adds a script "convoy-build.sh" to automagically upload the new docker build into your own dockerhub account.

NOTE: Modify the script to use your own account details...

## Syntax

$ ./convoy-build.sh
Syntax: convoy-build <consul version> <envoy version>

Example: ./convoy-build.sh 1.15.0-ent v1.25.1

* Consul versions: https://hub.docker.com/r/hashicorp/consul-enterprise/tags
* Envoy versions: https://hub.docker.com/r/envoyproxy/envoy/tags

Consul + Envoy Compatibility matrix: [HERE](https://developer.hashicorp.com/consul/docs/connect/proxies/envoy#envoy-and-consul-client-agenthttps:/)
