# Catkin User Guide: http://www.ros.org/doc/groovy/api/catkin/html/user_guide/user_guide.html
# Catkin CMake Standard: http://www.ros.org/doc/groovy/api/catkin/html/user_guide/standards.html
cmake_minimum_required(VERSION 2.8.3)
project(optitrack_driver)
# Load catkin and all dependencies required for this package
# TODO: remove all from COMPONENTS that are not catkin packages.
find_package(catkin REQUIRED COMPONENTS roscpp tf geometry_msgs message_generation)

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

add_message_files(FILES
    OptiTrackData.msg
)

generate_messages(DEPENDENCIES geometry_msgs std_msgs)

find_package(Bullet)

catkin_package(
    DEPENDS bullet
    CATKIN_DEPENDS roscpp tf geometry_msgs message_runtime
    INCLUDE_DIRS ${BULLET_INCLUDE_DIR}
)

#common commands for building c++ executables and lib
include_directories(${catkin_INCLUDE_DIRS} ${BULLET_INCLUDE_DIR})
add_executable(optitrack src/Optitrack.cpp)
target_link_libraries(optitrack vrpn ${BULLET_LIBRARIES} ${catkin_LIBRARIES})
add_dependencies(optitrack optitrack_driver_generate_messages_cpp)
