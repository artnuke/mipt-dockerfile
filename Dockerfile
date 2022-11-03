ARG BASE_CONTAINER=ubuntu
ARG UBUNTU_VERSION=20.04

FROM $BASE_CONTAINER:$UBUNTU_VERSION

LABEL version="1.0"

WORKDIR /workspace

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHON_VERSION=3.9

RUN apt-get update && \
    apt-get install -y \
    python3.9 \
    python3.9-dev \
    python3.9-venv

RUN apt-get update && \
    apt-get install -y \
      wget \
      curl \
      git \
      vim \
      openssh-client \
      build-essential \
      zip \
      unzip \
      ffmpeg \
      libsm6 \
      libxext6

# install Poetry
ENV POETRY_VERSION=1.2.2

ENV POETRY_HOME=/opt/poetry
ENV POETRY_VENV=/opt/poetry-venv
ENV POETRY_CACHE_DIR=/opt/.cache

RUN python3.9 -m venv $POETRY_VENV \
  && $POETRY_VENV/bin/pip install -U pip setuptools \
  && $POETRY_VENV/bin/pip install poetry==$POETRY_VERSION

ENV PATH="${PATH}:${POETRY_VENV}/bin"
RUN poetry config virtualenvs.create false

ENV CONDA_VERSION=latest


# install conda
RUN wget -O /tmp/Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh\
    && bash /tmp/Miniconda3.sh -b
ENV PATH "/root/miniconda3/bin:$PATH"
RUN rm -rf /root/miniconda3/lib/python${PYTHON_VERSION}/site-packages/ruamel*
RUN pip install ruamel-yaml

COPY pyproject.toml ./
RUN poetry install

# #Install requirements
# COPY ./requirements.txt ./requirements.txt
# RUN python3 -m venv ./venv && . venv/bin/activate
# RUN pip install -r ./requirements.txt

# # Install poetry
# RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | POETRY_VERSION=$POETRY_VERSION python -
# ENV PATH="/root/.local/bin:$PATH"
# RUN poetry config virtualenvs.create false


CMD jupyter notebook --ip 0.0.0.0 --allow-root --no-browser



