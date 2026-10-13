FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH

RUN yum install -y xz curl tar && mkdir -p /target
RUN case ${TARGETARCH} in \
         "amd64") TAR_URL="https://mirrors.tencent.com/tencentos/3.1/images/x86_64/tlinux-64bit-v3.1.20200928.tar" ;; \
         "arm64") echo "arm64 not supported for 3.1" && exit 1 ;; \
    esac && \
    (curl -fsSL "${TAR_URL}" | tar -xf - --wildcards '*/layer.tar' -O 2>/dev/null | tar -xf - -C /target || \
     curl -fsSL "${TAR_URL}" | tar -xf - -C /target)

COPY tencentos-3.1.repo /target/etc/yum.repos.d/tencentos.repo

FROM scratch
COPY --from=bootstrap /target /
CMD ["/bin/bash"]
