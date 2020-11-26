FROM alphacep/kaldi-vosk-server:latest

ENV MODEL_VERSION 0.6
RUN mkdir /opt/vosk-model-it \
   && cd /opt/vosk-model-it \
   && wget -q https://alphacephei.com/vosk/models/vosk-model-it-${MODEL_VERSION}-linto.zip \
   && unzip vosk-model-it-${MODEL_VERSION}-linto.zip \
   && mv vosk-model-it-${MODEL_VERSION}-linto model \
   && rm vosk-model-it-${MODEL_VERSION}-linto.zip

EXPOSE 2700
WORKDIR /opt/vosk-server/websocket
ENV VOSK_SAMPLE_RATE 16000
CMD [ "python3", "./asr_server.py", "/opt/vosk-model-fr/model" ]