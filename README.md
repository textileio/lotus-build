# lotus-build

Automatically builds [textile/lotus](https://hub.docker.com/repository/docker/textile/lotus) image. 
This image is a Lotus node that, as originally designed, listen to `localhost:1234`, but adds a sidecar 
reverse proxy to expose endpoint. The reverse proxy runs on `:1235` so can be accessed externally.

