### General
* [ ] Navigation to all links
* [ ] Simple styling present

### Iteration 1

* [x] See all stations
* [x] See one station
* [x] Create a new station
* [x] Update a station
* [x] Delete a station (from either index or show)
* [x] Cannot save without name, dock count, city, installation date

### Iteration 2

* [x] 70 Stations Load from CSV

### Iteration 3

On `/station-dashboard`:

* [x] Total count of stations
* [x] Average bikes available per station (based on docks).
* [x] Most bikes available at a station (based on docks).
* [x] Station(s) where the most bikes are available (based on docks).
* [x] Fewest bikes available at a station (based on docks).
* [x] Station(s) where the fewest bikes are available (based on docks).
* [x] Most recently installed station.
* [x] Oldest station.

### Iteration 4

* [x] See all trips
  * [x] route
  * [x] view
  * [x] test
* [x] See one trip
  * [x] route
  * [x] view
  * [x] test
* [x] Create a new trip
  * [x] route
  * [x] view
  * [x] test
* [x] Update a trip
  * [x] route
  * [x] view
  * [x] test
* [x] Delete a trip (from either index or show)
  * [x] route
  * [x] view
  * [x] test

* [x] All attributes (except zip code) must be present: duration, start date, start station, end date, end station, bike ID, subscription type)
  * [x] model test
* [x] Trips are paginated in groups of 30
  * [x] route
  * [x] view
  * [ ] test

### Iteration 5

* [x] Trips load from CSV

### Iteration 6

On `/trips-dashboard`:

* [x] test setup

* [x] Average duration of a ride.
  * [x] method
  * [x] view
  * [x] test
* [x] Longest ride.
  * [x] method
  * [x] view
  * [x] test
* [x] Shortest ride.
  * [x] method
  * [x] view
  * [x] test
* [x] Station with the most rides as a starting place.
  * [x] method
  * [x] view
  * [x] test
* [x] Station with the most rides as an ending place.
  * [x] method
  * [x] view
  * [x] test
* [x] Month by Month breakdown of number of rides with subtotals for each year.
  * [x] method
  * [x] view
  * [x] test
* [ ] Most ridden bike with total number of rides for that bike.
  * [x] method
  * [ ] total_number_of_rides_for_bike
  * [x] view
  * [x] test
* [ ] Least ridden bike with total number of rides for that bike.
  * [x] method
  * [ ] total_number_of_rides_for_bike
  * [x] view
  * [x] test
* [x] User subscription type breakout with both count and percentage.
  * [x] method
  * [x] view
  * [x] test
* [x] Single date with the highest number of trips with a count of those trips.
  * [x] method
  * [x] view
  * [x] test
* [x] Single date with the lowest number of trips with a count of those trips.
  * [x] method
  * [x] view
  * [x] test

On an individual station show page the additional information should be present:

* [x] test setup

* [x] Number of rides started at this station.
  * [x] method
  * [x] view
  * [x] test
* [x] Number of rides ended at this station.
  * [x] method
  * [x] view
  * [x] test
* [x] Most frequent destination station (for rides that began at this station).
  * [x] method
  * [x] view
  * [x] test
* [x] Most frequent origination station (for rides that ended at this station).
  * [x] method
  * [x] view
  * [x] test
* [x] Date with the highest number of trips started at this station.
  * [x] method
  * [x] view
  * [x] test
* [x] Most frequent zip code for users starting trips at this station.
  * [x] method
  * [x] view
  * [x] test
* [x] Bike ID most frequently starting a trip at this station.
  * [x] method
  * [x] view
  * [x] test

### Iteration 7

* [ ] See all conditions
  * [x] route
  * [x] view
  * [ ] test
* [ ] See one condition
  * [ ] route
  * [ ] view
  * [ ] test
* [ ] Create a new condition
  * [x] route
  * [x] view
  * [ ] test
* [ ] Update a condition
  * [x] route
  * [x] view
  * [ ] test
* [ ] Delete a station (from both index or show)
  * [x] route
  * [x] view
  * [ ] test
* [ ] Conditions are paginated by groups of 30
  * [x] route
  * [x] view
  * [ ] test

### Iteration 8

* [x] Weathers load from CSV

### Iteration 9

On `/weather-dashboard`:

* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
  * [ ] method
  * [ ] view
  * [ ] test
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
  * [ ] method
  * [ ] view
  * [ ] test
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
  * [ ] method
  * [ ] view
  * [ ] test
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.
  * [ ] method
  * [ ] view
  * [ ] test

Additional information on the `trip-dashboard`:

* [ ] Weather on the day with the highest rides.
  * [ ] method
  * [ ] view
  * [ ] test
* [ ] Weather on the day with the lowest rides.
  * [ ] method
  * [ ] view
  * [ ] test
