cmake_minimum_required( VERSION 3.10...3.18 )

target_sources( ${PROJECT_NAME}
    PRIVATE 
        vector.scm
        raylib.scm
        picture.scm
        primitives.scm
        combinators.scm
        fish.scm
        main.scm 
)