cmake_minimum_required( VERSION 3.10...3.18 )

if( ${CMAKE_VERSION} VERSION_LESS 3.12 )
    cmake_policy( VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} )
endif()

# TODO: Add functionality to automatically detect compilers for cross-platform
#       support.
# Set compilers
set( CMAKE_C_COMPILER gcc )
set( CMAKE_CXX_COMPILER g++ )

# Building the Scheme examples is off by default
option( BUILD_SCM_EXAMPLES "Build the Scheme code examples with Gambit Scheme." OFF )

# Give the project a name
project( raylib-gambit-scheme
    VERSION 0.1.0
    DESCRIPTION "A simple Gambit Scheme binding for raylib" )

# Add external dependencies to project
add_subdirectory( extern ) 

# Build simple Gambit Scheme program
list( APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" )
enable_language( Gambit )
add_executable( ${PROJECT_NAME} "" )
add_dependencies( ${PROJECT_NAME} raylib )
add_subdirectory( src )

# Copy game assets
add_custom_target(
    copy-assets ALL
    COMMENT "Copying assets"
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${CMAKE_CURRENT_SOURCE_DIR}/assets ${CMAKE_BINARY_DIR}/assets )

if( ${BUILD_SCM_EXAMPLES} )
   add_subdirectory( examples ) 
endif()
