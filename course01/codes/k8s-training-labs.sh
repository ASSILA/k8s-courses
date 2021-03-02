###################
## Pod with YAML ##
###################
#What is the version of Kubernetes running on the nodes 
kubectl get nodes
#What is the flavour and version of Operating System on which the Kubernetes nodes are running?
kubectl get nodes -o wide
# what is the image used to create the new pod
kubectl describe pod nginx-kjhksdjh | grep -i image
# which nodes are these pods placed on ?
kubectl get nodes -o wide
# how many containers are part of the pod 'webapp'
kubectl get pods webapp
# create new pod redis
kubectl run redis --image=redis123 --dry-run=client -o yaml > redis.yaml
kubectl apply -f redis.yaml
# edit config to change image name from redis123 to redis
kubectl edit pod redis 
################
## ReplicaSet ##
################
# USE A yaml file that the image of container has value nginx123
# create new replicaset with kubectl create -f new-replicaset-def.yaml
# How many replicaset exist on the system
kubectl get replicasets
# How many PODS are DESIRED in the new-replicaset
kubectl get replicaset new-replicaset
# What image used to create the pods in the new-replicaset
kubectl describe replicaset new-replicaset
# How many PODS are READY in the new-replicaset
kubectl describe replicaset new-replicaset
# what do you think the PODs are not ready 
# => use kubectl describe and check event section  
kubectl get pods 
kubectl describe pod <Pod_NAME_Not ready>
# delete any one of the 4 Pods
kubectl delete pod <POD NAME>
# change image value from nginx123 to nginx
kubectl replace -f new-replicaset-def.yaml
# always pods are not ready
kubectl get pods
# delete all pods one after one
kubectl delete pod <POD_NAME>
kubectl get pods

################
## Deployment ##
################
# USE A yaml file that the image of container has value nginx123
# create new deployement with kubectl create -f new-deployement-def.yaml
# How many deployment exist on the system
kubectl get deployements
kubectl get pods
kubectl describe deployement myapp-deployement
# What image used to create the pods in the new-deployment
kubectl describe deployement new-deployement
# How many PODS are READY in the new-deployment
kubectl describe deployement new-deployement
# what do you think the PODs are not ready 
# => use kubectl describe and check event section  
kubectl get pods 
kubectl describe pod <Pod_NAME_Not ready>
# fix image value and replace nginx123 by nginx
kubectl replace -f new-deployement-def.yaml
# pods not ready will be replaced automatiqually
kubectl get pods
# what is the image used to create the pods in the new deployment
kubectl describe deployement new-deployement | grep -i image
######################################
## Deployment : update and rollback ##
######################################
kubectl create -f deployement-def.yaml
kubectl get all
kubectl describe deployments.apps myapp-deployment 
kubectl rollout status deployement/myapp-deployement
# we will have list of revesion without change-cause
kubectl rollout history deployement/myapp-deployement
kubectl delete deployement myapp-deployement
kubectl create -f deployement-def.yaml --record=true
kubectl get all
kubectl describe deployments.apps myapp-deployment 
kubectl rollout status deployements/myapp-deployement --record=true
kubectl edit deployement myapp-deployement --record=true
kubectl rallout history deployements/









