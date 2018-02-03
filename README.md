# docker-kops
Swiss army knife for k8s infra tools

## Kubernetes Operations (kops)

> Production Grade K8s Installation, Upgrades, and Management

## Includes
* Kops
* Kubectl
* AWS CLI
* Terraform
* Helm


```bash
(sample vars)
export NAME=k8s.shanelee.name.k8s.local
export KOPS_STATE_STORE=s3://shane-k8s-bucket
export AWS_REGION=ap-southeast-2

docker run --rm -it \
  -e AWS_REGION \
  -e AWS_PROFILE \
  -e KOPS_STATE_STORE \
  -v "$HOME"/.ssh:/root/.ssh:ro \
  -v "$HOME"/.aws:/root/.aws:ro \
  -v "$HOME"/.kube:/root/.kube:rw \
  -v "$HOME"/.helm:/root/.helm:rw \
  -v "$(pwd)":/workdir \
  -w /workdir \
  shanelee007/alpine-kops

```
