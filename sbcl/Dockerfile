FROM ubuntu:18.10

# Need mysql-server for the library?
RUN apt-get update
RUN apt-get install -y sbcl locales curl git graphviz libmysqlclient-dev

RUN ln -s /usr/lib/x86_64-linux-gnu/libmysqlclient.so /usr/lib/x86_64-linux-gnu/libmysqlclient_r.so

RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen
RUN locale-gen
ENV LANG ja_JP.UTF-8  
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8 

WORKDIR /root/

RUN curl -O https://beta.quicklisp.org/quicklisp.lisp
COPY bootstrap-ql.lisp .
RUN sbcl --load bootstrap-ql.lisp

EXPOSE 4005


# For generating Anki cards
RUN apt-get install -y python3 python3-pip portaudio19-dev
RUN cd /usr/local/src && git clone https://github.com/dae/anki.git --branch 2.1.8
RUN ln -sf /usr/local/src/anki/anki /usr/lib/python3/dist-packages
RUN pip3 install -r /usr/local/src/anki/requirements.txt

RUN apt-get install -y vim

ARG ORIHIME_GIT_URL=https://github.com/dacodas/orihime
RUN git clone --depth 1 --branch dependency-change $ORIHIME_GIT_URL /root/quicklisp/local-projects/orihime && \
    sbcl --eval "(ql:quickload '(:orihime :swank))" && \
    rm -r /root/quicklisp/local-projects/orihime

ARG CACHE_BUST=1
ARG ENVIRONMENT
ENV ENVIRONMENT=$ENVIRONMENT
RUN git clone --depth 1 --branch $ENVIRONMENT $ORIHIME_GIT_URL /root/quicklisp/local-projects/orihime
RUN sbcl --eval "(ql:quickload :orihime)"

COPY start-orihime-and-swank.lisp /root/
CMD sbcl --load /root/start-orihime-and-swank.lisp
