cmake_minimum_required(VERSION 3.21)
project(myproject_pkg_test CXX)

set(CMAKE_CXX_STANDARD 20)

add_executable(${PROJECT_NAME} src/pkg_test.cpp)
find_package(myproject REQUIRED)

target_link_libraries(${PROJECT_NAME} PRIVATE myproject::myproject)
