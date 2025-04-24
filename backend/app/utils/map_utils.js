function getLatLngOffsets(origin, distance, angleDegrees) {
    const earthRadius = 6378137;

    const angleRad = (angleDegrees * Math.PI) / 180;

    const offsetLat = (distance * Math.cos(angleRad)) / earthRadius;
    const offsetLng = (distance * Math.sin(angleRad)) / (earthRadius * Math.cos((origin.lat * Math.PI) / 180));

    return {
        lat: origin.lat + (offsetLat * 180) / Math.PI,
        lng: origin.lng + (offsetLng * 180) / Math.PI
    };
}

module.exports = {
    getLatLngOffsets
};