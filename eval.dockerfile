FROM wangjiaxin/qwen-7b:4.13.0

COPY eval_requirements.txt /workspace/

RUN pip install -r eval_requirements.txt && \
    pip install /workspace/flash-attention/csrc/layer_norm && \
    pip install /workspace/flash-attention/csrc/rotary

# ssh
RUN apt-get update && apt-get install openssl openssh-server openssh-client -y

CMD bash
