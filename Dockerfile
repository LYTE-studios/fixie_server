FROM dart:3.6.0 AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

FROM alpine:latest

ENV runmode=production
ENV serverid=default
ENV logging=verbose
ENV role=monolith

COPY --from=build /runtime/ /
COPY --from=build /app/bin/server server
COPY --from=build /app/config/ config/
COPY --from=build /app/web/ web/

EXPOSE 8080
EXPOSE 8081

ENTRYPOINT ./server --mode $runmode --server-id $serverid --logging $logging --role $role
