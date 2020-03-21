# Blog

This is an implementation of my personal blog using [Jekyll](http://github.com/mojombo/jekyll)

## Development

### Requirements

- Docker https://docs.docker.com/install/

### Usage

- Build docker image:

```shell
docker build . -t blog
```

- Boot development server:

```shell
docker run --rm -p 4000:4000 -v $(pwd):/app blog jekyll serve
```
