cmake_minimum_required( VERSION 3.13 FATAL_ERROR )

# Set compilers
set( CMAKE_C_COMPILER clang )
set( CMAKE_CXX_COMPILER clang++ )

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
