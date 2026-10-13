FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH

RUN yum install -y xz curl tar && mkdir -p /target
RUN case ${TARGETARCH} in \
         "amd64") TAR_URL="https://mirrors.tencent.com/tencentos/3.3/images/docker/x86_64/20260918.1/TencentOS-Server-Container-Base-3.3-20260918.1.x86_64.tar.xz" ;; \
         "arm64") TAR_URL="https://mirrors.tencent.com/tencentos/3.3/images/docker/aarch64/20260918.1/TencentOS-Server-Container-Base-3.3-20260918.1.aarch64.tar.xz" ;; \
    esac && \
    curl -fsSL "${TAR_URL}" | tar -xf - -C /target

COPY tencentos-3.3.repo /target/etc/yum.repos.d/tencentos.repo

FROM scratch
COPY --from=bootstrap /target /
CMD ["/bin/bash"]
