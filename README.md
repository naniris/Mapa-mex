# topomex
"Ready to use" version of Mexico maps (for data visualization)

## Sources
* http://www.inegi.org.mx
* http://www.naturalearthdata.com
* http://www.diegovalle.net/projects.html#url=%23datasets
* http://bl.ocks.org/mbostock/9265467

## Maps data
* mx-states - `dist/mx_states.topo.json`

## Examples
* [datamaps + mx-states](http://rawgit.com/josketres/topomex/master/examples/datamaps-mx_states.html)

## Build (generate the maps data yourself)

### Dependencies
* Vagrant
* Virtualbox

### Build

    git clone 
    cd topomex/vagrant
    vagrant up
    vagrant ssh
    /topomex/scripts/create_mx_states_json.sh
