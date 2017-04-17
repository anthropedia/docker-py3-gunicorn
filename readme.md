# Docker server image based on Python3 and Gunicorn

Run a Docker container for a Python 3 project (Flask, Django, …) with Gunicorn
as a server.

git is enabled and you may use ssh keys (useful for private repositories).

You are expected to have a _requirements.txt_ file at the root of your project.

The image exposes the port 80.
Your path will be mounted as a volume.

> If you make a restful service – such an API – make sure to uppercase the name
of the verbs you use (GET, POST, PUT, PATCH, DELETE, …) as Gunicorn is
case-sensitive.

## Here's a full example

### Building the image

```sh
docker build -t py3-gunicorn .
```

### Running a container

This will create a container, mouting the current system as the root
application, using the _~/.ssh_ folder within the container, then running a
`pip -r requirements.txt` automatically and start Gunicorn on local port 5000.

```sh
docker run -v `pwd`:/app -v ~/.ssh:/root/.ssh:ro -p 5000:80 py3-gunicorn
```

You app is now running on http://localhost:5000.
