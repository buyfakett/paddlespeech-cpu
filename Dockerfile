FROM paddlecloud/paddlespeech:develop-cpu-fb4d25

COPY config/application.yaml /home/PaddleSpeech/paddlespeech/server/conf/application.yaml

RUN pip install paddlespeech_ctcdecoders && \
mkdir -p /root/.paddlespeech/models/ && \
mkdir -p /root/.paddlespeech/models/conformer_wenetspeech-zh-16k/ && \
mkdir -p /root/.paddlespeech/models/ernie_linear_p3_wudao-punc-zh/ && \
mkdir -p /root/.paddlespeech/models/fastspeech2_csmsc-zh/ && \
mkdir -p /root/.paddlespeech/models/pwgan_csmsc-zh/ && \
wget https://paddlespeech.bj.bcebos.com/s2t/wenetspeech/asr1_conformer_wenetspeech_ckpt_0.1.1.model.tar.gz -O /root/.paddlespeech/models/conformer_wenetspeech-zh-16k/asr1_conformer_wenetspeech_ckpt_0.1.1.model.tar.gz && \
wget https://paddlespeech.bj.bcebos.com/Parakeet/released_models/fastspeech2/fastspeech2_nosil_baker_ckpt_0.4.zip -O /root/.paddlespeech/models/fastspeech2_csmsc-zh/fastspeech2_nosil_baker_ckpt_0.4.zip && \
wget https://paddlespeech.bj.bcebos.com/Parakeet/released_models/pwgan/pwg_baker_ckpt_0.4.zip -O /root/.paddlespeech/models/pwgan_csmsc-zh/pwg_baker_ckpt_0.4.zip && \
wget https://paddlespeech.bj.bcebos.com/text/ernie_linear_p3_wudao-punc-zh.tar.gz -O /root/.paddlespeech/models/ernie_linear_p3_wudao-punc-zh/ernie_linear_p3_wudao-punc-zh.tar.gz

EXPOSE 8888

CMD ["paddlespeech_server", "start", "--config_file", "./paddlespeech/server/conf/application.yaml"]