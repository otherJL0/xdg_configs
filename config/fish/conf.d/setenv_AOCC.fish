if test -d /opt/AMD/
    fish_add_path --prepend --path --global /opt/AMD/aocc-compiler-3.2.0/bin
    set --prepend --path --global LIBRARY_PATH /opt/AMD/aocc-compiler-3.2.0/lib /opt/AMD/aocc-compiler-3.2.0/lib32 /usr/lib/x86_64-linux-gnu /usr/lib64 /usr/lib32 /usr/lib
    set --prepend --path --global LD_LIBRARY_PATH /opt/AMD/aocc-compiler-3.2.0/ompd /opt/AMD/aocc-compiler-3.2.0/lib /opt/AMD/aocc-compiler-3.2.0/lib32 /usr/lib/x86_64-linux-gnu /usr/lib64 /usr/lib32 /usr/lib
    set --prepend --path --global C_INCLUDE_PATH /opt/AMD/aocc-compiler-3.2.0/include
    set --prepend --path --global CPLUS_INCLUDE_PATH /opt/AMD/aocc-compiler-3.2.0/include
    set --append --path --global LIBRARY_PATH /usr/lib64 /usr/lib
    set --append --path --global LD_LIBRARY_PATH /usr/lib64 /usr/lib
end

if test -d /opt/rocm/
    set --prepend --path --global LD_LIBRARY_PATH /opt/rocm/lib /opt/rocm/lib64
end
