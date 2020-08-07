# Toy Robot Simulator

## Table of contents:

* [Description](./README.md#description)
  * [Constraints](./README.md#constraints)
  * [Example Input and Output](./README.md#example-input-and-output)
  * [Deliverables](./README.md#deliverables)
* [Setup](./README.md#setup)

## Description

The provided backend is a simple web application that is defined the following rules:

* The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5x5.

* There are no other obstructions on the table surface.

* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

Create an application that can read in commands of the following form:

### Behavior

The available commands are the following:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
```

* `PLACE` will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.

* The origin (0,0) can be considered to be the NORTH WEST most corner.

* The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command. The application should discard all commands in the sequence until a valid `PLACE` command has been executed

* `MOVE` will move the toy robot one unit forward in the direction it is currently facing.

* `LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

* `REPORT` will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

* A robot that is not on the table can choose to ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.


### Constraints

* The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.

* Any move that would cause the robot to fall must be ignored.


### Challenge

You are expected to transform the frontend of the application freely in any way you think would contribute to the construction of a better, more intuitive UI.

### Deliverables

Please provide your source code, and any test code/data you used to
build your solution.

Please engineer your solution to a standard you consider suitable for
production.

## Setup

To run the project you should have ruby or docker and docker-compose installed.

After that run the following commands on the directory of the project:


```
# If you installed docker:
docker-compose up
```
OR
```
# If you installed ruby:
bundle install
rails server
```

Have fun!!!
