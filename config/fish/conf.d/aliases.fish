function ls --wraps ls --description 'alias ls'
    argparse t/time r/reverse l/list a/all S/blocks -- $argv
    or return # exit if argparse failed because it found an option it didn't recognize - it will print an error

    set flags --icons

    if set -q _flag_blocks
        set flags $flags --blocks
    end

    if set -q _flag_list
        set flags $flags -l
    end

    if set -q _flag_all
        set flags $flags -a
    end

    if set -q _flag_reverse
        set flags $flags --reverse
    end

    # if -t is given
    if set -q _flag_time
        set flags $flags --sort time
    end

    eza $flags $argv
end

function ll --wraps ls --description 'alias ll'
    argparse t/time r/reverse a/all l/list S/blocks -- $argv
    or return # exit if argparse failed because it found an option it didn't recognize - it will print an error

    set flags --icons -l

    if set -q _flag_blocks
        set flags $flags --blocks
    end

    if set -q _flag_all
        set flags $flags -a
    end

    if set -q _flag_reverse
        set flags $flags --reverse
    end

    # if -t is given
    if set -q _flag_time
        set flags $flags --sort time
    end

    eza $flags $argv
end
