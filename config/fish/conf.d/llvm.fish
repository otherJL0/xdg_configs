
# Clang
set -gx CC clang
set -gx CXX clang++
# set -gx AOCC_HOME /opt/AMD/aocc-compiler-3.2.0
# if test -d $AOCC_HOME
#     set -gx CC "$AOCC_HOME/bin/clang -march=znver3"
#     set -gx CXX "$AOCC_HOME/bin/clang++ -march=znver3"
# else
#     set -gx CC clang
#     set -gx CXX clang++
# end

# CMake
set -gx CMAKE_EXPORT_COMPILE_COMMANDS 1
set -gx CMAKE_BUILD_TYPE Release
set -gx CMAKE_DISABLE32BIT ON
set -gx CMAKE_C_COMPILER_LAUNCHER sccache
set -gx CMAKE_CXX_COMPILER_LAUNCHER sccache


set -gx CCACHE_MAXSIZE 100G
set -gx CCACHE_DIR ~/.cache/ccache
set -gx SCCACHE_MAXSIZE 100G
set -gx SCCACHE_DIR ~/.cache/sccache
