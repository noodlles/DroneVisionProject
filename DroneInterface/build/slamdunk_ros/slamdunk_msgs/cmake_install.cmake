# Install script for directory: /home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/me132/DroneVisionProject/DroneInterface/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slamdunk_msgs/msg" TYPE FILE FILES
    "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg"
    "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg"
    "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg"
    "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg"
    "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg"
    "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg"
    "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg"
    "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slamdunk_msgs/srv" TYPE FILE FILES "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slamdunk_msgs/cmake" TYPE FILE FILES "/home/me132/DroneVisionProject/DroneInterface/build/slamdunk_ros/slamdunk_msgs/catkin_generated/installspace/slamdunk_msgs-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/me132/DroneVisionProject/DroneInterface/devel/include/slamdunk_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/me132/DroneVisionProject/DroneInterface/devel/share/common-lisp/ros/slamdunk_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/me132/DroneVisionProject/DroneInterface/devel/lib/python2.7/dist-packages/slamdunk_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/me132/DroneVisionProject/DroneInterface/devel/lib/python2.7/dist-packages/slamdunk_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/me132/DroneVisionProject/DroneInterface/build/slamdunk_ros/slamdunk_msgs/catkin_generated/installspace/slamdunk_msgs.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slamdunk_msgs/cmake" TYPE FILE FILES "/home/me132/DroneVisionProject/DroneInterface/build/slamdunk_ros/slamdunk_msgs/catkin_generated/installspace/slamdunk_msgs-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slamdunk_msgs/cmake" TYPE FILE FILES
    "/home/me132/DroneVisionProject/DroneInterface/build/slamdunk_ros/slamdunk_msgs/catkin_generated/installspace/slamdunk_msgsConfig.cmake"
    "/home/me132/DroneVisionProject/DroneInterface/build/slamdunk_ros/slamdunk_msgs/catkin_generated/installspace/slamdunk_msgsConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/slamdunk_msgs" TYPE FILE FILES "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

