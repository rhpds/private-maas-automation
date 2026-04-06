#!/bin/bash

set -e

sleep 30

oc delete pod -n openshift-operators -l app=kuadrant,control-plane=controller-manager
sleep 1
oc rollout status -n openshift-operators deployment/kuadrant-operator-controller-manager
