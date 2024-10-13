FROM dart:3.5.2 AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

RUN aws --profile default configure set aws_access_key_id "AKIATQZCSJMV4HQDFACC"
RUN aws --profile default configure set aws_secret_access_key "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"

FROM alpine:latest

ENV runmode=production
ENV serverid=default
ENV logging=verbose
ENV role=monolith

COPY --from=build /runtime/ /
COPY --from=build /app/bin/server server
COPY --from=build /app/config/ config/
COPY --from=build /app/web/ web/

ENTRYPOINT ./server --mode $runmode --server-id $serverid --logging $logging --role $role
