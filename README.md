# K8s
This repo is to explore Kubernetes
```
    docker compose build
    docker tag k8s-ghrunner docker.io/meherliatrio/k8s-ghrunner:v3
    docker push docker.io/meherliatrio/k8s-ghrunner:v3

    kind create cluster --name clustername
    kubectl create -f namespace-bootcamp.yaml
    kubectl create secret generic gh-secret --from-env-file=.env -n bootcamp
    kubectl apply -f deployment-gha.yaml  
    
    k8s exec -it -n bootcamp nexus-5578cfcd6d-6pf4m -- /bin/bash

    kubectl get namespaces
    kubectl get  secret gh-secret -n bootcamp    
    kubectl get  secret gh-secret -n bootcamp -o yaml

    kind get clusters
    kubectl cluster-info --context clustername
    kubectl config get-contexts
    kubectl config use-context kind-kind
    kubectl config view
    kubectl describe svc nexus-service -n bootcamp
    kubectl port-forward svc/nexus-service 8081:8081 -n bootcamp

    
    
    kubectl get pods -n bootcamp   
    kubectl logs -n bootcamp runner-6bdd5cf466-7thcc 
    kubectl get deployments -n bootcamp
    kubectl rollout status -n bootcamp deployment/runner
    
    kind delete cluster --name clustername
```
need to base64 decode if value is wanted  echo "bWVoZXItbGlhdHJpby9zcHJpbmctcGV0Y2xpbmlj" | base64 -d

http://nexus-service.bootcamp.svc.cluster.local:8081/repository/maven-snapshots/
http://10.244.0.6:8081/repository/maven-snapshots/