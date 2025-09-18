FROM python:3.13.5-slim

WORKDIR /cs577

EXPOSE 9577

CMD ["jupyter", "notebook", "--no-browser", "--allow-root", "--certfile=/cs577/jupyter/jupyter.crt", "--keyfile=/cs577/jupyter/jupyter.key", "--ip=0.0.0.0", "--port=9577", "--NotebookApp.token=701cc5786525fe54b422be3107e576d8321750163a9fc0f9964286933ccee587"]

COPY requirements.txt ./
COPY jupyter jupyter

RUN apt update && \
    apt upgrade --no-install-recommends -y build-essential && \
    pip install -r /cs577/requirements.txt --no-cache-dir --root-user-action ignore && \
    rm /cs577/requirements.txt && \
	mkdir -p /usr/local/share/jupyter/lab/settings && \
	mv /cs577/jupyter/jupyter-settings.json /usr/local/share/jupyter/lab/settings/overrides.json

COPY ./src/exercises exercises
COPY ./src/homework homework