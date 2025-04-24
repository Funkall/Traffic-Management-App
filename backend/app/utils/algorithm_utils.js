const haversineDistance = (pointA, pointB) => {
    const toRadians = (degree) => (degree * Math.PI) / 180;

    const R = 6371;
    const dLat = toRadians(pointB.lat - pointA.lat);
    const dLng = toRadians(pointB.lng - pointA.lng);

    const lat1 = toRadians(pointA.lat);
    const lat2 = toRadians(pointB.lat);

    const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.sin(dLng / 2) * Math.sin(dLng / 2) * Math.cos(lat1) * Math.cos(lat2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

    return R * c;
};

const calculateSignPlacement = (roadLength, recommendedSpacing) => {
    const numberOfSigns = Math.ceil(roadLength / recommendedSpacing);
    const positions = [];

    for (let i = 1; i <= numberOfSigns; i++) {
        positions.push(i * recommendedSpacing);
    }

    return positions;
};

const getSmartSignagePlan = ({ location, roadType, speedLimit, workType, position, movementType }) => {
    const baseItems = [];

    baseItems.push({
        signCode: "T1-18",
        type: "sign",
        description: "Advance Warning",
        distance: roadType === 'rural' ? speedLimit * 2 : speedLimit,
        angle: -90
    });

    baseItems.push({
        signCode: "T1-5",
        type: "sign",
        description: "Workers Ahead",
        distance: roadType === 'rural' ? speedLimit : speedLimit * 0.75,
        angle: -45
    });

    for (let i = 0; i < 4; i++) {
        baseItems.push({
            type: "cone",
            description: `Cone ${i + 1}`,
            distance: 5 + i * 2,
            angle: 0
        });
    }

    baseItems.push({
        type: "barrier",
        description: "Water Filled Barrier",
        distance: 2,
        angle: 90
    });

    baseItems.push({
        type: "controller",
        description: "Traffic Controller",
        distance: 8,
        angle: 60
    });

    return {
        items: baseItems
    };
};

module.exports = {
    haversineDistance,
    calculateSignPlacement,
    getSmartSignagePlan
};