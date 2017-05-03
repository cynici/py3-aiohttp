# Asynchronous HTTP server in Docker

This project aims to experiment with lightweight HTTP server based on Python 3.5+ asynchronous I/O e.g. [aiohttp](http://mmariani.github.io/poss2016-aiohttp) suitable for use as REST API server.

The operative word for this repo is **experiment** because Python 3 asyncio is still in a [state of flux somewhat](http://lucumr.pocoo.org/2016/10/30/i-dont-understand-asyncio/). As a point of interest, David Beazley's [Curio](https://github.com/dabeaz/curio) does it faster and simpler!

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
- Just before importing packages installed using `apt-get`, e.g. `yaml`, `shapely`, etc. do this in your code,

```
sys.path.append('/usr/lib/python3/dist-packages')
```

