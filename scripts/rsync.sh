#!/bin/bash
# =====================================
# Script Name : rsync.sh
# Description : 同步github项目
# Author      : Ky9oss
# Date        : 2025-09-04
# =====================================


# === 配置路径 ===
SRC_BLOG="<your_config>"

GH_BLOG="<your_config>"

rsync -av --progress \
      --include='temp/keep.txt' \
      --exclude='package-lock.json' \
      --exclude='npm-debug.log' \
      --exclude='.env' \
      --exclude='.env.production' \
      --exclude='node_modules/' \
      --exclude='dist/' \
      --exclude='.output/' \
      --exclude='.git/' \
      --exclude='src/data/' \
      --exclude='src/assets/images/' \
      --exclude='src/assets/images/default.png' \
      $SRC_BLOG $GH_BLOG

