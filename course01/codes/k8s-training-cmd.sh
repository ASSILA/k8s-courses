###########################
## ReplicationController ##
###########################
# create a new pod nginx
kubectl apply -f nginx
# create a replication controller (replicas = 3)
kubectl apply -f rc-definition.yaml
kubectl get replicationcontroller
# we should have 4 pods 
kubectl get pods
kubectl delete pod <Pod_name>
kubectl get pods
kubectl delete replicationcontroller myapp-rc
kubectl get pods
################
## ReplicaSet ##
################
# create a new pod nginx with labels = type: front-end
kubectl apply -f nginx
# create a replicaSet (replicas = 3) selector matchLabels: type :font-end
kubectl apply -f replicaset-def.yaml
kubectl get all
kubectl get replicasets
# we should have 3 pods 
kubectl get pods
kubectl delete pod <Pod_name>
# we should have 3 pods 
kubectl get pods
kubectl describe replicaset myapp-replicaset
kubectl delete replicaset myapp-replicaset
kubectl get pods
######################
## Scale ReplicaSet ##
######################
### Scale with kubectl replace -f ####
kubectl apply -f replicaset-def.yaml
kubectl get all
kubectl get replicasets
# we should have 3 pods 
kubectl get pods
# change number of replicas to 6 in file replicaset-def.yaml 
# then apply this cammand
kubectl replace -f replicaset-def.yaml
# we should have 6 pods
kubectl get pods 
### Scale with scale --replicas=6 -f replicaset-def.yaml####
kubectl scale --replicas=6 -f replicaset-def.yaml
# we should have 6 pods
kubectl get pods
# print file replicaset-def.yaml 
# we should have replicas=3 in the file => it not be changed automatically
cat replicaset-def.yaml
### Scale with kubectl scale --replicas=6 replicaset <replicaset_name> ####
kubectl scale --replicas=6 replicaset myapp-replicaset 
# we should have 6 pods
kubectl get pods
# print file replicaset-def.yaml 
# we should have replicas=3 in the file => it not be changed automatically
cat replicaset-def.yaml 
### Scale with kubectl edit replicaset myapp-replicaset ###
kubectl edit replicaset myapp-replicaset
#####################
## begin # vim cmd ##
# To insert text press i.
# Now start editing file. ... change replicas from 6 to 4
# Press Esc key and type :w to save a file in vim.
# One can press Esc and type :wq to save changes to a file and exit from vim.
# Another option is to press :x.
## end # vim cmd ##
###################
# we should have 4 pods
kubectl get pods

################
## Deployment ##
################
kubectl create -f deployement-def.yaml 
kubectl get all
kubectl get deployements
kubectl get replicasets
kubectl get deployement myapp-deployement
kubectl replace -f deployement-def.yaml
kubectl describe deployement myapp-deployement
kubectl delete deployement myapp-deployement
#####################################
## Deployment : update and rollback##
#####################################
kubectl create -f deployement-def.yaml --record=true
kubectl get deployements 
# change the image in the file 
kubectl apply -f deployement-def.yaml --record=true
# OR change the image by :
kubectl set image deployement/myapp-deployement nginx=nginx:1.9.1 --record=true
kubectl rollout status deployement/myapp-deployement
kubectl rollout history deployement/myapp-deployement
kubectl rollout undo deployement/myapp-deployement

#############
## Service ##
#############

kubectl create -f service-node-port-def.yaml
kubectl get svc 
minikube service myapp-service --url

