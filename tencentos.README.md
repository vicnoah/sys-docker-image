# Quick reference

[![Publish TencentOS Docker image](https://github.com/MacroSAN-Tech/sys-docker-image/actions/workflows/tencentos-image.yml/badge.svg)](https://github.com/MacroSAN-Tech/sys-docker-image/actions/workflows/tencentos-image.yml)

TencentOS Server system docker images, based on TencentOS mirror repositories (`https://mirrors.tencent.com/tencentos/`).

-	**Maintained by**:
	[MacroSAN-Tech/sys-docker-image](https://github.com/MacroSAN-Tech/sys-docker-image)

# Supported tags and respective `Dockerfile` links

-	[`3.1`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/tencentos_3_1.sys.Dockerfile)
-	[`3.3`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/tencentos_3_3.sys.Dockerfile)
-	[`4.0`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/tencentos_4_0.sys.Dockerfile)
-	[`4.2`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/tencentos_4_2.sys.Dockerfile)
-	[`4.4`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/tencentos_4_4.sys.Dockerfile)
-	[`4.6`](https://github.com/MacroSAN-Tech/sys-docker-image/blob/main/tencentos_4_6.sys.Dockerfile)

# How to use this image

```console
$ docker build -f tencentos_4_6.sys.Dockerfile -t macrosan/tencentos:4.6 .
$ docker run -it macrosan/tencentos:4.6
```
