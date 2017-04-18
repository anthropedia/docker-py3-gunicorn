# Docker server image based on Python3 and Gunicorn

Run a Docker container for a Python 3 project (Flask, Django, …) with Gunicorn
as a server. Eventually this can be behind a Nginx proxy for multiple websites.

Git is enabled and OpenSSH installed and _.ssh_ folder mountable as a volume.
You may therefore use ssh keys and private repositories.

A _requirements.txt_ file is expected at the root of your project.

The image exposes the port 80.
The project should be mounted as a volume.

> If you make a restful service – such as an API – make sure to uppercase the
verbs you use (GET, POST, PUT, PATCH, DELETE, …) as Gunicorn is case-sensitive.

## Here's a full example

### Building the image

```sh
docker build -t gunicorn-server .
```

### Running a container

This will create a container, mounting the current system as the root
application, using the _~/.ssh_ folder within the container, then running a
`pip -r requirements.txt` automatically and start Gunicorn on local port 5000.

```sh
docker run -v `pwd`:/app -v ~/.ssh:/root/.ssh:ro -p 5000:80 gunicorn-server
```

You app is now running on http://localhost:5000.
