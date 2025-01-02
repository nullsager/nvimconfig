local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cmake", {
  s("basic", fmt([[
        cmake_minimum_required(VERSION {cmake_version})
        project({project_name} VERSION {project_version})

        # Set C++ standard
        set(CMAKE_CXX_STANDARD {cpp_standard})
        set(CMAKE_CXX_STANDARD_REQUIRED True)

        # Add executable
        add_executable({executable_name}
            {source_files}
        )

        # Include directories
        target_include_directories({executable_name} PRIVATE
            {include_dirs}
        )

        # Link libraries
        target_link_libraries({executable_name} PRIVATE
            {libraries}
        )
    ]], {
    cmake_version = i(1, "3.25"),
    project_name = i(2, "MyProject"),
    project_version = i(3, "1.0"),
    cpp_standard = i(4, "20"),
    executable_name = i(5, "a.out"),
    source_files = i(6, "main.cpp"),
    include_dirs = i(7, "include"),
    libraries = i(8, "library_name"),
  })),
})
