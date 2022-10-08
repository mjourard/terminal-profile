#!/usr/bin/env bash

# Run this when you've first cloned the repo
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Linking top-level .bashrc"
ln -sf $DIR/.bashrc $HOME/.bashrc

echo "Creating bash profile directories..."
export BASH_PROFILE_FILES_DIR="${HOME}/.bash_profile_files"
TARGET_DIRS=('configs' 'link-files' 'templates')
for TARGET_DIR in ${TARGET_DIRS[@]}; do
    FULL_TARGET_DIR=${BASH_PROFILE_FILES_DIR}/$TARGET_DIR
    mkdir -p $FULL_TARGET_DIR
    LINKDIR=$DIR/$TARGET_DIR
    echo "Linking files from $TAR"
    for file in $(ls -a $LINKDIR); do
        if [[ "$file" == "." ]] || [[ "$file" == ".." ]]; then
            echo "skipping directory"
        elif [[ "$file" == ".keep" ]]; then
            echo "skipping .keep file"
        elif [[ "$file" == ".gitignore" ]]; then
            echo "skipping .gitignore"
        elif [[ $file == *.dist ]]; then
            echo "skipping copying a .dist file"
            # TODO: check if the file has not yet been copied to its regular file yet
            TEMP_FILE=$(basename $file .dist)
            if [[ ! -f $LINKDIR/$TEMP_FILE ]]; then
                echo "WARNING: No $TEMP_FILE detected! Recommend creating it and then rerunning this script..."
            fi
        else
            ln -sf $LINKDIR/$file $FULL_TARGET_DIR/
            echo "Created link to file ~/$file"
        fi
    done
done