import React from 'react';
import MapView from '../components/MapView';
import TrafficControl from '../components/TrafficControl';

const Dashboard = () => {
    return (
        <div>
            <h1>Traffic Management Dashboard</h1>
            <MapView />
            <TrafficControl />
        </div>
    );
};

export default Dashboard;
