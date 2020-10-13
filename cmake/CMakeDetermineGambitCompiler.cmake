# Find the compiler
find_program(
    CMAKE_Gambit_COMPILER 
        NAMES "gambitc"
        HINTS "${CMAKE_SOURCE_DIR}"
        DOC "Gambit Scheme compiler" 
)

mark_as_advanced( CMAKE_Gambit_COMPILER )

set( CMAKE_Gambit_SOURCE_FILE_EXTENSIONS scm;six )
set( CMAKE_Gambit_OUTPUT_EXTENSION .c )
set( CMAKE_Gambit_COMPILER_ENV_VAR "FOO" )

# Configure variables set in this file for fast reload later on
configure_file( ${CMAKE_CURRENT_LIST_DIR}/CMakeGambitCompiler.cmake.in
                ${CMAKE_PLATFORM_INFO_DIR}/CMakeGambitCompiler.cmake )