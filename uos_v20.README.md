# Quick reference

[![Publish Docker image](https://github.com/MacroSAN-Tech/sys-docker-image/actions/workflows/uos-image.yml/badge.svg)](https://github.com/MacroSAN-Tech/sys-docker-image/actions/workflows/uos-image.yml)

统信UOS服务器操作系统docker镜像, 基于uos软件源构建, 提供 `V20` (1050 / 1060 / 1070) 的docker镜像

> 统信服务器操作系统【ADE版本】区别介绍 https://faq.uniontech.com/solution/umountain/3984/2e19

-	**Maintained by**:  
	[MacroSAN-Tech/sys-docker-image](https://github.com/MacroSAN-Tech/sys-docker-image)

# Supported tags and respective `Dockerfile` links

-	[`v20-1050`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/uos_v20.sys.Dockerfile)
-	[`v20-1060`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/uos_v20.sys.Dockerfile)
-	[`v20-1070`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/uos_v20.sys.Dockerfile)

# How to use this image

## pull specific arch image

```console
$ docker pull --platform=linux/amd64 macrosan/uos:v20-1070
```

## Run for testing

```console
$ docker run -it macrosan/uos:v20-1070
```

### Build a new image with some packages

```dockerfile
FROM macrosan/uos:v20-1070
RUN yum install -y vi
```
