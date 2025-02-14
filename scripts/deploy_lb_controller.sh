#!/bin/bash

aws iam create-policy \
    --policy-name eks-wakaran-handson-AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
LB_CONTROLLER_POLICY=`aws iam list-policies --output json | jq -r '.Policies[].Arn' | grep eks-wakaran-handson-AWSLoadBalancerControllerIAMPolicy`

eksctl create iamserviceaccount \
  --cluster=eks-wakaran-handson-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name eks-wakaran-handson-AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=${LB_CONTROLLER_POLICY} \
  --approve

helm repo add eks https://aws.github.io/eks-charts
helm repo update eks
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=eks-wakaran-handson-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller