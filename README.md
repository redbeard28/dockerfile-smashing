# FORK from smashing original repo

## Why
The purpose of toses modification are to include this repo in an ansible role to deploy multiples dashboards for IoT uses.


## Run
```docker run -d -p 8080:3030 redbeard28/dashenix```

And point your browser to [http://localhost:8080/](http://localhost:8080/).


## Configuration
### Custom dashenix port
If you want dashenix to use a custom port inside the container, e g 8080, use the environment variable `$PORT`:

```docker run -d -e PORT=8080 -p 80:8080 redbeard28/dashenix```

## Thanks
- [@visibilityspots](https://registry.hub.docker.com/u/visibilityspots/smashing/).
- [@mattgruter](https://github.com/mattgruter), awsome contributions!
- [@rowanu](https://github.com/rowanu), [Hotness Widget](https://gist.github.com/rowanu/6246149).
- [@munkius](https://github.com/munkius), [fork](https://gist.github.com/munkius/9209839) of Hotness Widget.
- [@chelsea](https://github.com/chelsea), [Random Aww](https://gist.github.com/chelsea/5641535).

## License
Distributed under the MIT license
