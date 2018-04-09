# logstation
Tail log files in web browser (docker)
Docker Version from https://github.com/jdrews/logstation.

### /docker/logstation/logstation.conf
```
logstation {
    # Windows example of setting up logs
    logs=["/log/messages","/log/daemon.log"]
    # Unix example of setting up logs
    # logs=["/home/jdrews/git/logstation/logfile.log","/home/jdrews/git/logstation/logfile2.log"]

    # Setup your syntax below
    # <some-name>=[<RGB_HEX>,<regex-for-line-matching>]
    # matching gives priority to the top most
    syntax {
        # red
        error=["#FF1F1F",".*ERROR.*"]
        # yellow
        warn=["#F2FF00",".*WARN.*"]
        # green
        info=["#00FF2F",".*INFO.*"]
        # blue
        debug=["#4F9BFF",".*DEBUG.*"]
        # cyan
        trace=["#4FFFF6",".*TRACE.*"]
    }

    # Web Server Port
    #    The port used to connect to the LogStation
    webServerPort=8884

    # Number of lines to display per log file
    #    any logs over this will truncate the oldest lines from the page
    maxLogLinesPerLog=500

    # Number of messages to buffer on server
    #    These will be sent to any new connections so they have some history of logs
    #    bufferLength is multiplied by number of logs, and buffered on best effort for each log
    bufferLength=10
}
```

## docker-compose.yml
```
version: '2'

services:
  logstation:
    container_name: logstation
    image: pipp37/logstation
    restart: always

    ports:
      - "8884:8884"
    volumes:
      - "/var/log:/log"
      - "/docker/logstation/logstation.conf:/logstation/logstation.conf"
```
### docker run 
```
docker run  -d  -p 8884:8884 -v /var/log:/log -v /docker/logstation/logstation.conf:/logstation/logstation.conf  --name log logstation
```

