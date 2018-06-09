# Toy robot
## The problem
See [Toy robot coding test](https://joneaves.wordpress.com/2014/07/21/toy-robot-coding-test/)

## How to run
### Install gem dependencies
`bundle install`

### Run unit & integration tests
`bundle exec rspec`

I think it's a good idea to use the scenarios given in the code test description as test data. Therefore, I created 3 
test files `seek_first_scenario`, `seek_second_scenario`, and `seek_third_scenario`.

### Run robot application
`./bin/run_robot_toy spec/fixture/seek_first_scenario`

`./bin/run_robot_toy spec/fixture/seek_second_scenario`

`./bin/run_robot_toy spec/fixture/seek_third_scenario`

or with some invalid commands

`./bin/run_robot_toy spec/fixture/some_invalid_commands`

or you can run with your own test file

`./bin/run_robot_toy path/to/your/file`

## Solution explanation & assumption
### Object modelling & Classes
From the problem description, I can extract out a few key classes such as Table, Robot, and a set of Commands to start with.

To handle the creation of appropriate Command objects I've decided to use a factory class (CommandFactory). It will be 
easier to extend the solution to have new type of commands without changing the processing flow.

There is a class responsible for reading input. At the moment I only provide a File input reader for the completion of 
the coding test but the solution should be able to work with other input reader implementation providing the same interface.

There is a class responsible for parsing an input line to a data object consists of command type and arguments 
to feed the CommandFactory.

It can be arguable that the Robot class should have more responsibility to cover the logic in Command classes since 
we can consider those behaviours belongs to the Robot. However, I think it can lead to a big Robot class.

### Validation
The solution handles the following cases by ignoring:

* Invalid command
* Invalid arguments data type
* Missing arguments
* Unexpected arguments

### Exception handling
The solution handles the following cases:

* Exception raised when converting data to integer by return -1 to make the command invalid so that it does nothing
* The script runner will fail to run if a test file is not provided.

### Assumption
* The execution script is default to run on a 5x5 table as requested but can be extended to run with any table size.
* The REPORT command will print out the current state of the robot to the standard output. 
