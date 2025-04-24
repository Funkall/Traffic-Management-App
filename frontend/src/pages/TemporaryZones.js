import React, { useState, useEffect } from 'react';
import { fetchTrafficZones } from '../utils/api';

const TemporaryZones = () => {
    const [zones, setZones] = useState([]);

    useEffect(() => {
        fetchTrafficZones()
            .then((data) => setZones(data))
            .catch((error) => console.error('Error:', error));
    }, []);

    return (
        <div>
            <h2>Temporary Zones</h2>
            <ul>
                {zones.map((zone) => (
                    <li key={zone.id}>{zone.location} - {new Date(zone.start_time).toLocaleString()}</li>
                ))}
            </ul>
        </div>
    );
};

export default TemporaryZones;
