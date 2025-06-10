#
# Prepare for installation only if we aren't in developer mode
#
if(NOT myproject_ENABLE_DEVELOPER_MODE)
  include(CMakePackageConfigHelpers)

  # Remove interfaced linked libraries on install (myproject_options, myproject_warnings)
  # If we don't any binary which links to this library will depend on them as well, and we don't want that
  set_target_properties(${myproject_TARGET_NAME} PROPERTIES INTERFACE_LINK_LIBRARIES "")

  # Create cmake config module based on template
  configure_file(${myproject_CMAKE_CONFIG_TEMPLATE_FILE} ${myproject_CMAKE_CONFIG_FILE} @ONLY)

  # Create the config version file
  write_basic_package_version_file(
    ${myproject_CMAKE_VERSION_FILE}
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion)

  # Install public header files
  install(DIRECTORY "${myproject_INCLUDE_DIR}/" DESTINATION ${myproject_INSTALL_INCLUDE_DIR})

  # Install the library binary
  install(
    TARGETS ${myproject_TARGET_NAME}
    ARCHIVE DESTINATION ${myproject_INSTALL_LIB_DIR}
    LIBRARY DESTINATION ${myproject_INSTALL_LIB_DIR}
    RUNTIME DESTINATION ${myproject_INSTALL_RUNTIME_DIR})

  # Install CMake configuration and version modules
  install(FILES ${myproject_CMAKE_VERSION_FILE} ${myproject_CMAKE_CONFIG_FILE}
          DESTINATION ${myproject_INSTALL_CMAKE_CONFIG_DIR})

  # Export CMake Targets file
  export(
    TARGETS ${myproject_TARGET_NAME}
    NAMESPACE ${myproject_NAMESPACE_NAME}::
    FILE ${myproject_CMAKE_TARGETS_FILE})

  # Install CMake Targets file
  install(
    EXPORT ${myproject_CMAKE_TARGETS_EXPORT_NAME}
    NAMESPACE ${myproject_NAMESPACE_NAME}::
    DESTINATION ${myproject_INSTALL_CMAKE_CONFIG_DIR})

  install(
    TARGETS ${myproject_TARGET_NAME}
    EXPORT ${myproject_CMAKE_TARGETS_EXPORT_NAME}
    INCLUDES
    DESTINATION ${myproject_INSTALL_INCLUDE_DIR})

endif()
