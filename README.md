# beets-alpine
A simple and leightweight Docker container for beets, the best tool to organize your music library!

## Let's go:
```
docker run -it --rm -u "$(id -u):$(id -g)" -v /path/to/config/:/config/ -v /path/to/music/:/music/ -v /path/to/musictoimport/:/import/ pwntr/beets-alpine
```

### Explanation:
- `--it`: Attaches an interactive terminal. You might have to / want to make some decisions during your music import.
- `--rm`: Deletes the container after beets terminates. Dont worry, you still have your image, and container instantiation is lightning fast.
- `-u "$(id -u):$(id -g)"`: Runs everything as the current user. Using any user or group id is as easy as `-u <uid>:<gid>`.
- `-v /path/to/config/:/config/`: You might've guessed it, the path to your config folder. Beets stores everything like its config, db, plugin sidecar files, etc. here.
- `-v /path/to/music/:/music/`: This is where the nicely sorted music will be put after beets is done.
- `-v /path/to/musictoimport/:/import/`: The place where all the messy and cluttered stuff you want to import resides. You should clean up this folder after every import. And by clean up I mean delete all its content. Really, get just rid of it.
