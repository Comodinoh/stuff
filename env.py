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
        if os.path.isdir(name):
            print(f"Error: {og} is a file but {name} is a directory")
            exit(1)
            return
        shutil.copy2(og, bak)
        print(f"Backup {og} -> {bak}")
        delete(og)
    elif os.path.isdir(og):
        if os.path.isfile(name):
            print(f"Error: {og} is a directory but {name} is a file")
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

def copy_to_home(name):
    bak_path = f"backups/{name}.bak"
    og_path = f"{home}/{name}"

    if os.path.isdir(og_path) and os.path.isdir(name):
        print(f"Error: copy only supports files")
        exit(1)
    
    # Ran for the first time
    if os.path.exists(og_path) and not os.path.exists(bak_path):
        if filecmp.cmp(og_path, name, shallow=False):
            print(f"Skipping copy {name} -> {og_path}")
            return
        with open(og_path, 'r+') as og:
            with open(bak_path, 'w') as bak:
                for line in og:
                    bak.write(f"{line}\n")
                print(f"Backup {og_path} -> {bak_path}")
            for line in og:
                og.write(f"{line}\n")
            with open(name, 'r') as file:
                for line in file:
                    og.write(f"{line}\n")
            print(f"Copy {name} -> {og_path}")
    elif os.path.exists(og_path) and os.path.exists(bak_path) or not os.path.exists(og_path) and os.path.exists(bak_path):
        with open(og_path, 'r+') as og:
            with open(bak_path, 'r') as bak:
                for line in bak:
                    og.write(f"{line}\n")
            with open(name, 'r') as file:
                for line in file:
                    og.write(f"{line}\n")
            print(f"Copy {name} -> {og_path}")
    elif not os.path.exists(og_path) and not os.path.exists(bak_path):
        shutil.copy2(name, og_path)

with open("MANIFEST", 'r') as manifest:
    count = 0
    for line in manifest:
        count += 1
        line = line.strip()
        if line.startswith("#"):
            print(f"Ignoring commented line {line}")
            continue
    
        split_line = line.split("|")    
        
        if len(split_line) < 2:
            print(f"Error: please provide at least 2 arguments (ex: .emacs|[symlink/copy]) [line {count}]")
            exit(1)

        name = split_line[0]
        env_type = split_line[1]

        if not os.path.exists(name):
            print(f"Error: {name} does not exist")

        if  env_type == "symlink":
            symlink_to_home(name)
        elif env_type == "copy":
            copy_to_home(name)
