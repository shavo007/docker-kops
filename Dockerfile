FROM alpine:latest

ENV KOPS_VERSION=1.7.0
# https://kubernetes.io/docs/tasks/kubectl/install/
# latest stable kubectl: curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt
ENV KUBECTL_VERSION=v1.7.4
ENV TERRAFORM_VERSION=0.10.0
ENV KUBE_TAIL_VERSION=1.4.2

RUN apk --no-cache add ca-certificates \
  && apk --no-cache add --virtual build-dependencies curl python py-pip py-setuptools \
  && pip --no-cache-dir install awscli \
  && echo "hello shane" \
  && curl -LO --silent --show-error https://github.com/kubernetes/kops/releases/download/$KOPS_VERSION/kops-linux-amd64 \
  && mv kops-linux-amd64 /usr/local/bin/kops \
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl \
  && mv kubectl /usr/local/bin/kubectl \
  && curl -LO https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_$TERRAFORM_VERSION_darwin_amd64.zip \
  && unzip terraform_$TERRAFORM_VERSION_darwin_amd64.zip \
  && mv terraform /usr/local/bin/terraform \
  && mv kubectl /usr/local/bin/kubectl \
  && curl -LO https://github.com/johanhaleby/kubetail/archive/$KUBE_TAIL_VERSION.zip \
  && unzip $KUBE_TAIL_VERSION.zip \
  && mv kubetail-$KUBE_TAIL_VERSION/kubetail /usr/local/bin/kubetail \
  && chmod +x /usr/local/bin/kops /usr/local/bin/kubectl /usr/local/bin/terraform /usr/local/bin/kubetail  \
  && apk del --purge build-dependencies \
  && rm -rf terraform_$TERRAFORM_VERSION_darwin_amd64.zip \
  && rm -rf $KUBE_TAIL_VERSION.zip

ENTRYPOINT ["/usr/local/bin/kops"]
CMD ["--help"]
