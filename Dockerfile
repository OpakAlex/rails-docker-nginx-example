# Base image
FROM ruby:latest

RUN mkdir -p /app
WORKDIR /app

# Install PGsql dependencies and js engine
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	           postgresql-client libpq-dev \
					   nodejs npm \
					   git less lsof net-tools netcat tidy && \
  ln -s /usr/bin/nodejs /usr/bin/node && \
	rm -rf /var/lib/apt/lists/* 

ENV WORKDIR=/app PATH=/app/bin:${PATH} TERM=xterm CONTAINER=web LANG=C.UTF-8

# Default command

EXPOSE 3000 
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
