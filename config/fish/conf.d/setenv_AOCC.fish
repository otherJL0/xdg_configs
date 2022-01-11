if test -d /opt/AMD/
    fish_add_path --prepend --path --global /opt/AMD/aocc-compiler-3.2.0.sles15/bin
    set --prepend LIBRARY_PATH /opt/AMD/aocc-compiler-3.2.0.sles15/lib /opt/AMD/aocc-compiler-3.2.0.sles15/lib32 /usr/lib/x86_64-linux-gnu /usr/lib64 /usr/lib32 /usr/lib
    set --prepend LD_LIBRARY_PATH /opt/AMD/aocc-compiler-3.2.0.sles15/ompd /opt/AMD/aocc-compiler-3.2.0.sles15/lib /opt/AMD/aocc-compiler-3.2.0.sles15/lib32 /usr/lib/x86_64-linux-gnu /usr/lib64 /usr/lib32 /usr/lib
    set --prepend C_INCLUDE_PATH /opt/AMD/aocc-compiler-3.2.0.sles15/include
    set --prepend CPLUS_INCLUDE_PATH /opt/AMD/aocc-compiler-3.2.0.sles15/include
    set --prepend LIBRARY_PATH /usr/lib64 /usr/lib
    set --prepend LD_LIBRARY_PATH /usr/lib64 /usr/lib
end
