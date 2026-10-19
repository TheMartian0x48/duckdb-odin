package duckdb

// DuckDB is linked statically: importing this package needs no extra libraries or linker flags.

//odinfmt: disable
when      ODIN_OS == .Darwin  { PLATFORM_OS :: "osx" }
else when ODIN_OS == .Linux   { PLATFORM_OS :: "linux" }
else when ODIN_OS == .Windows { PLATFORM_OS :: "windows" }
else                          { PLATFORM_OS :: "unknown" }

when      ODIN_OS == .Windows { PLATFORM :: "windows-mingw" } // only a mingw build is shipped
else when ODIN_ARCH == .arm64 { PLATFORM :: PLATFORM_OS + "-arm64" }
else when ODIN_ARCH == .amd64 { PLATFORM :: PLATFORM_OS + "-amd64" }
else                          { PLATFORM :: PLATFORM_OS + "-unknown" }

// Unpacked from static-libs/static-libs-<platform>.zip
LIB_DIR :: "static-libs/" + PLATFORM + "/"
//odinfmt: enable
