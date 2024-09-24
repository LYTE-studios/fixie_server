# If you update the dart version, make sure the image is
# compatible with the busybox image.
FROM dart:3.4.0 AS build

WORKDIR /app
COPY . .

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/main

# If you update the busybox version, make sure the image is
# compatible with the dart image.
FROM busybox:1.36.1-glibc

ARG runmode=production
ENV serverid=default
ENV logging=normal
ENV role=monolith

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ./main --mode $runmode --server-id $serverid --logging $logging --role $role
