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
* [ ] Create a new trip
  * [x] route
  * [x] view
  * [ ] test
* [ ] Update a trip
  * [ ] route
  * [ ] view
  * [ ] test
* [ ] Delete a trip (from either index or show)
  * [ ] route
  * [ ] view
  * [ ] test
* [x] All attributes (except zip code) must be present: duration, start date, start station, end date, end station, bike ID, subscription type)
  * [x] model test
* [ ] Trips are paginated in groups of 30

### Iteration 5

* [x] Trips load from CSV

### Iteration 6

On `/trips-dashboard`:

* [x] Average duration of a ride.
  * [ ] tested
* [x] Longest ride.
  * [ ] tested
* [x] Shortest ride.
  * [ ] tested
* [ ] Station with the most rides as a starting place.
  * [ ] tested
* [ ] Station with the most rides as an ending place.
  * [ ] tested
* [ ] Month by Month breakdown of number of rides with subtotals for each year.
  * [ ] tested
* [ ] Most ridden bike with total number of rides for that bike.
  * [ ] tested
* [ ] Least ridden bike with total number of rides for that bike.
  * [ ] tested
* [ ] User subscription type breakout with both count and percentage.
  * [ ] tested
* [ ] Single date with the highest number of trips with a count of those trips.
  * [ ] tested
* [ ] Single date with the lowest number of trips with a count of those trips.
  * [ ] tested

On an individual station show page the additional information should be present:

* [x] test setup

* [ ] Number of rides started at this station.
  * [ ] tested
* [ ] Number of rides ended at this station.
  * [ ] tested
* [ ] Most frequent destination station (for rides that began at this station).
  * [ ] tested
* [ ] Most frequent origination station (for rides that ended at this station).
  * [ ] tested
* [ ] Date with the highest number of trips started at this station.
  * [ ] tested
* [ ] Most frequent zip code for users starting trips at this station.
  * [ ] tested
* [ ] Bike ID most frequently starting a trip at this station.
  * [ ] tested

### Iteration 7

* [ ] See all conditions
* [ ] See one condition
* [ ] Create a new condition
* [ ] Update a condition
* [ ] Delete a station (from both index or show)
* [ ] Attributes include: duration, start date, start station, end date, end station, bike ID, subscription type
* [ ] Conditions are paginated by groups of 30

### Iteration 8

* [ ] Weathers load from CSV

### Iteration 9

On `/weather-dashboard`:

* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.

Additional information on the `trip-dashboard`:

* [ ] Weather on the day with the highest rides.
* [ ] Weather on the day with the lowest rides.
