very simple to use perl site generator 

## local dev
```
plackup bin/app.psgi
```

## Docker
```
docker build -t KopkeWeb .
docker run -d -p 5000:4000 KopkeWeb .
```
