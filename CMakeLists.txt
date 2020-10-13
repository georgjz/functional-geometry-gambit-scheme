cmake_minimum_required( VERSION 3.10...3.18 )

if( ${CMAKE_VERSION} VERSION_LESS 3.12 )
    cmake_policy( VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} )
endif()

# TODO: Add functionality to automatically detect compilers for cross-platform
#       support.
# Set compilers
set( CMAKE_C_COMPILER gcc )
set( CMAKE_CXX_COMPILER g++ )

# Give the project a name
project( functional-geometry-fish
    VERSION 0.1.0
    DESCRIPTION "A simple implementation of Functional Geometry, inspired by the paper of the same name by Peter Henderson" )

# Add external dependencies to project
add_subdirectory( extern ) 

# Build simple Gambit Scheme program
list( APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake" )
enable_language( Gambit )
add_executable( ${PROJECT_NAME} "" )
add_dependencies( ${PROJECT_NAME} raylib )
add_subdirectory( src )
