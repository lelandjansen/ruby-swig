# Ruby Swig
Build system for Ruby + SWIG C libraries using CMake

## Requirements
- Ruby
- C compiler (C99-compatible)
- CMake >= 3.2
- Swig

## Setup
Execute these commands in the root project directory.
```
# Install gems
$ gem install bundler
$ bundle install

# Install SWIG
$ sudo apt update
$ sudo apt install swig

# Compile components
$ mkdir buid && cd build
$ cmake ..
$ cmake --build . --

# Run project
$ bundle exec bin/ruby_swig.rb
Hello World!
```
