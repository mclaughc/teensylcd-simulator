set(HEADER_FILES 
)

set(SOURCE_FILES
    teensylcd-web.c
)

set(EXTRA_LINKFLAGS "")
set(EXTRA_LINKFLAGS "${EXTRA_LINKFLAGS} -s RESERVED_FUNCTION_POINTERS=20")
set(EXTRA_LINKFLAGS "${EXTRA_LINKFLAGS} -s EXPORTED_FUNCTIONS=\"['_load_firmware', '_reset_processor', '_pause_processor', '_resume_processor', '_set_processor_frequency', '_set_button_state', '_set_led_change_callback', '_set_frequency_change_callback', '_set_tracer_messages', '_main']\"")

set(PYTHON_BIN "python")
set(PACKAGER "${EMSCRIPTEN_ROOT_PATH}/tools/file_packager.py")
set(PRELOAD_FILES --preload ${CMAKE_CURRENT_SOURCE_DIR}/start.hex@/)

add_executable(teensylcd-web ${HEADER_FILES} ${SOURCE_FILES})
target_include_directories(teensylcd-web PRIVATE .)
target_link_libraries(teensylcd-web libteensylcd)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${EXTRA_LINKFLAGS}")

add_custom_command(TARGET teensylcd-web POST_BUILD COMMAND "${PYTHON_BIN}" ARGS ${PACKAGER} teensylcd-web-preload.data --js-output=teensylcd-web-preload.js ${PRELOAD_FILES} VERBATIM)

install(TARGETS teensylcd-web DESTINATION dist)
install(FILES html/teensylcd-web.html DESTINATION dist)
install(DIRECTORY html/css DESTINATION dist)
install(DIRECTORY html/fonts DESTINATION dist)
install(DIRECTORY html/js DESTINATION dist)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/teensylcd-web.js.mem" DESTINATION dist)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/teensylcd-web-preload.js" DESTINATION dist)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/teensylcd-web-preload.data" DESTINATION dist)


