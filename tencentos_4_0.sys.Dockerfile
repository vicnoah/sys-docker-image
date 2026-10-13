FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH

RUN mkdir -p /target
RUN case ${TARGETARCH} in \
         "amd64") TAR_URL="https://mirrors.tencent.com/tencentos/4.0/images/x86_64/tencentos-server-4.0-x86_64.tar" ;; \
         "arm64") TAR_URL="https://mirrors.tencent.com/tencentos/4.0/images/aarch64/tencentos-server-4.0-aarch64.tar" ;; \
    esac && \
    curl -sSL "${TAR_URL}" | tar -xf - -C /target

COPY tencentos-4.0.repo /target/etc/yum.repos.d/tencentos.repo

FROM scratch
COPY --from=bootstrap /target /
CMD ["/bin/bash"]
