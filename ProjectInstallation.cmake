#
# Prepare for installation only if we aren't in developer mode
#
if(NOT myproject_ENABLE_DEVELOPER_MODE)
  include(CMakePackageConfigHelpers)

  # Strip out the INTERFACE_LINK_LIBRARIES for install (avoid dragging in myproject_options, myproject_warnings on downstream targets)
  set_target_properties(${myproject_TARGET_NAME} PROPERTIES INTERFACE_LINK_LIBRARIES "" EXPORT_ONLY TRUE)

  # Strip out the PUBLIC_HEADER install target, this is only for IDE integration during development
  set_target_properties(${myproject_TARGET_NAME} PROPERTIES PUBLIC_HEADER "")

  # Generate the CMake config and version files
  configure_package_config_file("${myproject_CMAKE_CONFIG_TEMPLATE_FILE}" "${myproject_CMAKE_CONFIG_FILE}"
                                INSTALL_DESTINATION "${myproject_INSTALL_CMAKE_CONFIG_DIR}")

  write_basic_package_version_file(
    "${myproject_CMAKE_VERSION_FILE}"
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion)

  # Install public header files
  install(DIRECTORY "${myproject_INCLUDE_DIR}/" DESTINATION ${myproject_INSTALL_INCLUDE_DIR})

  # Install the library, its headers, and export the targets
  install(
    TARGETS ${myproject_TARGET_NAME}
    EXPORT ${myproject_CMAKE_TARGETS_EXPORT_NAME}
    ARCHIVE DESTINATION ${myproject_INSTALL_LIB_DIR}
    LIBRARY DESTINATION ${myproject_INSTALL_LIB_DIR}
    RUNTIME DESTINATION ${myproject_INSTALL_RUNTIME_DIR})

  # Install the exported CMake “myprojectTargets.cmake” file
  install(
    EXPORT ${myproject_CMAKE_TARGETS_EXPORT_NAME}
    FILE ${myproject_CMAKE_TARGETS_EXPORT_NAME}.cmake
    NAMESPACE ${myproject_NAMESPACE_NAME}::
    DESTINATION ${myproject_INSTALL_CMAKE_CONFIG_DIR})

  # Install the package‐config and version files
  install(FILES "${myproject_CMAKE_CONFIG_FILE}" "${myproject_CMAKE_VERSION_FILE}"
          DESTINATION ${myproject_INSTALL_CMAKE_CONFIG_DIR})

endif()
