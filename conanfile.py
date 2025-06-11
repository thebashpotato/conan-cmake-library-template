from conan import ConanFile
from conan.tools.build import check_max_cppstd, check_min_cppstd
from conan.tools.cmake import CMake, CMakeDeps, CMakeToolchain, cmake_layout


class myprojectConan(ConanFile):
    name = "myproject"
    version = "0.1.0"
    settings = "os", "compiler", "build_type", "arch"
    options = {
        "myproject_ENABLE_DEVELOPER_MODE": [True, False],
    }
    default_options = {
        "myproject_ENABLE_DEVELOPER_MODE": "False"

    }
    exports_sources = "CMakeLists.txt", "ProjectOptions.cmake", "ProjectInstallation.cmake", "ProjectVariables.cmake", "cmake/*", "configure_files/*", "include/*", "src/*"
    package_type = "static-library"

    def requirements(self):
        self.requires("spdlog/1.15.3", transitive_headers=True, transitive_libs=True)
        if self.options.myproject_ENABLE_DEVELOPER_MODE:
            self.requires("gtest/1.16.0")

    def validate(self):
        check_max_cppstd(self, "20")
        check_min_cppstd(self, "17")

    def layout(self):
        cmake_layout(self)

    def generate(self):
        tc = CMakeToolchain(self)
        tc.variables["myproject_ENABLE_DEVELOPER_MODE"] = self.options.myproject_ENABLE_DEVELOPER_MODE
        tc.generate()
        deps = CMakeDeps(self)
        deps.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()

    def package_info(self):
        self.cpp_info.set_property("cmake_file_name", "myproject")
        self.cpp_info.set_property("cmake_target_name", "myproject::myproject")
        self.cpp_info.libs = ["myproject"]
