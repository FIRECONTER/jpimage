# jupyter notebook image
## description
This repository is used to auto-build the jupyter notebook image in dockerhub the link is [jpimage](https://hub.docker.com/r/allocator/jpimage/). It is used to train the machine learning model in the cloud site. With the powerful computing function, the model can be trained quickly. You can also use this image to start docker container in any linux virtual machine, so the computing tasks are performed on the server side（cloud or remote virtual machine）

## how to use 
Firstly make sure that your remote virtual machine has installed [docker](https://www.docker.com/)
Secondly use `docker pull allocator/jpimage` to download the image to your remote virtual machine
Thirdly run the `bootstrap.sh` in yout remote virtual machine, then the container will start and you will get an access token
Finally type the url(just **http://{your remote virtual machine ip address}:8888**) in your browser and type the token obtained in the previous step. Then you can use the jupyter notebook smoothly as if it is running in your PC.

## tips
I do not use the `jupyter_notebook_config.py` to realize the password configuration, beacuse if I do this, I will have to log in another jupyter noteboook environment to generate the hashed password, and write it to the `jupyter_notebook_config.py` and then build it to the [jpimage](https://hub.docker.com/r/allocator/jpimage/). I just use the original access token to visit the remote server. Sometimes the remote server may shutdown or the remote docker container may shutdown, so we have to restart the remote container, then the access token will be changed, to get the new access token, just run `docker attach jpcontainer` to get into the container, and type `CTRL C` (**do not shutdown current container just get the new access token**), then you can visit the jupyter notebook with the new token now
