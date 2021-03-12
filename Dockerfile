FROM picklecillo/firebase-tools:latest

# Fix issue with JRE installation
RUN sudo mkdir -p /usr/share/man/man1
RUN sudo apt install -y openjdk-11-jre-headless
RUN sudo mkdir /app
COPY ./basic.json /app/basic.json
RUN sudo mkdir /app/fb
WORKDIR /app
COPY ./entrypoint.sh /app/entrypoint.sh
RUN sudo chown -R docker:docker /app
RUN sudo chmod a+x /app/entrypoint.sh
ENTRYPOINT /app/entrypoint.sh
