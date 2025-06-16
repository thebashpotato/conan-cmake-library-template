cmake_minimum_required(VERSION 3.21)

#
# Only set the cxx_standard if it is not set by someone else
#
if(NOT DEFINED CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 20)
endif()

#
# Only set the c_standard if it is not set by someone else
#
if(NOT DEFINED CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 11)
endif()

# strongly encouraged to enable this globally to avoid conflicts between
# -Wpedantic being enabled and -std=c++20 and -std=gnu++20 for example when
# compiling with PCH enabled
set(CMAKE_CXX_EXTENSIONS OFF)

project(
  myproject
  VERSION 0.1.0
  DESCRIPTION "Templated cmake project using Conan for cross-platform C/C++ development"
  LANGUAGES CXX C)

#
# Custom cmake modules
#
include(cmake/PreventInSourceBuilds.cmake)
include(cmake/ClangFormat.cmake)
include(cmake/Dependencies.cmake)
include(ProjectVariables.cmake)
include(ProjectOptions.cmake)

#
# Configure all project options
#
myproject_setup_options()
myproject_global_options()
myproject_local_options()

#
# Setup Dependencies
#
myproject_setup_dependencies(${myproject_ENABLE_DEVELOPER_MODE})

#
# Setup interfaced option/warning targets
#
target_compile_features(myproject_options INTERFACE cxx_std_${CMAKE_CXX_STANDARD})
target_compile_features(myproject_options INTERFACE c_std_${CMAKE_C_STANDARD})
add_library(myproject_options::myproject_options ALIAS myproject_options)
add_library(myproject_warnings::myproject_warnings ALIAS myproject_warnings)

#
# Configuration files
#
configure_file(${myproject_CONFIGURE_FILE_DIR}/config.hpp.in
               ${myproject_INCLUDE_DIR}/${myproject_TARGET_NAME}/config.hpp)

#
# Set any private sources that will not be installed, this goes for implementation and header files
#
set(myproject_PRIVATE_SOURCES ${myproject_SOURCE_DIR}/log.cpp)

#
# Set public header files that will be installed and made available to the IDE during development
#
set(myproject_PUBLIC_HEADERS ${myproject_INCLUDE_DIR}/log.hpp ${myproject_INCLUDE_DIR}/config.hpp)

#
# Create and Alias the library
#
add_library(${myproject_TARGET_NAME})
add_library(${myproject_TARGET_ALIAS} ALIAS ${myproject_TARGET_NAME})

#
# Add private sources
#
target_sources(${myproject_TARGET_NAME} PRIVATE ${myproject_PRIVATE_SOURCES})

#
# Declare public header files (will also be made available to IDE) and version the library
#
set_target_properties(
  ${myproject_TARGET_NAME}
  PROPERTIES PUBLIC_HEADER "${myproject_PUBLIC_HEADERS}"
             VERSION ${PROJECT_VERSION}
             SOVERSION ${PROJECT_VERSION_MAJOR})

#
# Link required dependencies
#
target_link_libraries(${myproject_TARGET_NAME} PRIVATE myproject_options::myproject_options
                                                       myproject_warnings::myproject_warnings spdlog::spdlog)

#
# Add public include dir to build interface, set install include interface
#
target_include_directories(${myproject_TARGET_NAME} PUBLIC $<BUILD_INTERFACE:${myproject_INCLUDE_DIR}>
                                                           $<INSTALL_INTERFACE:${myproject_INSTALL_INCLUDE_DIR}>)

#
# Setup tests
#
if(myproject_ENABLE_DEVELOPER_MODE)
  enable_testing()
  add_subdirectory(tests)
endif()

#
# Format sources files via directory
#
if(myproject_ENABLE_DEVELOPER_MODE)
  run_clang_format(${myproject_SOURCE_DIR})
  run_clang_format(${myproject_INCLUDE_DIR})
  run_clang_format(${myproject_TEST_DIR})
endif()

include(ProjectInstallation.cmake)
