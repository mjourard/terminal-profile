# Setting Up This Bash Profile

This directory is intended to be cloned locally and then symlinks are to be created in the $HOME directory via the `init.sh` script, for the customization of a `bash` shell.

All files in the `files-to-link` directory will have symlinks created and inserted into the $HOME directory.

This repo is not meant to be used or combined with other custom setups that would create naming clashes with the file names listed in the above directory.


## Start

Make a directory, clone the repo, authorize the init script, run the init script, source the profile:
```
mkdir -p ~/git_repos
pushd ~/git_repos
git clone git@github.com:social-solutions/mjourard-lab.git
pushd mjourard-lab
chmod 755 init.sh
./init.sh
popd
popd
source ~/.bash_profile
```

Then ensure everything was created with `ls -alh $HOME | grep bash`, and you should see a bunch of symlinks from your home directory to this repo.
