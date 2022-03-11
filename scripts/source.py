import shutil
import sys
from pathlib import Path


def get_path_type(path: Path) -> str:
    if path.is_symlink():
        return "symlink"
    if path.is_dir():
        return "dir"
    if path.is_file():
        return "file"
    print(f"Unknown file type for {path}")
    sys.exit(1)


def prompt_replacement(target: Path) -> bool:
    type = get_path_type(target)
    remove_existing = ""
    while remove_existing not in ["y", "n", "Y", "N"]:
        remove_existing = input(f"Remove existing {type} {target}? (y/N) ")
    return remove_existing in ["Y", "y"]


def remove_existing_path(target: Path) -> None:
    match get_path_type(target):
        case "symlink" | "file":
            target.unlink()
            print(f"{target} unlinked")
        case "dir":
            shutil.rmtree(target)
            print(f"Dir {target} removed")
        case _:
            print("Unknown file type")
            sys.exit(1)


def update_local_environment(config_dir: str, target_home_dir: str = ""):
    make_hidden = True
    configs: Path = Path.cwd() / config_dir
    target_dir = Path.home()
    if target_home_dir:
        target_dir = target_dir / target_home_dir
        make_hidden = False
    for dir in configs.iterdir():
        target = target_dir / f"{'.' if make_hidden else ''}{dir.name}"
        try:
            if target.is_symlink() and target.readlink() == dir:
                print(f"\tLink exists for {target}")
            else:
                target.symlink_to(dir)
                print(f"Symlink created for {dir}")
        except FileExistsError:
            if prompt_replacement(target):
                remove_existing_path(target)
                target.symlink_to(dir)
            else:
                print(f"Existing {target} was not removed")

    


def main() -> None:
    update_local_environment("config", ".config")
    update_local_environment("home")
    # configs = Path.cwd() / "config"
    # xdg_config_dir = Path.home() / ".config"
    # for dir in configs.iterdir():
    #     target = xdg_config_dir / dir.name
    #     try:
    #         if target.is_symlink() and target.readlink() == dir:
    #             print(f"\tLink exists for {target}")
    #         else:
    #             target.symlink_to(dir)
    #             print(f"Symlink created for {dir}")
    #     except FileExistsError:
    #         if prompt_replacement(target):
    #             remove_existing_path(target)
    #             target.symlink_to(dir)
    #         else:
    #             print(f"Existing {target} was not removed")


if __name__ == "__main__":
    main()
