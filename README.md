## Code Challenge

This service contains 4 modules. They comply with the order below:

1. generator module: prepare messages and send by HTTP request(up to 10k)
2. coordinator module: receives requests by API and hands over them to the web socket connection
3. aggregator module: receives WS. requests, do a support backup in the database based on transactional outbox, send them to KAFKA, consume the KAFKA messages, and send them to a WS conn. of the processor module.
4. the processor module: receives the WS. request and sum up the total count and total size of received messages.

### Quick Start

- To receive the project:

```shell
git clone git@github.com:milix90/gcc.git
```

- To  run the service based on docker-compose:
```shell
make run
```

- To generate the message and see the result, run the commands in the order:

the processor module that displays the total count and total size in the STDOUT.
```shell
make watch
```

the generator module that generates and sends 10K messages within 1 t0 2 seconds based on goroutines.
```shell
make msg
```

- To stop the containers:
```shell
make down
```
