
import React, { useEffect, useState } from 'react';
import { GoogleMap, useJsApiLoader, Marker, Polygon } from '@react-google-maps/api';
import axios from 'axios';

const containerStyle = {
  width: '100%',
  height: '500px'
};

const center = {
  lat: -33.869,
  lng: 151.208
};

function MapView() {
  const [mapData, setMapData] = useState(null);

  const { isLoaded } = useJsApiLoader({
    id: 'google-map-script',
    googleMapsApiKey: process.env.REACT_APP_GOOGLE_MAPS_API_KEY
  });

  useEffect(() => {
    axios.get('http://localhost:3000/api/traffic/plans/1/tgs')
      .then(response => setMapData(response.data))
      .catch(error => console.error("Error loading TGS data:", error));
  }, []);

  return isLoaded ? (
    <GoogleMap
      mapContainerStyle={containerStyle}
      center={center}
      zoom={16}
    >
      {mapData && mapData.signs.map((sign, index) => (
        <Marker key={`sign-${index}`} position={{ lat: sign.lat, lng: sign.lng }} label="S" />
      ))}
      {mapData && mapData.cones.map((cone, index) => (
        <Marker key={`cone-${index}`} position={{ lat: cone.lat, lng: cone.lng }} label="C" />
      ))}
      {mapData && mapData.barriers.map((barrier, index) => (
        <Marker key={`barrier-${index}`} position={{ lat: barrier.lat, lng: barrier.lng }} label="B" />
      ))}
      {mapData && mapData.controllers.map((ctrl, index) => (
        <Marker key={`ctrl-${index}`} position={{ lat: ctrl.lat, lng: ctrl.lng }} label="TC" />
      ))}
      {mapData && mapData.controllerVehicles.map((vehicle, index) => (
        <Marker key={`vehicle-${index}`} position={{ lat: vehicle.lat, lng: vehicle.lng }} label="V" />
      ))}
      {mapData && mapData.plantVehicles.map((plant, index) => (
        <Marker key={`plant-${index}`} position={{ lat: plant.lat, lng: plant.lng }} label="P" />
      ))}
      {mapData && mapData.workers.map((worker, index) => (
        <Marker key={`worker-${index}`} position={{ lat: worker.lat, lng: worker.lng }} label="W" />
      ))}
      {mapData && (
        <Polygon
          paths={mapData.zone}
          options={{
            fillColor: '#FF0000',
            fillOpacity: 0.1,
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2
          }}
        />
      )}
    </GoogleMap>
  ) : <></>;
}

export default React.memo(MapView);
