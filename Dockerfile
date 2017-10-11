FROM python:3.4

RUN apt-get update \
    && apt-get install -y python-pip build-essential \
    && apt-get -y autoremove \
    && apt-get -y clean  \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/matiasducid/TP2Fundamentos.git
RUN pip install -U graphviz
RUN pip install pygraphviz
RUN pip install pip -U \
    && pip install jupyter  scipy matplotlib \
    && rm -r /root/.cache/pip

EXPOSE 8000

CMD jupyter notebook --ip 0.0.0.0 --port 8000 --allow-root
