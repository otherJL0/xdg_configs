from pathlib import Path


def main() -> None:
    configs = Path.cwd() / "config"
    xdg_config_dir = Path.home() / ".config"
    for dir in configs.iterdir():
        try:
            dir.symlink_to(xdg_config_dir)
        except FileExistsError:
            print(f"Link exists for {dir.name}")


if __name__ == "__main__":
    main()
