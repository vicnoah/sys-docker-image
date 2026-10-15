FROM openeuler/openeuler:22.03-lts AS bootstrap

ARG TARGETARCH
ARG OS_DIFF=1070

RUN echo "I'm building uos:v20-${OS_DIFF} for arch ${TARGETARCH}"
RUN rm -rf /etc/yum.repos.d/* /target && mkdir -p /target/etc/yum.repos.d /etc/yum.repos.d

COPY UnionTechOS-ufu.repo /etc/yum.repos.d/UnionTechOS.repo
COPY UnionTechOS-ufu.repo /target/etc/yum.repos.d/UnionTechOS-tmp.repo

RUN yum --installroot=/target \
    --releasever=${OS_DIFF} \
    --nogpgcheck \
    --setopt=sslverify=0 \
    --setopt=tsflags=nodocs \
    install -y UnionTech-release UnionTech-repos coreutils rpm yum bash procps tar && \
    rm -rf /target/etc/yum.repos.d/UnionTechOS-tmp.repo

RUN mkdir -p /target/etc/yum/vars && echo 'ufu' > /target/etc/yum/vars/StateMode

FROM scratch AS runner
ARG OS_DIFF=1070
COPY --from=bootstrap /target /
RUN rm -rf /var/cache/yum /var/log/*
RUN (cp /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl && build-locale-archive --install-langs="en:zh") || true

FROM scratch
COPY --from=runner / /
CMD ["/bin/bash"]
