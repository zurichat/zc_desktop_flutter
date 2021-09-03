cmake_minimum_required(VERSION 3.0.0)
project(zc_desktop_chat VERSION 0.1.0)

include(CTest)
enable_testing()

add_library(zc_desktop_chat zc_desktop_chat.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
