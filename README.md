Home page : The public site is available here: https://hdemma.github.io/

# High-dimensional Data-driven Energy optimization for Multi-Modal transit Agencies (HD-EMMA)

This is a project funded by Department of Energy for creating high-resolution system-level data capture and analysis framework using Chattanooga Area Regional Transportation Authority (CARTA) as a case study. The system collects high-resolution datasets containing all information about engine idling status, engine temperature, engine speed, throttle, vehicle speed, state of charge, GPS, odometer, fuel usage and level, road gradient, and driver behavior in real-time from CARTA’s fleet of buses, car sharing, and e-bike sharing vehicles at a rate of 1Hz. 

The project is also developing new distributed machine learning methods that can handle data at such rate and scale. These machine learning methods will enable  high-resolution energy consumption predictors, contextualized with features such as vehicle types and events in the city. Having these predictors combined with traffic congestion information obtained from external sources will enable the agencies to identify and mitigate energy efficiency bottlenecks within each specific mode of operation such as electric bus and electric car.

Project collaborators include [Chattanooga Regional Transit Authority](http://www.carta-bus.org), [Scope Lab at Vanderbilt University](https://scope-lab.org), the University of Houston, the University of South Carolina, Chattanooga Department of Transportation, the Enterprise Center, and the East Tennessee Clean Fuels Coalition. 

# Research Approach

The team’s approach is to use continuous monitoring sensors on the complete mix of CARTA transit buses and to develop predictors and optimization mechanisms using the data.  Specific activities are:

*	Acquire high-resolution (updated every minute) spatio-temporal telemetry data from CARTA vehicles and exogenous data sources, such as traffic and weather
*	Develop an efficient framework to store and process the operational data and external data, including street and elevation maps
*	Create macro-level energy predictor using route information and general fleet parameters
*	Create a higher-resolution micro model that is tuned to specific vehicle parameters
*	Create an optimization framework to select the optimal assignment of vehicles to trips with the goal of reducing overall energy consumption
*	Develop a visualization framework to analyze the data

# Datasets

CARTA operates a mix of vehicle types, including gasoline powered vans, diesel and diesel-hybrid buses, battery-electric shuttles, and battery-electric buses, with production dates ranging from 1998 to 2016. CARTA provides service with 17 fixed routes, 3 neighborhood demand-response routes, 2 downtown circulator routes, and a complementary ADA paratransit service. The team configured operating data associated with vehicle routes, passenger counts, bus operators, and baseline performance for analysis. CARTA selected and installed a telematics kit produced by [ViriCiti LLC (the DataHub)](https://viriciti.com) on each CARTA fleet vehicle, to provide a real-time data stream at a minimum 1 Hz resolution of all available vehicle operating parameters, as well as GPS positioning for each record.  To ensure that we resolve this problem, the team has implemented a  cloud-centric data collection and processing framework integrating MongoDB and Apache Pulsar.

The list of data recorded includes traffic and weather; speed, current, voltage and state of charge for all electrical vehicles; speed (km/h), fuel level, and engine fuel rate for ICEVs; various engine and driver parameters, including "accelerator pedal position"; GPS position; route; trip updates and patterns for all vehicles. All data is available from August 2019 onwards. 

We provide access to snapshots of these data for public consumption below. We are working on releasing other datasets in the future.

## OpenStreetMap

Openstreet map dataset provide variour shape files required for geo-spatial analysis. 

These files are available as listed below. To understand the differences between these files please visit https://wiki.openstreetmap.org/wiki/Shapefiles

Folder Name: [Dataset/OSM](Dataset/OSM)

- [chattanooga_osm.shp](Dataset/OSM/chattanooga_osm.shp)
- [chattanooga_osm.shx](Dataset/OSM/chattanooga_osm.shx)
- [chattanooga_osm.cpg](Dataset/OSM/chattanooga_osm.cpg)
- [chattanooga_osm.prj](Dataset/OSM/chattanooga_osm.prj)
- [chattanooga_osm.dbf](Dataset/OSM/chattanooga_osm.dbf)

## Vehicle Telemetry Data

The vehicle telemetery data is available for three diesel vehicles and three electric vehicles from months of September and October 2019. More data will be available soon. 

- [Gillig 148](http://aronlaszka.com/data/Gillig148_2019-08-22-0000_2019-10-16-0000.csv)
- [Gillig 149](http://aronlaszka.com/data/Gillig149_2019-08-22-0000_2019-10-16-0000.csv)
- [Gillig 150](http://aronlaszka.com/data/Gillig150_2019-08-22-0000_2019-10-16-0000.csv)
- [BYD 751](http://aronlaszka.com/data/BYD751_2019-08-01-0000_2019-10-01-0000.csv)
- [BYD 752](http://aronlaszka.com/data/BYD752_2019-08-01-0000_2019-10-01-0000.csv)
- [BYD 753](http://aronlaszka.com/data/BYD753_2019-08-01-0000_2019-10-01-0000.csv)

## Weather Data

[2019 August to October](http://aronlaszka.com/data/2019_Weather_August_to_October.csv)

## Elevation Data

[State of Tennessee / GIS Data](https://www.tn.gov/finance/sts-gis/gis/data.html)

# Prediction Models

Using telemetry from the ViriCiti DataHub and external data sources, including weather, elevation, street-level maps, and traffic, the team trained and evaluated models for predicting energy as shown in the figure below.

![Prediction Workflow](images/energypredictionworkflow.png)

For EVs, the team collected the following features: timestamp, GPS-based position (latitude and longitude), battery current (A), battery voltage (V), battery state of charge (%), and charging cable status (0 or 1). For diesel and hybrid vehicles, instead of battery data, the team collected fuel level (%) and fuel used, in gallons. 
For energy usage prediction, the team completed the following steps:

1.	Data Cleansing: Based on the GPS positions, the team first removed all data points that were acquired when a vehicle was in the garage, and considered a vehicle leaving the garage to be the starting point for calculating energy consumption. For EVss, based on the charging cable status, the team also removed all data points that were acquired when a vehicle was charging.
2.	Calculating and Verifying Energy Consumption: Next, the team computed the energy consumed between consecutive data points. For EVs, the team converted changes in the state of charge (%) values to energy consumption, in Joules, based on the total capacity of the battery (1.8 × 109 Joule for the CARTA vehicles). The team also computed energy consumption by integrating the product of the measured current and voltage values and verified that these consumption values coincided with changes in state of charge. Since the current and voltage-based values are more accurate than state of charge-based values, the team used the former in subsequent steps. For diesel and hybrid vehicles, the team performed similar steps with fuel level and fuel used.
3.	Cleansing Locations and Mapping to Roads: The GPS based locations collected from the ViriCiti portal are inherently noisy, meaning some of the locations reported fall onto side-streets, where vehicles do not travel, onto parking lots, and even inside buildings. To remove noise, the team used a street-level map from OpenStreetMap. The team developed an algorithm that filters data and maps a GPS based location onto a street, considering previous and subsequent location measurements and various characteristics of nearby streets, and determines how likely it is that a vehicle travels on them. 
4.	Sample Generation: Given the data points with street-level data, the team segmented time series into disjoint contiguous samples based on contiguous road segments, and, again, performed outlier detection and removal. 
5.	Augmenting Samples with Elevation and Weather Data: For each sample, the team added features corresponding to elevation changes within the samples, and weathers features, such as temperature. 
6.	Training and Test Sets: For each type of vehicle, the team created training and test sets by dividing samples randomly. For each vehicle type, the entire dataset spans more than 3 months of data, collected at 1 Hz.
The prediction models used the following sample features: distance traveled, travel time, road types (e.g., motorway, residential), elevation change, weather features, and energy (fuel or electricity) consumed.
The team applied three different approaches for creating prediction models: linear regression, deep feed-forward neural-network learning, and decision-tree regression. The team compared the performance of these approaches based on their mean prediction errors for the test datasets and found that decision tree regression results in the most accurate prediction. 

## Notebooks showing the analysis

- [Electric Vehicles](Macro_Prediction_Models/Prediction_Script_Electric.ipynb)

## Data Samples for Energy Prediction Models

- Samples for Electric: [Dataset/Electric_Vehicles/Electric_Vehicles_Final_Training_Samples.csv](Dataset/Electric_Vehicles/Electric_Vehicles_Final_Training_Samples.csv)
- Samples for Diesel: [Dataset/Diesel_Vehicles/Diesel_Vehicles_Final_Training_Samples.csv](Dataset/Diesel_Vehicles/Diesel_Vehicles_Final_Training_Samples.csv)



