echo 'start the jupyterimage container'
docker run \
-dit \
--name=jpcontainer \
-h jpcontainer \
-v /home/jpdir:/home/jpdir \
-p 8888:8888 \
allocator/jpimage \
--no-browser \
--ip 0.0.0.0 \
--notebook-dir /home/jpdir \
--NotebookApp.password_required=false \
--allow-root
