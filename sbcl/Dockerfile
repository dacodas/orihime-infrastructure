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

RUN git clone --branch master https://github.com/dacodas/orihime /root/quicklisp/local-projects/orihime
RUN sbcl --eval "(ql:quickload '(:orihime :swank))"

EXPOSE 4005

COPY start-orihime-and-swank.lisp /root/

CMD sbcl --load /root/start-orihime-and-swank.lisp
