function(myproject_setup_dependencies IS_DEVELOPER_MODE)
  if(IS_DEVELOPER_MODE)
    find_package(GTest REQUIRED)
  endif()

  find_package(spdlog REQUIRED)
endfunction()
