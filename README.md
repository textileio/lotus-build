# lotus-build

Automatically builds [textile/lotus](https://hub.docker.com/repository/docker/textile/lotus) image (`master` branch).

The Docker image is a pristine Lotus node without any sidecars or extra configuration. Recall that by default Lotus API endpoint is binded to `127.0.0.1:1234`, if you wan't to be accessed externally specify an enviroment variable: `LOTUS_API_LISTENADDRESS=/ip4/0.0.0.0/tcp/1234/http`.

The Dockerfile only defines a `CMD` so it can be overriden if that's useful for your use-case.
