
# Need @rpath support introduced in 2.8.12
CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
PROJECT(SwiftCMake)
enable_language(Swift)

set(CMAKE_XCODE_ATTRIBUTE_SWIFT_OBJC_BRIDGING_HEADER "${PROJECT_SOURCE_DIR}/source/MySwiftBridgingHeader.h")	
set(CMAKE_XCODE_ATTRIBUTE_SWIFT_OBJC_INTERFACE_HEADER_NAME "MySwiftInterfaceHeader.h")


IF(APPLE)
        set(CMAKE_MACOSX_RPATH 1)
        # use, i.e. don't skip the full RPATH for the build tree
        #       SET(CMAKE_SKIP_BUILD_RPATH  FALSE)

        # when building, don't use the install RPATH already
        # (but later on when installing)
        SET(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE) 

        #SET(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")

        # add the automatically determined parts of the RPATH
        # which point to directories outside the build tree to the install RPATH
        SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH FALSE)    
ENDIF()



# Add your C/C++/Obj-C files here
set(MY_COMPILED_FILES
	${PROJECT_SOURCE_DIR}/source/main.c	
	${PROJECT_SOURCE_DIR}/source/ObjCTrampoline.h
	${PROJECT_SOURCE_DIR}/source/ObjCTrampoline.m	
	${PROJECT_SOURCE_DIR}/source/MyCFunctions.c
	${PROJECT_SOURCE_DIR}/source/MyCFunctions.h
	${PROJECT_SOURCE_DIR}/source/SwiftMain.swift
	${PROJECT_SOURCE_DIR}/source/SwiftTrampoline.swift
	${PROJECT_SOURCE_DIR}/source/MySwiftBridgingHeader.h
		
)

ADD_EXECUTABLE(SwiftCMake
	${MY_COMPILED_FILES}
)


SET_TARGET_PROPERTIES(SwiftCMake PROPERTIES INSTALL_RPATH "@loader_path/../Frameworks;@loader_path/../lib")

