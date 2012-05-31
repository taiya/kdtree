cmake_minimum_required (VERSION 2.8.8)
project (kdtree)
set (kdtree_VERSION_MAJOR 2)
set (kdtree_VERSION_MINOR 0)

message(${PROJECT_SOURCE_DIR})

# Tell it where to find kdtree.h/heap.h
include_directories ("${PROJECT_SOURCE_DIR}")

# Tell it where to find mex includes
include_directories ("/Applications/matlab/extern/include")

# Where the C++ demos will be deployed
SET(EXECUTABLE_OUTPUT_PATH ./build)

#--- SINGLE COMPILE 
#add_executable(kdtree_build cpp/kdtree_build.cpp)
#ADD_CUSTOM_COMMAND(TARGET kdtree_build POST_BUILD COMMAND mex -I./ -outdir ../toolbox mex/kdtree_build.cpp)


#--- Add mex sources to project tree even though they are indirectly built
#    NOTE: this does not work in QtCreator
# file(GLOB_RECURSE INCS ${PROJECT_SOURCE_DIR}/mex/*.cpp)
# source_group(mex FILES ${INCS})

#--- BATCH COMPILE
file(GLOB files "cpp/*.cpp")
foreach(file ${files})
    get_filename_component(basename ${file} NAME_WE)
    message(cpp/${basename}.cpp)
    
    #--- COMPILE THE CPP DEMO
    add_executable(${basename} cpp/${basename}.cpp KDTree.h MyHeaps.h)

    #--- COMPILE THE MEX TOOLBOX ELEMENT
    add_custom_command(TARGET ${basename} POST_BUILD COMMAND mex
                      -I${PROJECT_SOURCE_DIR} 
                      -outdir ${PROJECT_SOURCE_DIR}/toolbox 
                      ${PROJECT_SOURCE_DIR}/mex/${basename}.cpp)
endforeach()
