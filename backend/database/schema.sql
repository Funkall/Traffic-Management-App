CREATE TABLE TrafficZones (
    id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL
);
