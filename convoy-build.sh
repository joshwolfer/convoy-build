#!/bin/bash

# Consul version example: 1.15.0-ent
# Envoy version example: v1.25.1

RED='\033[0;31m'
LINK='\033[1;34m'
NC='\033[0m' # No Color

if [ $# -eq 0 ]; then
    echo "Syntax: convoy-build <consul version> <envoy version>"
    echo ""
    echo "Example: ./convoy-build.sh 1.15.0-ent v1.25.1"
    echo ""
    echo -e "  Consul versions: ${LINK}https://hub.docker.com/r/hashicorp/consul-enterprise/tags${NC}"
    echo -e "  Envoy versions: ${LINK}https://hub.docker.com/r/envoyproxy/envoy/tags${NC}"
    echo ""
    echo -e "  Josh Wolfer Repo: ${LINK}https://hub.docker.com/r/joshwolfer/consul-envoy/tags${NC}"
    echo ""
    echo ""
    echo "Consul + Envoy Compatibility matrix:"
    echo -e "${LINK}https://developer.hashicorp.com/consul/docs/connect/proxies/envoy#envoy-and-consul-client-agent${NC}"
    echo ""
    exit 1
fi

CONVER="hashicorp/consul-enterprise:$1"
ENVVER="envoyproxy/envoy:$2"

JOSH1=$(echo $CONVER | awk -F: '{ print $2 }')
JOSH2=$(echo $ENVVER | awk -F: '{ print $2 }')

JOSHTAG="joshwolfer/consul-envoy:v$(echo $JOSH1)_$(echo $JOSH2)"

docker build --build-arg CONSUL_IMAGE=$CONVER --build-arg ENVOY_IMAGE=$ENVVER -t $JOSHTAG  .

docker push $JOSHTAG

