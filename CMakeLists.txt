cmake_minimum_required(VERSION 3.2 FATAL_ERROR)

project(ruby-swig-lib)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_FLAGS "-fPIC -O3")

function(add_swig_library target)
  add_library(${target} SHARED ${ARGN})
  set_target_properties(${target} PROPERTIES
    PREFIX ""
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
endfunction()

set(run-swig-command bash ${PROJECT_SOURCE_DIR}/build-swig.sh)
execute_process(COMMAND ${run-swig-command})
add_custom_command(OUTPUT run-swig-result
  PRE_BUILD
  COMMAND ${run-swig-command})

# Note: If the build fails with a NOTFOUND error, try adding the directory of
# ruby.h and ruby/config.h on your system to the find_path HINTS below.
# Unfortunately, there is no way to determine this automatically.
# Try looking in ~/.rbenb/versions, ~/.rvm/rubies, /usr/local/lib/ruby, etc.
find_path(ruby-header-directory
  ruby.h
  HINTS
    $ENV{HOME}/.rbenv/versions/2.5.0/include/ruby-2.5.0
    /usr/local/rvm/rubies/ruby-2.4.1/include/ruby-2.4.0)
find_path(ruby-config-header-directory
  ruby/config.h
  HINTS
    $ENV{HOME}/.rbenv/versions/2.5.0/include/ruby-2.5.0/x86_64-linux
    $ENV{HOME}/.rbenv/versions/2.5.0/include/ruby-2.5.0/x86_64-darwin15
    /usr/local/rvm/rubies/ruby-2.4.1/include/ruby-2.4.0/x86_64-linux)
include_directories(
  ${ruby-header-directory}
  ${ruby-config-header-directory}
  ${PROJECT_SOURCE_DIR}/lib)

add_swig_library(HelloWorld
  lib/hello_world.c
  lib/hello_world_wrap.c)
