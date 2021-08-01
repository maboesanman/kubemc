# this shouldn't be here but just in case
kubectl delete pod seeder

# delete everything that isn't world data
kubectl delete deployment velocity-deployment
kubectl delete service velocity-service
kubectl delete pvc velocity-config

kubectl delete deployment survival-deployment
kubectl delete service survival-service
kubectl delete pvc survival-config
kubectl delete pvc survival-mods

kubectl delete deployment creative-deployment
kubectl delete service creative-service
kubectl delete pvc creative-config
kubectl delete pvc creative-mods
