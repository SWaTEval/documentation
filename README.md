# SWaTEval documentation

## Building the documentation

Make sure you are using Python 3.8. To setup a conda environment in Linux run:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x ./Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh
```

Create and activate a virtual environment for Python 3.8

```
conda create -n "scanner" python=3.8
conda actiavte scanner
```

Make sure you have the needed python packages first by running:

```
pip install -r requirements.txt
```

Make sure you install sphynx installed or install it using:

```
apt install python3-sphinx
```

Create an enviromental variable that points to the location of the SWaTEval framework repository on your machine:

```
export SCANNER_PROJECT_LOCATION="**path to the SWaTEval framework repository**"
```

*Note: The setup in `conf.py` uses the env variable SCANNER_PROJECT_LOCATION to reference the scanner project files for auto documentation.*  
Afterwards you should be able to rebuild the project by yourself by using:

```
make html
```

*Note: (Optional) Run the ```./build.sh``` script to automatically delete the old build and create a new one. You must change the path in the ENV variable created in the script before running it.*

## Getting started

To view the documentation you need to run an http-server in the ```/build/html``` directory.

A fast way to do this is by using [Node Js](https://nodejs.org/en/) (assuming that you have it installed on your system).

Install the [http-server](https://github.com/http-party/http-server) package from npm:

```
npm install --global http-server
```

Afterwards simply run in the projects root directory:

```
http-server ./build/html -p 8085
```

The documentation now should be available at http://localhost:8085/general/index.html

## Optional: Run in Docker

You can run the documentation as a Docker container which will build it and host it directly. 

To do so, first build the image using:

```
docker build -t documentation .
``` 
The Dockerfile will build the documentation and host it as an http server on port 8085

Run the image in container by using:

```
docker run --name documentation -p8085:8085 documentation
``` 

Now you should be able to acces the server via http://localhost:8085
