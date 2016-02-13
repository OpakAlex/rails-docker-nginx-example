=== Install:
 - `brew install virtualbox`
 - `brew install docker`
 - `brew install docker-compose`
 - `brew install docker-machine`
 - `brew install dnsmasq`
 -  Add to `/etc/exports` line:  "/Users" 192.168.99.100 -alldirs -mapall=501:20
 -  Add to `/etc/resolver/devs` line: nameserver 192.168.99.100
 - `sudo nfsd restart`

=== Run with docker:
- `docker-machine create --driver virtualbox --virtualbox-memory 4096 --virtualbox-disk-size 20480 --virtualbox-cpu-count 4 lab`
- `docker-machine start lab`
- `docker-machine env lab`
- `eval $(docker-machine env lab)`
- `docker-compose build`
- `cd bin && ./install.rb && cd ..`
- `docker-machine restart lab`
- `docker-machine env lab`
- `eval $(docker-machine env lab)`
- `docker-compose run web bundle install`
- `docker-compose run web rake db:create`
- `docker-compose up`
- Open in browser 'testapp.dev'
