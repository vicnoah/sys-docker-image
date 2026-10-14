FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH

RUN yum install -y xz curl tar && mkdir -p /target
RUN case ${TARGETARCH} in \
         "amd64") TAR_URL="https://mirrors.tencent.com/tencentos/4.6/images/docker/x86_64/20260919.0/TencentOS-Server-Container-Base-4.6-20260919.0.x86_64.tar.xz" ;; \
         "arm64") TAR_URL="https://mirrors.tencent.com/tencentos/4.6/images/docker/aarch64/20260919.0/TencentOS-Server-Container-Base-4.6-20260919.0.aarch64.tar.xz" ;; \
    esac && \
    curl -fsSL "${TAR_URL}" -o /tmp/tcos.tar.xz && \
    xz -d /tmp/tcos.tar.xz && \
    tar -xf /tmp/tcos.tar --wildcards '*/layer.tar' -O | tar -xf - -C /target && \
    rm -f /tmp/tcos.tar

COPY tencentos-4.6.repo /target/etc/yum.repos.d/tencentos.repo

FROM scratch
COPY --from=bootstrap /target /
CMD ["/bin/bash"]
