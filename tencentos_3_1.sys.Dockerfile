FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH

RUN yum install -y xz curl tar && mkdir -p /target
RUN case ${TARGETARCH} in \
         "amd64") TAR_URL="https://mirrors.tencent.com/tencentos/3.1/images/x86_64/tlinux-64bit-v3.1.20200928.tar" ;; \
         "arm64") echo "arm64 not supported for 3.1" && exit 1 ;; \
    esac && \
    curl -fsSL "${TAR_URL}" -o /tmp/tcos.tar && \
    (tar -xf /tmp/tcos.tar --wildcards '*/layer.tar' -O | tar -xf - -C /target 2>/dev/null || \
     tar -xf /tmp/tcos.tar -C /target) && \
    rm -f /tmp/tcos.tar

COPY tencentos-3.1.repo /target/etc/yum.repos.d/tencentos.repo

FROM scratch
COPY --from=bootstrap /target /
CMD ["/bin/bash"]
