FROM alpine:3.19

RUN apk add --no-cache curl tzdata

WORKDIR /app

COPY pause-resume.sh /app/
COPY entrypoint.sh /app/

RUN chmod +x /app/pause-resume.sh /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
