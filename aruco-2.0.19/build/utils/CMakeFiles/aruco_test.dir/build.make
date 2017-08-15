# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cnollet/aruco-2.0.19

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cnollet/aruco-2.0.19/build

# Include any dependencies generated for this target.
include utils/CMakeFiles/aruco_test.dir/depend.make

# Include the progress variables for this target.
include utils/CMakeFiles/aruco_test.dir/progress.make

# Include the compile flags for this target's objects.
include utils/CMakeFiles/aruco_test.dir/flags.make

utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o: utils/CMakeFiles/aruco_test.dir/flags.make
utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o: ../utils/aruco_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/cnollet/aruco-2.0.19/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o"
	cd /home/cnollet/aruco-2.0.19/build/utils && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/aruco_test.dir/aruco_test.cpp.o -c /home/cnollet/aruco-2.0.19/utils/aruco_test.cpp

utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/aruco_test.dir/aruco_test.cpp.i"
	cd /home/cnollet/aruco-2.0.19/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/cnollet/aruco-2.0.19/utils/aruco_test.cpp > CMakeFiles/aruco_test.dir/aruco_test.cpp.i

utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/aruco_test.dir/aruco_test.cpp.s"
	cd /home/cnollet/aruco-2.0.19/build/utils && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/cnollet/aruco-2.0.19/utils/aruco_test.cpp -o CMakeFiles/aruco_test.dir/aruco_test.cpp.s

utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o.requires:
.PHONY : utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o.requires

utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o.provides: utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o.requires
	$(MAKE) -f utils/CMakeFiles/aruco_test.dir/build.make utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o.provides.build
.PHONY : utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o.provides

utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o.provides.build: utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o

# Object files for target aruco_test
aruco_test_OBJECTS = \
"CMakeFiles/aruco_test.dir/aruco_test.cpp.o"

# External object files for target aruco_test
aruco_test_EXTERNAL_OBJECTS =

utils/aruco_test: utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o
utils/aruco_test: utils/CMakeFiles/aruco_test.dir/build.make
utils/aruco_test: src/libaruco.so.2.0.19
utils/aruco_test: /usr/local/lib/libopencv_calib3d.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_core.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_features2d.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_flann.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_highgui.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_imgcodecs.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_imgproc.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_ml.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_objdetect.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_photo.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_shape.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_stitching.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_superres.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_video.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_videoio.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_videostab.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_viz.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_objdetect.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_calib3d.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_features2d.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_flann.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_highgui.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_ml.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_photo.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_video.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_videoio.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_imgcodecs.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_imgproc.so.3.2.0
utils/aruco_test: /usr/local/lib/libopencv_core.so.3.2.0
utils/aruco_test: utils/CMakeFiles/aruco_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable aruco_test"
	cd /home/cnollet/aruco-2.0.19/build/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aruco_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
utils/CMakeFiles/aruco_test.dir/build: utils/aruco_test
.PHONY : utils/CMakeFiles/aruco_test.dir/build

utils/CMakeFiles/aruco_test.dir/requires: utils/CMakeFiles/aruco_test.dir/aruco_test.cpp.o.requires
.PHONY : utils/CMakeFiles/aruco_test.dir/requires

utils/CMakeFiles/aruco_test.dir/clean:
	cd /home/cnollet/aruco-2.0.19/build/utils && $(CMAKE_COMMAND) -P CMakeFiles/aruco_test.dir/cmake_clean.cmake
.PHONY : utils/CMakeFiles/aruco_test.dir/clean

utils/CMakeFiles/aruco_test.dir/depend:
	cd /home/cnollet/aruco-2.0.19/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cnollet/aruco-2.0.19 /home/cnollet/aruco-2.0.19/utils /home/cnollet/aruco-2.0.19/build /home/cnollet/aruco-2.0.19/build/utils /home/cnollet/aruco-2.0.19/build/utils/CMakeFiles/aruco_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : utils/CMakeFiles/aruco_test.dir/depend

