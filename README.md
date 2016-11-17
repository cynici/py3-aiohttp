# Asynchronous HTTP server in Docker

This project aims to experiment with lightweight HTTP server based on Python 3.5+ asynchronous I/O e.g. [aiohttp](http://mmariani.github.io/poss2016-aiohttp) suitable for use as REST API server.

It includes asyncio-compatible libraries to connect to the following servers:

- PostgreSQL asyncpg (unlike psycopg2, no mogrify() and named parameters)
- RabbitMQ aioamqp
- RethinkDB rethinkdb.set_loop_type("asyncio")
- MySQL aiomysql

A comprehensive compilation of compatible Python libraries can be found [here](https://github.com/aio-libs/).

In the meantime, informative benchmarks of several Python web frameworks can be found [here](http://klen.github.io/py-frameworks-bench/)

## CAVEAT

Beware of the version of Python 3 interpreter you use and set your PYTHONPATH accordingly.

- `/usr/bin/python3` is version 3.4+
- `/usr/local/bin/python3` is version 3.5+

