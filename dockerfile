FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel

WORKDIR /workspace
COPY ./requirements.txt /workspace/

# (Optional)
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.aliyun.com\/ubuntu\//g' /etc/apt/sources.list && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN apt-get update \
    && apt-get install -y gcc ffmpeg libsm6 libxext6 git ninja-build libglib2.0-0 libxrender-dev vim \
    build-essential libboost-all-dev cmake \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

RUN git clone -b v1.0.8 https://github.com/Dao-AILab/flash-attention /workspace/flash-attention
RUN cd /workspace/flash-attention && pip install .
CMD bash
