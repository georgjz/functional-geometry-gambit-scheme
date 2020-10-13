# This file sets the basic flags for the GAMBIT compiler
# if( not CMAKE_GAMBIT_SHARED_LIBRARY )
# endif()

# if( not CMAKE_GAMBIT_COMPILE_OBJECT )
#     set( CMAKE_GAMBIT_COMPILE_OBJECT 
#             "<CMAKE_GAMBIT_COMPILER> -link <SOURCES>"  # link Scheme and C files 
#             "<CMAKE_GAMBIT_COMPILER> ")
# endif()

# How to build objects 
set( CMAKE_Gambit_COMPILE_OBJECT
    "<CMAKE_Gambit_COMPILER> -verbose \
                             -keep-temp \
                             -o <OBJECT> \
                             -c <SOURCE>"
)

# How to build executables 
set( CMAKE_Gambit_LINK_EXECUTABLE 
    # "<CMAKE_Gambit_COMPILER> -o <TARGET>_link.c <OBJECTS>"
    "<CMAKE_Gambit_COMPILER> -verbose \
                             -keep-temp \
                             -cc-options \"-g -O0 -Wl,-rpath,${CMAKE_BINARY_DIR}/extern/raylib/src -lraylib \
                                           -Wl,-L${CMAKE_BINARY_DIR}/extern/raylib/src -lraylib \
                                           -I${CMAKE_BINARY_DIR}/extern/raylib/src\" \
                             -o <TARGET> \
                             -exe <OBJECTS>"
)


set( CMAKE_Gambit_INFORMATION_LOADED 1 )


# CMAKE_(LANG)_CREATE_SHARED_LIBRARY
# CMAKE_(LANG)_CREATE_SHARED_MODULE
# CMAKE_(LANG)_CREATE_STATIC_LIBRARY
# CMAKE_(LANG)_COMPILE_OBJECT
# CMAKE_(LANG)_LINK_EXECUTABLE