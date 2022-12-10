# Tech Trends Project.
[![TechTrends - Package with Docker](https://github.com/adedayoas91/BoschUdacity_project4/actions/workflows/techtrends-dockerhub.yml/badge.svg)](https://github.com/adedayoas91/BoschUdacity_project4/actions/workflows/techtrends-dockerhub.yml)

TechTrends is an online website used as a news-sharing platform, that enables consumers to access the latest news within the cloud-native ecosystem. In addition to accessing the available articles, readers are able to create new media articles and share them. In this project, we packaged and deploy TechTrends Web application tunnelling CI/CD pipeline with the aid of tools, including but not limited to, Kubernetes, Argocd, Helm.

### STEPS IN THE PROJECT

Step 1: Creates docker images and tags them: Docker for Application Packaging.
<img width="1440" alt="Screenshot 2022-12-05 at 14 20 29" src="https://user-images.githubusercontent.com/47278559/206858432-a34be0c5-a66d-46ae-a70d-7156a5dfb171.png">

Step 2: GitHub actions: Continuous Integration with GitHub Actions:

        1. Create a new repo
        2. push your codes to the new repo
        3. Add the docker token and GitHub encrypted secrets from the project directory Goto `settings` > `secret` > `Actions` > click `New repository secret`
        4. Create the `techtrends-dockerhub.ymal` in the `.github/workflows/` Might be created automatically when creating the GitHub action.
        5. Goto `Github Actions` and click on the `create a new workflow yourself` button

![Screenshot (287)](https://user-images.githubusercontent.com/47278559/206715837-aed01f05-7be8-45a7-b530-fd6389555aa9.png)
![Screenshot (288)](https://user-images.githubusercontent.com/47278559/206715868-719b91cf-3a78-4f4c-b4ba-2aed60c44317.png)
![Screenshot (289)](https://user-images.githubusercontent.com/47278559/206715940-7de1f774-b5a6-4207-a243-f874e5136e9d.png)
![Screenshot (290)](https://user-images.githubusercontent.com/47278559/206715965-0f19bfa5-104a-4d28-888d-52e1e029bd24.png)
![Screenshot (291)](https://user-images.githubusercontent.com/47278559/206716053-4eac69e4-f454-4868-91c8-edca2ca8d29c.png)
![Screenshot (292)](https://user-images.githubusercontent.com/47278559/206716096-15a43f68-d516-41ab-90e8-c5054f11e46f.png)
<img width="1440" alt="Screenshot 2022-12-05 at 14 20 29" src="https://user-images.githubusercontent.com/47278559/206858577-7c2a23c0-ca00-4222-aa9c-cfed2fc1a618.png">
<img width="1440" alt="Screenshot 2022-12-05 at 14 11 37" src="https://user-images.githubusercontent.com/47278559/206858585-b17bd22a-a368-475f-aa9e-8d5d86312ec3.png">
<img width="1440" alt="Screenshot 2022-12-05 at 14 01 47" src="https://user-images.githubusercontent.com/47278559/206858595-3f255ffb-ce9a-44c8-87bc-b7c588f788e9.png">
<img width="1440" alt="Screenshot 2022-12-05 at 14 11 37" src="https://user-images.githubusercontent.com/47278559/206858447-dc36f759-0cdd-4b55-aa56-caf872e695bf.png">
<img width="1440" alt="Screenshot 2022-12-05 at 14 01 47" src="https://user-images.githubusercontent.com/47278559/206858461-9c56a33a-44e1-447c-b1a5-8ad6b2d10fd7.png">
<img width="1440" alt="Screenshot 2022-12-05 at 14 01 33" src="https://user-images.githubusercontent.com/47278559/206858467-f9178952-ea03-4292-8ef4-3254c0591600.png">
<img width="1440" alt="Screenshot 2022-12-05 at 13 58 08" src="https://user-images.githubusercontent.com/47278559/206858482-4086a224-74d3-460d-8efd-1fc3ae61ace1.png">



Step 3: Kubernetes Declarative Manifests 

### Deploy a Kubernetes cluster

Make sure your Oracle VM Box is open

### Create a vagrant box using the Vagrantfile in the current directory:

        `vagrant up`


### SSH into the vagrant box
### Note: this command uses the .vagrant folder to identify the details of the vagrant box, you can ls to make sure it is included
        `vagrant ssh`

### Deploy the Kubernetes cluster from the k3s documentation 

        `curl -sfL https://get.k3s.io | sh - `

### Give yourself the root access to kubeconfig 

        `sudo su`

### Get all nodes 

        `kubectl get no`

### create your Kubernetes Declarative Manifests file namespace.yaml, deploy.yaml and service.yaml

1. Rake a new file called namespace.yaml and vim into it to add your files.
2. Run below codes. 

        ```
        touch namespace.yaml
        touch deploy.yaml
        vim deploy.yaml
        touch service.yaml
        vim service.yaml
        ```

        ```

        kubectl apply -f namespace.yaml
        kubectl apply -f deploy.yaml
        kubectl apply -f service.yaml

        ```
![Screenshot (303)](https://user-images.githubusercontent.com/47278559/206717441-47dd1766-0dd8-4539-8e9d-a198693c0400.png)


Get all Kubectl namespace:

        ``` kubectl get all -n sandbox ```

Get all running pods:

        ``` kubectl get po -A ```

![Screenshot (304)](https://user-images.githubusercontent.com/47278559/206717503-20e8a890-2ffc-42a1-ac73-2e7dece44f31.png)
![Screenshot (305)](https://user-images.githubusercontent.com/47278559/206717534-4136e508-774e-4273-aa65-1d71be65534f.png)
![Screenshot (306)](https://user-images.githubusercontent.com/47278559/206717558-cb3aed0b-39c2-49c2-b5ea-66b8566199f1.png)
![Screenshot (307)](https://user-images.githubusercontent.com/47278559/206717624-1c50da93-19a6-410d-b1df-e5d06a41c3a9.png)
![Screenshot (308)](https://user-images.githubusercontent.com/47278559/206717670-55558061-f515-4b65-ae25-c7e4ce3f2cd0.png)


Step 4: Helm Charts

1. create the folder templates/ and add all required files.
2. create the chart.yaml, values.yaml etc 

Step 5: Continuous Delivery with ArgoCD

1. install AgroCD in your VM Box

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Note: After running the command, you need to wait for some time to get the container running after which you can continue

### Get all pods

        ``` kubectl get po -n argocd ```

### Get all services

        ``` kubectl get svc -n argocd ```


Now we need to expose it to the internet
First, you need to get the argocd-server from the list of service 

touch argocd-server-nodeport.yaml
vim argocd-server-nodeport.yaml
kubectl apply -f argocd-server-nodeport.yaml



![Screenshot (310)](https://user-images.githubusercontent.com/47278559/206719224-e7d3255c-bea8-4b18-b64e-1e591102b204.png)
![Screenshot (311)](https://user-images.githubusercontent.com/47278559/206719418-028a3e44-c671-4a39-b116-f216043ab391.png)

To login to argocd:

username: admin

password: run command 

`` kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo ``
>> The password returned in my case is "P5jfzFFf74uHb7yR"

![Screenshot (309)](https://user-images.githubusercontent.com/47278559/206719259-e9887995-95cb-4095-8f46-c0d37c17a674.png)

Other possible Kubernetes command options that can be run are as follows:


        ``kubectl describe po -n sandbox``

        ``touch helm-techtrends-staging.yaml``

        ``vim helm-techtrends-staging.yaml``

        ``touch helm-techtrends-prod.yaml``

        ``vim helm-techtrends-prod.yaml``

        ``kubectl apply -f helm-techtrends-staging.yaml``

        ``kubectl apply -f helm-techtrends-prod.yaml``

![Screenshot (318)](https://user-images.githubusercontent.com/47278559/206858695-8887adc3-b819-4a00-ae3f-64918261b927.png)
![Screenshot (319)](https://user-images.githubusercontent.com/47278559/206858686-237593fe-6824-4e73-bd04-425380594ed1.png)
![Screenshot (320)](https://user-images.githubusercontent.com/47278559/206858676-6a80ab65-58d2-48ea-a10e-51917a6329c7.png)
![Screenshot (321)](https://user-images.githubusercontent.com/47278559/206858667-9d667aa5-11de-4b97-886f-4b45a4cf1960.png)
![Screenshot (322)](https://user-images.githubusercontent.com/47278559/206858654-3f581e4b-826d-4355-9cc4-80c983740dd2.png)
![Screenshot (323)](https://user-images.githubusercontent.com/47278559/206858638-85c36def-7032-4994-bffc-5806ff135e1c.png)


Links to useful resources are as follows:

* Official install guide for [ArgoCD](https://argoproj.github.io/argo-cd/getting_started/#1-install-argo-cd).
* Log-in credentials can be retrieved using the steps in the [credentials guide](https://argoproj.github.io/argo-cd/getting_started/#4-login-using-the-cli).
* To deploy the Kubernetes cluster within the Vagrant ssh environment, refer to the [k3s documentation](https://k3s.io/).
* Ensure to have [vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) 6.1.16 or higher installed.
* Follow this link in order to [Build and Push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images).
* Click here to [create a DockerHub token](<https://www.docker.com/blog/docker-hub-new-personal-access-tokens/>).
* Follow this link to create [GitHub Encrypted Secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

