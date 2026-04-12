ARG SOPS_VERSION=3.12.2
ARG AGE_VERSION=1.3.1

FROM semaphoreui/semaphore:latest

ARG SOPS_VERSION
ARG AGE_VERSION

USER root

RUN apk add --no-cache ca-certificates gnupg

RUN curl -fsSL -o /usr/local/bin/sops "https://github.com/getsops/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux.amd64" \
    && chmod +x /usr/local/bin/sops \
    && sops --version

RUN curl -fsSL -o /tmp/age.tar.gz \
    "https://github.com/FiloSottile/age/releases/download/v${AGE_VERSION}/age-v${AGE_VERSION}-linux-amd64.tar.gz" \
 && tar -C /tmp -xzf /tmp/age.tar.gz \
 && mv /tmp/age/age /tmp/age/age-keygen /usr/local/bin/ \
 && chmod +x /usr/local/bin/age /usr/local/bin/age-keygen \
 && rm -rf /tmp/age /tmp/age.tar.gz

USER semaphore
