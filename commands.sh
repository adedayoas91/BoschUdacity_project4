#!/usr/bin/env bash

#fire up vagrant to run in VBox
vagrant up

6#sh into vagrant server and give it sudo access
vagrant ssh
sudo su

#install k8s on the vagrant host
curl -sfL https://get.k3s.io | sh -
k3s kubectl get no

# create namespace.yaml, deploy.yaml, and service.yaml file.
# vim will prompt you to put codes for each. after putting the codes, exit and save with ``:wq``
touch namespace.yaml
vim namespace.yaml

touch deploy.yaml
vim deploy.yaml

touch service.yaml
vim service.yaml

# apply k8s on all 3 .yaml files above

kubectl apply -f namespace.yaml 
kubectl apply -f deploy.yaml 
kubectl apply -f service.yaml 

# run to get all sandboxes
kubectl get all -n sandbox

kubectl get po -A

#create and apply argocd namespace with k8s, then check all pods
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get po -n argocd


# create and supply code for argocd-server-nodeport.yaml, the apply k8s
touch argocd-server-nodeport.yaml
vim argocd-server-nodeport.yaml

kubectl apply -f argocd-server-nodeport.yaml

# get all services in argocd 
kubectl  get svc -n argocd

#create staging and prod config files - helm-techtrends-prod.yaml and helm-techtrends-prod.yaml 
touch helm-techtrends-staging.yaml

vim helm-techtrends-staging.yaml

touch helm-techtrends-prod.yaml

vim helm-techtrends-prod.yaml

# apply k8s on both helm files
kubectl apply -f helm-techtrends-staging.yaml

kubectl apply -f helm-techtrends-prod.yaml
