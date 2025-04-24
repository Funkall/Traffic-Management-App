// frontend/src/utils/mapUtils.js
import axios from 'axios';

export const createMapMarker = async (latitude, longitude, label, apiKey) => {
    try {
        const response = await axios.post(
            `https://maps.googleapis.com/maps/api/place/add/json?key=${apiKey}`,
            {
                location: { lat: latitude, lng: longitude },
                accuracy: 50,
                name: label,
            }
        );
        return response.data;
    } catch (error) {
        console.error('Error creating map marker:', error.message);
        throw error;
    }
};

export const createTrafficZone = (map, coordinates, color = '#FF0000') => {
    const zone = new google.maps.Polygon({
        paths: coordinates,
        strokeColor: color,
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: color,
        fillOpacity: 0.35,
    });

    zone.setMap(map);
    return zone;
};
