FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH

RUN mkdir -p /target
RUN case ${TARGETARCH} in \
         "amd64") TAR_URL="https://mirrors.tencent.com/tencentos/4.2/images/x86_64/20250227.0/TencentOS-Server-Container-Base-4.2-20250227.0.x86_64.tar.xz" ;; \
         "arm64") TAR_URL="https://mirrors.tencent.com/tencentos/4.2/images/aarch64/20250227.0/TencentOS-Server-Container-Base-4.2-20250227.0.aarch64.tar.xz" ;; \
    esac && \
    curl -sSL "${TAR_URL}" | tar -xf - -C /target

COPY tencentos-4.2.repo /target/etc/yum.repos.d/tencentos.repo

FROM scratch
COPY --from=bootstrap /target /
CMD ["/bin/bash"]
