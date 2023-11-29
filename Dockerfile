FROM mcr.microsoft.com/devcontainers/python:1-3.12-bookworm

RUN pip3 install --trusted-host https://mirror.baidu.com -i https://mirror.baidu.com/pypi/simple --user esbonio sphinx