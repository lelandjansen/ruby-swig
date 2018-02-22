# Ruby Swig
Build system for Ruby + SWIG C libraries using CMake.

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
$ mkdir build && cd build
$ cmake ..
$ cmake --build . --

# Run from project root directory
$ bundle exec bin/ruby_swig.rb
Hello World!
```

# Tips
If the build fails with a NOTFOUND error, try adding the directory of `ruby.h`
and `ruby/config.h` on your system to the `find_path` HINTS in `CMakeLists.txt`.

Unfortunately, there is no way to determine this automatically.

Try looking in `~/.rbenb/versions`, `~/.rvm/rubies`, `/usr/local/lib/ruby`, etc.
