# Toy robot coding test

## The problem

[Toy robot coding test](https://joneaves.wordpress.com/2014/07/21/toy-robot-coding-test/)

## How to run

### Install dependencies
`bundle install`

### Run unit tests
`bundle exec rspec`

### Run robot application

## Solution explanation and assumption

### Classes

From the problem description, we can extract out a few key classes such as Table, Robot, and a set of Command classes.

To handle the creation of appropriate Command object I've decided to use a factory class. With this way, it will be 
easier to extend the solution to have new type of commands without changing the processing flow.

There is a class responsible for reading input. At the moment I only provide a File input reader for the purpose of 
testing the application but the solution be able to work with other input reader implementation providing the same 
public interface.

There is another class responsible for parsing each input line into a data object consists of command type and arguments. 

### Validation


### Exception


