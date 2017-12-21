FROM golang
MAINTAINER Xendera Team <hello@xendera.com>

ENV APPPATH $GOPATH/src/github.com/percona/mongodb_exporter

RUN git clone https://github.com/percona/mongodb_exporter $APPPATH && cd $APPPATH \
    && go get -d && go build -o /bin/mongodb_exporter \
    && rm -rf $GOPATH

EXPOSE 9216

ENTRYPOINT [ "/bin/mongodb_exporter" ]
