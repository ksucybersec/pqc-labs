FROM python:latest

# Install dependencies
RUN apt-get -y update && \
    apt-get install -y build-essential git cmake libssl-dev

# Get liboqs
RUN git clone --depth 1 --branch main https://github.com/open-quantum-safe/liboqs

# Install liboqs
RUN cmake -S liboqs -B liboqs/build -DBUILD_SHARED_LIBS=ON && \
    cmake --build liboqs/build --parallel 4 && \
    cmake --build liboqs/build --target install

# Enable a normal user
# RUN useradd -m -c "Open Quantum Safe" oqs
# USER oqs
WORKDIR /home/oqs

# Create and activate virtual environment
# RUN python3 -m venv /home/oqs/venv
# ENV PATH="/home/oqs/venv/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
# ENV PYTHONPATH="/home/oqs/liboqs-python:$PYTHONPATH"
# ENV PYTHON_ENV_PATH="/home/oqs/venv"
# ENV JUPYTER_ALLOW_INSECURE_WRITES=1

# Get liboqs-python
RUN git clone --depth 1 --branch main https://github.com/open-quantum-safe/liboqs-python.git /home/oqs/liboqs-python

# Install liboqs-python
WORKDIR /home/oqs/liboqs-python
RUN pip install .

WORKDIR /home/oqs

COPY . .
RUN pip install -r requirements.txt

EXPOSE 8888

VOLUME [ "/home/oqs/labs" ]

CMD ["/home/oqs/run_notebook.sh"]