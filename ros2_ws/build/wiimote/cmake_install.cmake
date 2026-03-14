# Install script for directory: /opt/cat_robot/src/ros2_ws/src/joystick_drivers/wiimote

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/opt/cat_robot/src/ros2_ws/install/wiimote")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/opt/cat_robot/src/ros2_ws/build/wiimote/ament_cmake_symlink_install/ament_cmake_symlink_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwiimote_lib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwiimote_lib.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwiimote_lib.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/cat_robot/src/ros2_ws/build/wiimote/libwiimote_lib.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwiimote_lib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwiimote_lib.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwiimote_lib.so"
         OLD_RPATH "/home/user/ros2_humble/install/rclcpp_lifecycle/lib:/home/user/ros2_humble/install/sensor_msgs/lib:/home/user/ros2_humble/install/std_srvs/lib:/opt/cat_robot/src/ros2_ws/install/wiimote_msgs/lib:/home/user/ros2_humble/install/rcl_lifecycle/lib:/home/user/ros2_humble/install/lifecycle_msgs/lib:/home/user/ros2_humble/install/geometry_msgs/lib:/home/user/ros2_humble/install/std_msgs/lib:/home/user/ros2_humble/install/rclcpp/lib:/home/user/ros2_humble/install/libstatistics_collector/lib:/home/user/ros2_humble/install/rcl/lib:/home/user/ros2_humble/install/rmw_implementation/lib:/home/user/ros2_humble/install/ament_index_cpp/lib:/home/user/ros2_humble/install/rcl_logging_spdlog/lib:/home/user/ros2_humble/install/rcl_logging_interface/lib:/home/user/ros2_humble/install/rcl_interfaces/lib:/home/user/ros2_humble/install/rcl_yaml_param_parser/lib:/home/user/ros2_humble/install/libyaml_vendor/lib:/home/user/ros2_humble/install/rosgraph_msgs/lib:/home/user/ros2_humble/install/statistics_msgs/lib:/home/user/ros2_humble/install/builtin_interfaces/lib:/home/user/ros2_humble/install/rosidl_typesupport_fastrtps_c/lib:/home/user/ros2_humble/install/rosidl_typesupport_fastrtps_cpp/lib:/home/user/ros2_humble/install/fastcdr/lib:/home/user/ros2_humble/install/rmw/lib:/home/user/ros2_humble/install/rosidl_typesupport_introspection_cpp/lib:/home/user/ros2_humble/install/rosidl_typesupport_introspection_c/lib:/home/user/ros2_humble/install/rosidl_typesupport_cpp/lib:/home/user/ros2_humble/install/rosidl_typesupport_c/lib:/home/user/ros2_humble/install/rosidl_runtime_c/lib:/home/user/ros2_humble/install/tracetools/lib:/home/user/ros2_humble/install/class_loader/lib:/home/user/ros2_humble/install/rcpputils/lib:/home/user/ros2_humble/install/rcutils/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwiimote_lib.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libteleop_wiimote.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libteleop_wiimote.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libteleop_wiimote.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/opt/cat_robot/src/ros2_ws/build/wiimote/libteleop_wiimote.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libteleop_wiimote.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libteleop_wiimote.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libteleop_wiimote.so"
         OLD_RPATH "/home/user/ros2_humble/install/rclcpp_lifecycle/lib:/home/user/ros2_humble/install/sensor_msgs/lib:/opt/cat_robot/src/ros2_ws/install/wiimote_msgs/lib:/home/user/ros2_humble/install/rcl_lifecycle/lib:/home/user/ros2_humble/install/lifecycle_msgs/lib:/home/user/ros2_humble/install/geometry_msgs/lib:/home/user/ros2_humble/install/std_msgs/lib:/home/user/ros2_humble/install/rclcpp/lib:/home/user/ros2_humble/install/libstatistics_collector/lib:/home/user/ros2_humble/install/rcl/lib:/home/user/ros2_humble/install/rmw_implementation/lib:/home/user/ros2_humble/install/ament_index_cpp/lib:/home/user/ros2_humble/install/rcl_logging_spdlog/lib:/home/user/ros2_humble/install/rcl_logging_interface/lib:/home/user/ros2_humble/install/rcl_interfaces/lib:/home/user/ros2_humble/install/rcl_yaml_param_parser/lib:/home/user/ros2_humble/install/libyaml_vendor/lib:/home/user/ros2_humble/install/rosgraph_msgs/lib:/home/user/ros2_humble/install/statistics_msgs/lib:/home/user/ros2_humble/install/builtin_interfaces/lib:/home/user/ros2_humble/install/rosidl_typesupport_fastrtps_c/lib:/home/user/ros2_humble/install/rosidl_typesupport_fastrtps_cpp/lib:/home/user/ros2_humble/install/fastcdr/lib:/home/user/ros2_humble/install/rmw/lib:/home/user/ros2_humble/install/rosidl_typesupport_introspection_cpp/lib:/home/user/ros2_humble/install/rosidl_typesupport_introspection_c/lib:/home/user/ros2_humble/install/rosidl_typesupport_cpp/lib:/home/user/ros2_humble/install/rosidl_typesupport_c/lib:/home/user/ros2_humble/install/rosidl_runtime_c/lib:/home/user/ros2_humble/install/tracetools/lib:/home/user/ros2_humble/install/class_loader/lib:/home/user/ros2_humble/install/rcpputils/lib:/home/user/ros2_humble/install/rcutils/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libteleop_wiimote.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/wiimote/cmake/export_wiimoteExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/wiimote/cmake/export_wiimoteExport.cmake"
         "/opt/cat_robot/src/ros2_ws/build/wiimote/CMakeFiles/Export/8e85652a2aecf42f9d20462debb7111d/export_wiimoteExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/wiimote/cmake/export_wiimoteExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/wiimote/cmake/export_wiimoteExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wiimote/cmake" TYPE FILE FILES "/opt/cat_robot/src/ros2_ws/build/wiimote/CMakeFiles/Export/8e85652a2aecf42f9d20462debb7111d/export_wiimoteExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wiimote/cmake" TYPE FILE FILES "/opt/cat_robot/src/ros2_ws/build/wiimote/CMakeFiles/Export/8e85652a2aecf42f9d20462debb7111d/export_wiimoteExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/opt/cat_robot/src/ros2_ws/build/wiimote/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
