# Install script for directory: /home/cnollet/aruco-2.0.19/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaruco.so.2.0.19"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaruco.so.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaruco.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      FILE(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    ENDIF()
  ENDFOREACH()
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES
    "/home/cnollet/aruco-2.0.19/build/src/libaruco.so.2.0.19"
    "/home/cnollet/aruco-2.0.19/build/src/libaruco.so.2.0"
    "/home/cnollet/aruco-2.0.19/build/src/libaruco.so"
    )
  FOREACH(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaruco.so.2.0.19"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaruco.so.2.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libaruco.so"
      )
    IF(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      FILE(RPATH_REMOVE
           FILE "${file}")
      IF(CMAKE_INSTALL_DO_STRIP)
        EXECUTE_PROCESS(COMMAND "/usr/bin/strip" "${file}")
      ENDIF(CMAKE_INSTALL_DO_STRIP)
    ENDIF()
  ENDFOREACH()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/aruco" TYPE FILE FILES
    "/home/cnollet/aruco-2.0.19/src/cameraparameters.h"
    "/home/cnollet/aruco-2.0.19/src/markerlabeler.h"
    "/home/cnollet/aruco-2.0.19/src/posetracker.h"
    "/home/cnollet/aruco-2.0.19/src/ar_omp.h"
    "/home/cnollet/aruco-2.0.19/src/levmarq.h"
    "/home/cnollet/aruco-2.0.19/src/checkrectcontour.h"
    "/home/cnollet/aruco-2.0.19/src/dictionary.h"
    "/home/cnollet/aruco-2.0.19/src/aruco.h"
    "/home/cnollet/aruco-2.0.19/src/ippe.h"
    "/home/cnollet/aruco-2.0.19/src/exports.h"
    "/home/cnollet/aruco-2.0.19/src/cvdrawingutils.h"
    "/home/cnollet/aruco-2.0.19/src/marker.h"
    "/home/cnollet/aruco-2.0.19/src/markerdetector.h"
    "/home/cnollet/aruco-2.0.19/src/markermap.h"
    "/home/cnollet/aruco-2.0.19/src/markerlabelers/dictionary_based.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "main")

