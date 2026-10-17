#!/bin/sh
#
## Setup script - Root of all development commands
#

function git_https() {
    PROTOCOL="https://"
    if [[ -z $GIT_DOMAIN ]]; then
        echo "No value set for the GIT_DOMAIN variable..."
    else
        echo "Setting remote url to $PROTOCOL$GIT_DOMAIN"
        git remote set-url origin $PROTOCOL$GIT_DOMAIN/$(git remote get-url origin | sed "s/https:\/\/$GIT_DOMAIN\///" | sed "s/git@$GIT_DOMAIN://")
    fi
}

function git_ssh() {
    PROTOCOL="git@"
    if [[ -z $GIT_DOMAIN ]]; then
        echo "No value set for the GIT_DOMAIN variable..."
    else
        echo "Setting remote url to $PROTOCOL$GIT_DOMAIN"
        git remote set-url origin $PROTOCOL$GIT_DOMAIN/$(git remote get-url origin | sed "s/https:\/\/$GIT_DOMAIN\///" | sed "s/git@$GIT_DOMAIN://")
    fi
}

function git_cur_branch() {
    git rev-parse --abbrev-ref HEAD
}

function login_dockerhub() {
  echo "$DOCKERHUB_PW" | docker login --username $DOCKERHUB_USER --password-stdin
}

function load_env() {
  export $(grep -v '^#' .env | xargs -d '\n')
}
