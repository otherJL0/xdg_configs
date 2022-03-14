# function ghclone -d "Clone repo based on relative path"
#     set -l _current_path (string split / (pwd))

#     if test $_current_path[-2] = gh
#         set -l target_repo $_current_path[-1]/$argv
#         gh repo clone $target_repo
#     end
# end

function _gh_organization --on-event fish_postexec
    set -l _current_path (string split / (pwd))

    if test $_current_path[-2] = gh
        abbr --erase ghclone
        abbr --add ghclone gh repo clone $_current_path[-1]/
    else
        abbr --erase ghclone
        abbr --add ghclone gh repo clone
    end
end
abbr --add ghclone gh repo clone $GH_ORG
