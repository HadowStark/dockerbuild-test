FROM centos:centos7
COPY CentOS-Base.repo /etc/yum.repos.d/
COPY nginx-1.16.1.tar.gz /root/
RUN yum clean all \
    && yum makecache \
    && yum install -y gcc pcre-devel zlib-devel openssl-devel make
RUN cd /root/ \
    && tar -zxf nginx-1.16.1.tar.gz \
    && cd nginx-1.16.1 \
    && ./configure \
    && make \
    && make install \
    && ln -s ln -s /usr/local/nginx/sbin/nginx /usr/local/sbin/ \
    && nginx \
    && rm -rf /root/nginx-1.16.1*
EXPOSE 80
