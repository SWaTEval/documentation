FROM python:3.8 AS build 
COPY . /documentation
WORKDIR /documentation
RUN pip install -r requirements.txt
RUN make html

FROM node
USER root
RUN npm install --global http-server
COPY --from=build /documentation/build/html /html
WORKDIR /html

EXPOSE 8085
CMD http-server -p 8085 



