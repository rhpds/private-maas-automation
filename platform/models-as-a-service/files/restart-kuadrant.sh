#!/bin/bash

set -e

sleep 30

oc delete pod -n openshift-operators -l app=kuadrant,control-plane=controller-manager
sleep 1
oc rollout status -n openshift-operators deployment/kuadrant-operator-controller-manager

sleep 30

oc delete pod -n kuadrant-system -l authorino-resource=authorino,control-plane=controller-manager
oc delete pod -n kuadrant-system -l limitador-resource=limitador,app=limitador
sleep 1
oc rollout status -n kuadrant-system deployment/authorino
oc rollout status -n kuadrant-system deployment/limitador-limitador
