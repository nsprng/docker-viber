# viber

## Description
Dockerized version of [Viber](https://www.viber.com/) messenger.
```diff
- Currently the sound is broken and videos unplayable at all. Would fix this someday.
```
## Getting Started
```bash
docker build -t <IMAGE_TAG> .
docker run -it -e DISPLAY=unix$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/snd:/dev/snd \
  --privileged <IMAGE_TAG>
  ```
## Example
### Build docker image:
```bash
docker build -t user/viber:latest .
```
### Run Viber:
```bash
docker run -it --name viber -e DISPLAY=unix$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/snd:/dev/snd \
  -v /home/user/viber/downloads:/home/viber/Documents/ViberDownloads:rw \
  --privileged user/viber:latest
```

> Note: host folder for downloads (/home/user/viber/downloads in example) should be owned by user with UID=7777.
