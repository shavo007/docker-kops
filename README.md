# docker-kops
Swiss army knife for k8s infra tools

Includes
* Kops
* Kubectl
* AWS cli
* Terraform
* Kubetail


```bash

docker run --rm -it \
  -e AWS_REGION \
  -e AWS_PROFILE \
  -e KOPS_STATE_STORE \
  -v "$HOME"/.ssh:/root/.ssh:ro \
  -v "$HOME"/.aws:/root/.aws:ro \
  -v "$HOME"/.kube:/root/.kube:rw \
  -v "$(pwd)":/workdir \
  -w /workdir \
  shanelee007/alpine-kops

```
