function(run_clang_format DIRECTORY)
  find_program(CLANG_FORMAT clang-format)

  if(CLANG_FORMAT)
    message(STATUS "Running clang-format on files in ${DIRECTORY}")

    # Glob all c++ source and header files
    file(GLOB_RECURSE CPP_FILES ${DIRECTORY}/*.cpp)
    file(GLOB_RECURSE CPP_HEADER_FILES ${DIRECTORY}/*.hpp)

    # Glob all C source and header files
    file(GLOB_RECURSE C_FILES ${DIRECTORY}/*.c)
    file(GLOB_RECURSE C_HEADER_FILES ${DIRECTORY}/*.h)

    # Concat all files
    set(ALL_FILES
        ${CPP_FILES}
        ${CPP_HEADER_FILES}
        ${C_FILES}
        ${C_HEADER_FILES})

    # Run clang-format on each file
    foreach(FILE ${ALL_FILES})
      execute_process(COMMAND clang-format -i ${FILE} RESULT_VARIABLE RETURN_CODE)
      if(NOT
         RETURN_CODE
         EQUAL
         0)
        message(FATAL_ERROR "Failed to run clang-format on file: ${FILE}")
      endif()
    endforeach()
  else()
    message(SEND_ERROR "clang-format requested but executable not found")
  endif()
endfunction()
