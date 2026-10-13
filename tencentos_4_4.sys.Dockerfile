FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH

RUN mkdir -p /target
RUN case ${TARGETARCH} in \
         "amd64") TAR_URL="https://mirrors.tencent.com/tencentos/4.4/images/docker/x86_64/20260324.0/TencentOS-Server-Container-Base-4.4-20260324.0.x86_64.tar.xz" ;; \
         "arm64") TAR_URL="https://mirrors.tencent.com/tencentos/4.4/images/docker/aarch64/20260324.0/TencentOS-Server-Container-Base-4.4-20260324.0.aarch64.tar.xz" ;; \
    esac && \
    curl -sSL "${TAR_URL}" | tar -xf - -C /target

COPY tencentos-4.4.repo /target/etc/yum.repos.d/tencentos.repo

FROM scratch
COPY --from=bootstrap /target /
CMD ["/bin/bash"]
