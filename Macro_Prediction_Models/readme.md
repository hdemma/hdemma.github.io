## Prediction Models

# Features for Training:

	1.	Distance of a sample
	2.	One-hot encoded different road types  (primary, primary-link, secondary, secondary-link,  tertiary, tertiary-link,  trunk, service,  residential, track, unclassified, motorway, motorway-link etc)
	3.	Change in elevation
	4.	Weather features (Humidity, precipitation, temperature, Visibility, Wind-speed)
	5.	Traffic data (Day of week, Time of day, Speed ratio between actual speed limit and free flow speed, Jam factor of the road segment)

**Based on empirical results:

For diesel buses, we achieve best results using 21 predictor variables: travel distance, 14 road-type features, elevation change, 3 weather features, and 2 traffic features.
For electric buses, we achieve best results using 23 predictor variables, which include 2 more weather features.

# Target Feature: 

Energy Consumption (gallons or Watt-seconds)

# Artificial Neural Network:

Based on our experiments, we found that different network structures work best for diesel and electric vehicles.

For Electric vehicles, the best model has 

	•	One input layer 	
		- Has one neuron for each predictor variable 
	•	Two hidden layers  	
		- Have 100 neurons and 80 neurons, respectively 	
		- Both layers have ‘sigmoid’ activation function 
	•	One output layer.  	
		- Linear activation function 

The model is optimized using adam optimizer with a default learning rate 0.001

For Diesel vehicles, the best model has 

	•	One input layer 	
		- Has one neuron for each predictor variable 
	•	Five hidden layers  	
		- 400, 200, 100, 50, and 25 neurons, respectively. 	
		- All the layers have ‘sigmoid’ activation function 
	•	One output layer.  	
		- Linear activation function 

The model is optimized using adam optimizer with a default learning rate 0.001.

# Decision Tree:
 
We use the implementation provided by the scikit-learn Python library. The maximum depth of the tree is set to the total number of features in order to reduce memory consumption. To avoid overfitting, we experimented with different numbers to find the best fit for the minimum number of samples required to split an internal node. The value can either be a integer indicating the minimum number or a floating point value  indicating fraction and ceil(min_samples_split * n_samples) are the minimum number of samples for each split. For Electric vehicles, min_samples_leaf = 8 performs better whereas min_samples_leaf=0.002 works best for diesel.


# Linear Regression: 

Standard multiple Linear Regression model. We evaluate the model based on R-square value and Mean Squared Error (MSE).
