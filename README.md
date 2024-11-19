# **Restaurant Menu Application with Infrastructure as Code**

This repository contains the codebase and infrastructure definitions for deploying a fullstack **Restaurant Menu Application**. The setup uses **Terraform** for provisioning cloud infrastructure and **GitHub Actions** for automating the CI/CD pipeline.

## **Project Structure**
```
.

├── restaurant-code-base/ \# Codebase for the Restaurant Menu Application

│ ├── restaurant-menu-backend/ \# Backend application (Django REST API)

│ ├── restaurant-menu-frontend/ \# Frontend application (Next.js)

│ ├── k8s/ \# Kubernetes manifests for deployment

│ ├── .github/ \# GitHub Actions Workflow YAML

│ └── kubeconfig.yaml \# Kubernetes configuration file for AKS

│

└── terraform/ \# Infrastructure as Code (Terraform)

   ├── acr/ \# Azure Container Registry (ACR)

   ├── database/ \# PostgreSQL database (Azure Database for PostgreSQL)

   ├── kubernetes/ \# Azure Kubernetes Service (AKS)

   └── network/ \# Virtual Network and Subnets
```
## 

## **Overview**

### **Application**

The **Restaurant Menu Application** is a fullstack app designed to manage a restaurant's menu:

* **Backend**: Built with **Django** and **Django** **REST** **Framework** for API functionalities.  
* **Frontend**: Developed with **Next.js** to provide an interactive user interface.

### **Infrastructure**

The infrastructure is fully automated using **Terraform** and includes:

1. **Azure Kubernetes Service (AKS)** for container orchestration.  
2. **Azure Container Registry (ACR)** for storing Podman images.  
3. **Azure PostgreSQL** as the database backend.  
4. **Azure Virtual Network** to connect all resources securely.

### **CI/CD Pipeline**

The repository leverages **GitHub Actions** to:

1. Build Podman images for backend and frontend.  
2. Push the images to Azure Container Registry (ACR).  
3. Deploy the application to AKS.

## 

## **Getting Started**

### **Prerequisites**

1. **Azure CLI** installed and configured.  
2. **Terraform CLI** installed.  
3. Access to an Azure Subscription.  
4. Basic knowledge of Kubernetes, Podman, and Terraform.

## **Steps to Deploy**

### **1\. Provision Infrastructure**

Navigate to the terraform/ directory and follow the steps below:

#### **Initialize Terraform**
```
$ cd terraform/\<module\>

$ terraform init
```
#### **Apply Terraform Configurations** 

For each module (network, database, acr, kubernetes), run:
```
$ Terraform plan

$ terraform apply
```
#### **Outputs**

Ensure all outputs are configured correctly before proceeding.

### **2\. Application Deployment**

#### **Build and Push Podman Images**

GitHub Actions will automatically:

1. Build Podman images using the Podmanfiles in restaurant-menu-backend/ and restaurant-menu-frontend/.  
2. Push images to Azure Container Registry (ACR).

#### **Deploy to AKS** 

The Kubernetes manifests in k8s/ are applied to deploy the backend and frontend:
```
$ kubectl apply \-f k8s/frontend.yaml

$ kubectl apply \-f k8s/backend.yaml
```
#### **Access the Application**

After deployment, the frontend service will expose an external IP. Retrieve it using:
```
$ kubectl get service frontend-service
```
Access the app at:

http://\<EXTERNAL\_IP\>:3000

**Frontend (Next.js): [http://20.235.195.125:3000/](http://20.235.195.125:3000/)**

**Backend API (Django): [http://20.235.195.143:8000/api/menu-items/](http://20.235.195.143:8000/api/menu-items/)**

## 

## **Repository Workflow**

1. **Code Changes**

Push any changes to the main branch to trigger the CI/CD pipeline.

2. **CI/CD Pipeline**

Automatically builds and deploys the updated application using GitHub Actions.

3. **Kubernetes Resources**

Kubernetes manifests in k8s/ are used to manage deployments and services.

## **Terraform Modules**

1. **Network**

Defines a virtual network and subnets to connect resources securely.

2. **ACR**

Creates an **Azure Container Registry** for storing Podman images.

3. **Database**

Provisions an **Azure PostgreSQL** database instance.

4. **Kubernetes**

Deploys an **Azure Kubernetes Service (AKS)** cluster.

## 

## **Technologies Used**

### **Backend**

* Python 3.9  
* Django & Django REST Framework

### **Frontend**

* Next.js  
* React

### **Infrastructure**

* Terraform  
* Azure Cloud:  
  * AKS  
  * ACR  
  * PostgreSQL  
  * Virtual Network

### **CI/CD**

* GitHub Actions  
* Podman for building Podman images

### **Containerization**

* Podman

## **Secrets Management**

The following secrets are managed in GitHub for the CI/CD pipeline:

* ACR\_NAME: Name of the Azure Container Registry.  
* AZURE\_CREDENTIALS: Azure service principal credentials.  
* AZURE\_SUBSCRIPTION\_ID: Azure subscription ID.  
* KUBE\_CONFIG: Base64-encoded kubeconfig file for AKS.
