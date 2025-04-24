import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Dashboard from './pages/Dashboard';
import IncidentManagement from './pages/IncidentManagement';

const App = () => {
    return (
        <Router>
            <Routes>
                <Route path="/" element={<Dashboard />} />
                <Route path="/incidents" element={<IncidentManagement />} />
            </Routes>
        </Router>
    );
};

export default App;
