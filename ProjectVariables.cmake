include(GNUInstallDirs)

# Custom variables for builtins
set(myproject_TARGET_NAME ${PROJECT_NAME})
set(myproject_NAMESPACE_NAME ${PROJECT_NAME})
set(myproject_TARGET_ALIAS ${myproject_NAMESPACE_NAME}::${myproject_TARGET_NAME})

# Variables for all source code locations
set(myproject_CMAKE_CONFIG_DIR ${CMAKE_CURRENT_BINARY_DIR})
set(myproject_CONFIGURE_FILE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/configure_files)
set(myproject_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(myproject_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(myproject_TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/test)

# Installation directories for header files, cmake configuration modules and libraries
set(myproject_INSTALL_CMAKE_CONFIG_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/${myproject_TARGET_NAME})
set(myproject_INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_INCLUDEDIR})
set(myproject_INSTALL_LIB_DIR ${CMAKE_INSTALL_LIBDIR})
set(myproject_INSTALL_RUNTIME_DIR ${CMAKE_INSTALL_BINDIR})

# Generated install files
set(myproject_CMAKE_TARGETS_EXPORT_NAME ${myproject_TARGET_NAME}Targets)

# Template files and auto-generated files which will be installed to lib/cmake/myproject
set(myproject_CMAKE_CONFIG_TEMPLATE_FILE ${myproject_CONFIGURE_FILE_DIR}/Config.cmake.in)
set(myproject_CMAKE_CONFIG_FILE ${myproject_CMAKE_CONFIG_DIR}/${myproject_TARGET_NAME}Config.cmake)
set(myproject_CMAKE_VERSION_FILE ${myproject_CMAKE_CONFIG_DIR}/${myproject_TARGET_NAME}ConfigVersion.cmake)
set(myproject_CMAKE_TARGETS_FILE ${myproject_CMAKE_CONFIG_DIR}/${myproject_TARGET_NAME}Targets.cmake)
