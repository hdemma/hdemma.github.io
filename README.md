# High-dimensional Data-driven Energy optimization for Multi-Modal transit Agencies (HD-EMMA)

This is a project funded by Department of Energy for creating high-resolution system-level data capture and analysis framework using Chattanooga Area Regional Transportation Authority (CARTA) as a case study. The system collects high-resolution datasets containing all information about engine idling status, engine temperature, engine speed, throttle, vehicle speed, state of charge, GPS, odometer, fuel usage and level, road gradient, and driver behavior in real-time from CARTA’s fleet of buses, car sharing, and e-bike sharing vehicles at a rate of 1Hz. 

The project is also developing new distributed machine learning methods that can handle data at such rate and scale. These machine learning methods will enable  high-resolution energy consumption predictors, contextualized with features such as vehicle types and events in the city. Having these predictors combined with traffic congestion information obtained from external sources will enable the agencies to identify and mitigate energy efficiency bottlenecks within each specific mode of operation such as electric bus and electric car.

# OpenStreetMap

Folder Name: `Dataset/OSM`

- `chattanooga_osm.shp`
- `chattanooga_osm.shx`
- `chattanooga_osm.cpg`
- `chattanooga_osm.prj`
- `chattanooga_osm.dbf`

# Vehicle Telemetry Data

- [Gillig 148](http://aronlaszka.com/data/Gillig148_2019-08-22-0000_2019-10-16-0000.csv)
- [Gillig 149](http://aronlaszka.com/data/Gillig149_2019-08-22-0000_2019-10-16-0000.csv)
- [Gillig 150](http://aronlaszka.com/data/Gillig150_2019-08-22-0000_2019-10-16-0000.csv)
- [BYD 751](http://aronlaszka.com/data/BYD751_2019-08-01-0000_2019-10-01-0000.csv)
- [BYD 752](http://aronlaszka.com/data/BYD752_2019-08-01-0000_2019-10-01-0000.csv)
- [BYD 753](http://aronlaszka.com/data/BYD753_2019-08-01-0000_2019-10-01-0000.csv)

# Traffic Data

Folder Name: `Dataset/Traffic`

- OSM to TMC Conversion Data: `osm_tmc_matching_ids.pickle`
- Traffic Data for each TMC ID: `All_TMC_TrafficData_ED.csv`
(hourly averages calculated over the span of 2 months)

# Weather Data

[2019 August to October](http://aronlaszka.com/data/2019_Weather_August_to_October.csv)

# Elevation Data

[State of Tennessee / GIS Data](https://www.tn.gov/finance/sts-gis/gis/data.html)

# Samples for Energy Prediction

- Samples for Electric: [Dataset/Electric_Vehicles/Electric_Vehicles_Final_Training_Samples.csv](Dataset/Electric_Vehicles/Electric_Vehicles_Final_Training_Samples.csv)
- Samples for Diesel: [Dataset/Diesel_Vehicles/Diesel_Vehicles_Final_Training_Samples.csv](Dataset/Diesel_Vehicles/Diesel_Vehicles_Final_Training_Samples.csv
)
