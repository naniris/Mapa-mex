## Download map info from INEGI (Mexican official source)
if [ ! -f estados.zip ]
then
    curl -o estados.zip http://mapserver.inegi.org.mx/MGN/mge2010v5_0.zip
fi

unzip -u estados.zip

## shapefile --> topojson (http://datamaps.markmarkoh.com/using-custom-map-data-w-datamaps)
ogr2ogr states.shp Entidades_2010_5.shp -t_srs "+proj=longlat +ellps=WGS84 +no_defs +towgs84=0,0,0"

## id-property needed so that DataMaps knows how to color the map (entity name is the id)
topojson -o /topomex/dist/mx_states.topo.json -s 1e-7 -q 1e5 states.shp -p state_code=+CVE_ENT,name=NOM_ENT --id-property NOM_ENT
echo "Map data '/topomex/dist/mx_states.topo.json' successfully generated"