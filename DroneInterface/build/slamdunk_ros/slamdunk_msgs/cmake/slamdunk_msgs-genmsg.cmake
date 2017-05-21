# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "slamdunk_msgs: 8 messages, 1 services")

set(MSG_I_FLAGS "-Islamdunk_msgs:/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(slamdunk_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg" ""
)

get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv" ""
)

get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg" ""
)

get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg" ""
)

get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg" ""
)

get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg" "slamdunk_msgs/Quality:std_msgs/Header"
)

get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg" ""
)

get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg" NAME_WE)
add_custom_target(_slamdunk_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "slamdunk_msgs" "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)

### Generating Services
_generate_srv_cpp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
)

### Generating Module File
_generate_module_cpp(slamdunk_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(slamdunk_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(slamdunk_msgs_generate_messages slamdunk_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_cpp _slamdunk_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slamdunk_msgs_gencpp)
add_dependencies(slamdunk_msgs_gencpp slamdunk_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slamdunk_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)

### Generating Services
_generate_srv_lisp(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
)

### Generating Module File
_generate_module_lisp(slamdunk_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(slamdunk_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(slamdunk_msgs_generate_messages slamdunk_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_lisp _slamdunk_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slamdunk_msgs_genlisp)
add_dependencies(slamdunk_msgs_genlisp slamdunk_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slamdunk_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)
_generate_msg_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)

### Generating Services
_generate_srv_py(slamdunk_msgs
  "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
)

### Generating Module File
_generate_module_py(slamdunk_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(slamdunk_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(slamdunk_msgs_generate_messages slamdunk_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/Quality.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/srv/Save.srv" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/BoolStamped.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/StreamingTypes.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ReconfigureLevels.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/ServiceTrigger.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/QualityStamped.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoModes.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/me132/DroneVisionProject/DroneInterface/src/slamdunk_ros/slamdunk_msgs/msg/VideoSources.msg" NAME_WE)
add_dependencies(slamdunk_msgs_generate_messages_py _slamdunk_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(slamdunk_msgs_genpy)
add_dependencies(slamdunk_msgs_genpy slamdunk_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS slamdunk_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/slamdunk_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(slamdunk_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/slamdunk_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(slamdunk_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/slamdunk_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(slamdunk_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
