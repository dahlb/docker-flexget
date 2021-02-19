FROM frolvlad/alpine-python3

RUN apk --no-cache add tzdata ca-certificates build-base python3-dev \
  && pip install -I flexget transmission-rpc \
  && mkdir -p /root/.flexget \
  && touch /root/.flexget/config.yml \
  && cp /usr/share/zoneinfo/America/New_York /etc/localtime \
  && echo "America/New_York" > /etc/timezone \
  && apk del tzdata
  
COPY bootstrap.sh /root/bootstrap.sh

RUN chmod +x /root/bootstrap.sh

CMD ["/root/bootstrap.sh"]
