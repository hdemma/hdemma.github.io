# CalculateCharge.ipynb

At first we remove the records when the bus is in around 400meters of the garage.
Then we remove the records when the charging cable connection of the bus is set to one, which implies that the bus is charging
Finally, we calculate charge based on Battery Current and Battery Voltage.

# DataPrep_for_Mapping.ipynb

For each recorded location from the viriciti, we gather the nearby road segments and then we pick one road segment from the set of candidates.
This script handles with the data preparation for feeding into the mapping prediction model.

# ML_for_MapMatching.ipynb

Here we feed the candidate road segments to the prediction model and finally generate the dataset with each location mapped to and OSM Street.

# Generating_Samples.ipynb

Here we generate the locations to training samples based on travel on continuous road segment. For each sample, we calculate distance traveled, time taken, charge consumed etc.
We also one-hot encode the different road types. Then we also prepare samples when the vehicle is turning between different road segments. Finally, we remove the outlier samples.

# addingElevation.ipynb

Here, we aggregate elevation for starting and ending location of each sample.

# addingHourlyTraffic.ipynb

We aggregate hourly average of different weather parameters (humidity, temperature, visibility, etc.)

# addingHourlyTraffic.ipynb

At first, we map each OSM segment to TMC segments. Then using the TMC segments, we aggregate hourly traffic condition. 
We add two features from our traffic dataset to each sample: speed ratio and jam factor. 
Speed ratio is the actual traffic speed over the free-flow speed.
Jam factor indicates the expected quality of travel, ranging from 0
(light or no traffic) to 10 (road closure).

# Modifying_Samples_before_Training.ipynb

Here, we drop unnecessary columns and rearrange the dataset before feeding into the prediction model.
