cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(proj VERSION 1.0)

add_executable(proj src/main.cpp src/textfile.cpp src/glad.c)
include_directories(proj include)

find_package(glfw3 3.3 REQUIRED)
target_link_libraries(proj glfw)
# target_link_libraries(proj dl)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")
if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES 
      ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()
