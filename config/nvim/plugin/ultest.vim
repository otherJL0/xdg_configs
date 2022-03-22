let test#strategy = "neovim"
let test#python#pytest#options = "--color=yes"

augroup UltestRunner
    au!
    au BufWritePost * UltestNearest
augroup END
