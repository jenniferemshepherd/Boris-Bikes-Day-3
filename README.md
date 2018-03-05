Boris Bikes Challenge
==================

Brief Summary of Approach
-------
This has been my first TDD project at Makers Academy and I paired for 3 days to work on it.  It was fun to get into the habit of feature testing, then writing RSpec tests for that behaviour.  We then wrote the most basic code to pass the test, before refactoring.

Instructions
-------
* Clone this repository
* cd Boris-Bikes-Day-3
* Run the command 'bundle' in the project directory to ensure you have all the gems

Functionality n IRB:
* To create a station - station = DockingStation.new
* To create bike - bike = Bike.new
* To release a bike - station.release_bike
* To dock a bike - station.dock(bike)

User stories
--------
```
As a user,
So that I can use a bike,
I'd like to get a bike from a docking station.

As a user,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.
```

## Domain model
![Alt text](img/domain_model.jpg)

## List of authors
* Leigh-Ann Gant
* Ed Goold
* Jennifer Shepherd

Technologies Used:
--------
* RSpec
