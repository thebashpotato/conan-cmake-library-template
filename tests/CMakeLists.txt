include(GoogleTest)

#
# Add all test source files
#
set(TEST_SOURCE_FILES tests.cpp)

#
# Declare a custom name for the text executable
#
set(PROJECT_UNIT_TEST "${myproject_TARGET_NAME}_tests")

#
# Add all test sources to the executable, and any other sources
#
add_executable(${PROJECT_UNIT_TEST} ${TEST_SOURCE_FILES})

#
# Link all libs to test executable
#
target_include_directories(${PROJECT_UNIT_TEST} PUBLIC ${myproject_INCLUDE_DIR})
target_link_libraries(${PROJECT_UNIT_TEST}
                      PRIVATE myproject_options::myproject_options myproject_warnings::myproject_warnings gtest::gtest ${myproject_TARGET_NAME})

#
# Instruct gtest to discover all tests
#
gtest_discover_tests(${PROJECT_UNIT_TEST})
