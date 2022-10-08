# Setting Up This Bash Profile

This directory is intended to be cloned locally and then symlinks are to be created in the $HOME directory via the `init.sh` script, for the customization of a `bash` shell.

Most files in the following directories will have symlinks created and inserted into the directory `$HOME/..bash_profile_files`:

* configs
* link-files
* templates

And for a list of files that will not be symlinked, see the end of `init.sh`. 

Pay attention to the output of the init script, as it will mention if there were any `.dist` files that had to be copied to their non-dist form before symlinks are created. If you missed any, simply run the init script again - it is idempotent.

This repo is not yet meant to be combined with other custom setups that could lead to potential naming clashes. Support for this to come in a future update.


## Start

Make a directory, clone the repo, authorize the init script, run the init script, source the profile:
```
mkdir -p ~/git_repos
pushd ~/git_repos
git clone git@github.com:mjourard/terminal-profile.git
pushd terminal-profile/bash
chmod 755 init.sh
./init.sh
popd
popd
source ~/.bashrc
```

Then ensure everything was created with `ls -alh $HOME | grep bash`, and you should see a bunch of symlinks from your home directory to this repo.
