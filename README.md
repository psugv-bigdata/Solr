# Solr
- This is a step by step guide to start a docker container for Solr on Ubuntu 14.04 Container.
- Please ensure that you have the corresponding Dockerfile before following the procedure steps.
- Solr will be running on port 8983 inside the docker container and the host port to access it is 8983.

Steps:
------
1. Ensure that docker is installed on your host machine.
2. Ensure that the Dockerfile is placed in required directory. Usually it is best practice to keep it in your /home.
3. Make sure that the file is spelled correctly i.e "Dockerfile". If file has other name, extension then this doesn't work
4. We need to build the image before it can be deployed in the docker engine. Navigate to directory where the Docker file is placed and run the below command :

- $ docker build .

* Note the image id at displayed by docker at the end of the successful build. It should be something similar to this 85f9ce11db88. 

* The container can be deployed/run on the host machine using the below command:
- $ docker run --name solr -d -p 8983:8983 6fecc596374c

* Please note your image id may be different than 6fecc596374c

* -d switch runs image in detached mode and -p forwards the hostport:destination port likewise.

* You can check status of available containers and images using command to see the
- $ docker ps -a

-You should see the name of your container with the associated Container id with current status

* Allow connections to specified port on the host machine using the following command:
- $ sudo ufw allow 8983

* You can now use the following url to connect to solr.
http://192.168.100.15:8983/
