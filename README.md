# Build a Docker Image for Express Application
With [Express](http://expressjs.com/), you can create a web application with node.js. For now, it's not necessary to have node installed. Instead, you use Docker.

### Dockerfile Manual
What docker daemon does is as follows:

```
FROM node
WORKDIR /myapp
COPY server /myapp
RUN npm install
CMD ["npm", "start"]

```

1. ``FROM node``
  * specify the base image layer. If this image does not exit, docker daemon will pull from the DockerHub automatically.
  * please note that I use the __latest__ version of node because that's the default option. Use certain version with tag if you have to.
2. ``WORKDIR``
  * change the working directory path (If target directory does not exist, create one instead)
  * default working directory is ``/``, and only ``RUN`` command could ``cd`` the directory
  * each ``RUN`` with ``cd`` command only works for their own context
  * with ``WORKDIR``, no ``RUN cd xxxxx/`` is necessary anymore
3. ``COPY``
  * copy files from the current path(all files in the folder) into the container directory
  * the target directory is using absolute path name
4. ``RUN npm install``
  * install npm packages
  * note that with ``WORKDIR`` command, you are under the express folder
5. ``CMD``
  * when you run a container, the express server fires up simultaneously

### Installation Guide
```shell
  docker build -t docker-express:v1.0 .
  docker run -d -p 3000:3000 81becb1253b6 # -d 背景執行 -p 連接阜對應 最後是 image id
```

透過 ``docker ps`` 便可看見執行中的 container:

```shell
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
504404ccfc30        81becb1253b6        "npm start"         About an hour ago   Up About an hour    0.0.0.0:3000->3000/tcp   laughing_kilby
```
