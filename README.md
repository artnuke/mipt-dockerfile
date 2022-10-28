# How to use guid
## Summury 
This Docker Image based on oficial python image.

## To run this image:
```
docker run --rm -p 8888:8888 jupyter
```

* Notebook runs on port 8888
* After container started you can access notebook by printed urls

# Mount folder

You can mount any folder by using -v argument. NOTE! Your destination path has to start with /mipt.

Here is example of mounting folder "test"
```
docker run --rm -p 8888:8888 -v /PATH/TO/test:/mipt/test jupyter
```