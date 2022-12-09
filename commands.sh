#!/usr/bin/env bash

vagrant up

vagrant ssh
sudo su

curl -sfL https://get.k3s.io | sh -
k3s kubectl get no

touch namespace.yaml
vim namespace.yaml

touch deploy.yaml
vim deploy.yaml

touch service.yaml
vim service.yaml

kubectl get all -n sandbox

kubectl get po -A
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get po -n argocd


touch argocd-server-nodeport.yaml
vim argocd-server-nodeport.yaml

kubectl apply -f argocd-server-nodeport.yaml

kubectl  get svc -n argocd

