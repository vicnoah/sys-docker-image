#!/bin/bash
set -e

# Kylin builds
docker buildx build --progress=plain --no-cache . -f kylin_v10_sp1.sys.Dockerfile --platform=linux/amd64 -t kylin:v10-sp1-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v10_sp2.sys.Dockerfile --platform=linux/amd64 -t kylin:v10-sp2-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v10_sp3.sys.Dockerfile --platform=linux/amd64 -t kylin:v10-sp3-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v10_sp3_2403.sys.Dockerfile --platform=linux/amd64 -t kylin:v10-sp3-2403-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v10_sp3_1.sys.Dockerfile --platform=linux/amd64 -t kylin:v10-sp3.1-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v10_10_0.sys.Dockerfile --platform=linux/amd64 -t kylin:v10-10.0-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v10_10_1.sys.Dockerfile --platform=linux/amd64 -t kylin:v10-10.1-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v11_2503.sys.Dockerfile --platform=linux/amd64 -t kylin:v11-2503-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v7_sp1.sys.Dockerfile --platform=linux/amd64 -t kylin:v7-sp1-amd64
docker buildx build --progress=plain --no-cache . -f kylin_v6_6_9.sys.Dockerfile --platform=linux/amd64 -t kylin:v6-6.9-amd64

# TencentOS builds
docker buildx build --progress=plain --no-cache . -f tencentos_3_1.sys.Dockerfile --platform=linux/amd64 -t tencentos:3.1-amd64
docker buildx build --progress=plain --no-cache . -f tencentos_3_3.sys.Dockerfile --platform=linux/amd64 -t tencentos:3.3-amd64
docker buildx build --progress=plain --no-cache . -f tencentos_4_0.sys.Dockerfile --platform=linux/amd64 -t tencentos:4.0-amd64
docker buildx build --progress=plain --no-cache . -f tencentos_4_2.sys.Dockerfile --platform=linux/amd64 -t tencentos:4.2-amd64
docker buildx build --progress=plain --no-cache . -f tencentos_4_4.sys.Dockerfile --platform=linux/amd64 -t tencentos:4.4-amd64
docker buildx build --progress=plain --no-cache . -f tencentos_4_6.sys.Dockerfile --platform=linux/amd64 -t tencentos:4.6-amd64
