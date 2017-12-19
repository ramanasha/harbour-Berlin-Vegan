TEMPLATE = subdirs
SUBDIRS += src

!packagesExist(sailfishapp) {
# Google Maps geoservice for QtLocation
SUBDIRS += googlemaps

googlemaps.subdir = src/3rdparty/googlemaps

src.depends = googlemaps
}
