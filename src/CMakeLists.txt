cmake_minimum_required( VERSION 3.10...3.18 )

### Include all modules you need 
add_subdirectory( raylibbinding )

target_sources( ${PROJECT_NAME}
    PRIVATE 
        main.scm 
)