cmake_minimum_required( VERSION 3.10...3.18 )

# HACK: Test files in isolation
# add_subdirectory( structs )

target_sources( ${PROJECT_NAME}
    PRIVATE 
        raylib.scm 
        raylib-colors.scm 
        raylib-consts.scm
)
