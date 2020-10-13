cmake_minimum_required( VERSION 3.10...3.18 )

if( ${CMAKE_VERSION} VERSION_LESS 3.12 )
    cmake_policy( VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} )
endif()

# Set OpenGL option
set( OpenGL_GL_PREFERENCE GLVND )

# Build desktop version of raylib
set( PLATFORM Desktop )

# Build debug version
set( BUILD_MODE Debug )

# Build raylib as shared library, skip examples
option( SHARED "Build raylib as shared library" ON )
option( STATIC "Build raylib as static library" OFF )
option( BUILD_EXAMPLE "Build raylib examples" OFF )

# Add raylib
add_subdirectory( raylib )