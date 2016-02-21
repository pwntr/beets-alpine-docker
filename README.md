# beets-alpine
A simple and leightweight Docker container for beets, the best tool to organize your music library!


Let's go:
```
docker run -it -v /path/to/music/:/music/ -v /path/to/musictoimport/:/import/ --name=beets pwntr/beets-alpine
```

With permissions and ids of the current user:

```
docker run -it -u "$(id -u):$(id -g)" -v /path/to/music/:/music/ -v /path/to/musictoimport/:/import/ --name=beets pwntr/beets-alpine
```

After the initial run you can start subsequent imports easily (just put new stuff in you imports folder) with:

```
docker start beets
```
