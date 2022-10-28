## Summury 
This docker Image based on <a href="https://hub.docker.com/_/python">official python image</a>.
```
docker build jupyter -t jupyter --platform linux/x86_64 
```

## To run this image:
```
docker run --rm -p 8888:8888 jupyter
```

* Notebook runs on port 8888
* After container started you can access notebook by urls which will be printed in terminal.

# Mount folder

You can mount any folder by using -v argument. 

NOTE! 
Path to the shared folder inside docker container has to start with /mipt

Here is example of mounting folder "test"
```
docker run --rm -p 8888:8888 -v /PATH/TO/test:/mipt/test jupyter
```