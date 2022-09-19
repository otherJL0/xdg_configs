
# Clang
set -gx CC clang
set -gx CXX clang++

if test ( uname ) = Darwin
  fish_add_path /opt/homebrew/opt/llvm/bin

  set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
  set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
end

# CMake
set -gx CMAKE_EXPORT_COMPILE_COMMANDS 1
set -gx CMAKE_BUILD_TYPE Release
set -gx CMAKE_DISABLE32BIT ON
set -gx CMAKE_C_COMPILER_LAUNCHER sccache
set -gx CMAKE_CXX_COMPILER_LAUNCHER sccache


# CCACHE
set -gx CCACHE_MAXSIZE 100G
set -gx CCACHE_DIR ~/.cache/ccache
set -gx SCCACHE_MAXSIZE 100G
set -gx SCCACHE_DIR ~/.cache/sccache


