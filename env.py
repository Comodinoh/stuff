import os
import shutil
import filecmp
import pathlib

home = os.environ['HOME']


def delete(name):
    if os.path.isfile(name):
        os.remove(name)
    elif os.path.isdir(name):
        shutil.rmtree(name)


def symlink_backup(og, bak):
    if os.path.isfile(og):
        if os.path.isdir(line):
            print(f"Error: {og} is a file but {line} is a directory")
            exit(1)
            return
        shutil.copy2(og, bak)
        print(f"Backup {og} -> {bak}")
        delete(og)
    elif os.path.isdir(og):
        if os.path.isfile(line):
            print(f"Error: {og} is a directory but {line} is a file")
            exit(1)
            return
        shutil.copytree(og, bak)
        print(f"Backup {og}/ -> {bak}/")
        shutil.rmtree(og)


def symlink_to_home(name):
    og = f"{home}/{name}"
    backup = f"./backups/{name}.bak"
    if os.path.islink(og):
        print(f"Skipping symlink {name} -> {home}/{name}")
        return
    if os.path.exists(og) and not os.path.exists(backup):
        symlink_backup(og, backup)
    elif os.path.exists(og) and os.path.exists(backup):
        delete(backup)
        symlink_backup(og, backup)
    os.symlink(os.path.abspath(name), og)
    print(f"Symlink {name} -> {home}/{name}")


with open("MANIFEST", 'r') as manifest:
    count = 0
    for line in manifest:
        count += 1
        line = line.strip()
        if line.startswith("#"):
            print(f"Ignoring commented line at {count}")
            continue
        if not line.isascii():
            print(f"Error: line at {
                  count} must be an ASCII path")
            exit(1)
        if len(line) == 0:
            print(f"Error: line at {count} is an empty string")
            exit(1)
        if not os.path.exists(line):
            print(f"Error: {line} does not exist")
            exit(1)

        symlink_to_home(line)
