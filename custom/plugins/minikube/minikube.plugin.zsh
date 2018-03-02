alias evalmk="eval $(minikube docker-env)"
alias mks="minikube status"
alias mkdps="minikube ssh \"docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Status}}'\""

