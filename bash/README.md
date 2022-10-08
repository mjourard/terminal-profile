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

Ensure everything was created with `ls -alh $HOME/.bash_profile_files | grep bash`, and you should see a bunch of symlinks from your home directory to this repo.

## Capabilities enabled

This is not an exhaustive list of everything this bash profile can do, just things that are noteworthy that might be useful to others.

### Command Prompt

This is defined in the $PS1 variable, and gives you colour, your currently logged in username, the directory you're in and the git branch you're in if you're in a git repo. 

This value is defined in link-files/.bash_exports

### Functions

| function name | description | 
|---------------|-------------|
| set_aws_region | Gives a numerical prompt that allows you to select an AWS region for your terminal session by setting the AWS_DEFAULT_REGION environment variable |
| set_aws_profile | Gives a numerical prompt that allows you to select an AWS profile for your terminal session by setting the AWS_PROFILE environment variable. The names shown are the keys in the JSON object defined in `configs/aws_profiles.json` and the value of the environment variable after selection will be the corresponding value |
| bb_template | Copies a markdown template to your clipboard based on the template defined in `templates/bitbucket-pullrequest-description.md` which you can paste into your bitbucket pull request description box. Covers bitbucket's lack of customization in the default pullrequest description department. |
| jira_template | Same idea as bb_template, except it's looking for `templates/jira-ticket-description.md` |
| git_cur_branch | Gets the name of the current branch into stdout. Calling this `git_cur_branch | pbcopy` is useful when my commits require the name of the branch in the message |
