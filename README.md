# Convivio Tika Microservice

This microservice uses [Apache Tika](https://tika.apache.org/) to detact and extract text and metadata from over 1000 different file types.

Runs in Docker.

@TODO

- Complete the README
- Other parts to the service?
  - an app to 
    - accept a file from a queue/event,
    - send it to Tika
    - handle the response from Tika
    - store the extracted text, headers, etc
    - update the event/queue