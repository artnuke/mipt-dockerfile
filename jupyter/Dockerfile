ARG BASE_CONTAINER=python
ARG PYTHON_VERSION=latest

ARG POETRY_VERSION=1.2.2

FROM $BASE_CONTAINER:$PYTHON_VERSION

WORKDIR /mipt

# install conda
RUN wget -O /tmp/Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-py38_4.9.2-Linux-x86_64.sh\
    && bash /tmp/Miniconda3.sh -b
ENV PATH "/root/miniconda3/bin:$PATH"
RUN rm -rf /root/miniconda3/lib/python3.8/site-packages/ruamel*
RUN pip install ruamel-yaml

#Install requirements
COPY ./requirements.txt ./requirements.txt
RUN python -m venv ./venv && . venv/bin/activate
RUN pip install -r ./requirements.txt

# Install poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | POETRY_VERSION=$POETRY_VERSION python -
ENV PATH="/root/.local/bin:$PATH"
RUN poetry config virtualenvs.create false


CMD . venv/bin/activate && jupyter notebook --ip 0.0.0.0 --allow-root --no-browser



