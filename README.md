# High-dimensional Data-driven Energy optimization for Multi-Modal transit Agencies (HD-EMMA)

This is a project funded by Department of Energy for creating high-resolution system-level data capture and analysis framework using Chattanooga Area Regional Transportation Authority (CARTA) as a case study. The system collects high-resolution datasets containing all information about engine idling status, engine temperature, engine speed, throttle, vehicle speed, state of charge, GPS, odometer, fuel usage and level, road gradient, and driver behavior in real-time from CARTA’s fleet of buses, car sharing, and e-bike sharing vehicles at a rate of 1Hz. 

The project is also developing new distributed machine learning methods that can handle data at such rate and scale. These machine learning methods will enable  high-resolution energy consumption predictors, contextualized with features such as vehicle types and events in the city. Having these predictors combined with traffic congestion information obtained from external sources will enable the agencies to identify and mitigate energy efficiency bottlenecks within each specific mode of operation such as electric bus and electric car.

# OpenStreetMap

Folder Name: `Dataset/OSM`

1) `chattanooga_osm.shp`
2) `chattanooga_osm.shx`
3) `chattanooga_osm.cpg`
4) `chattanooga_osm.prj`
5) `chattanooga_osm.dbf`

# Traffic Data

Folder Name: `Dataset/Traffic`

OSM to TMC Conversion Data: `osm_tmc_matching_ids.pickle`
Traffic Data for each TMC ID: `All_TMC_TrafficData_ED.csv`
(hourly averages calculated over the span of 2 months)

# Training Samples for Prediction

Training Samples for Electric: `Dataset/Electric_Vehicles/Electric_Vehicles_Final_Training_Samples.csv`
Training Samples for Diesel: `Dataset/Diesel_Vehicles/Diesel_Vehicles_Final_Training_Samples.csv`
