#!/bin/bash

# Setting
SHELL := /bin/bash
.DEFAULT_GOAL := info

# Repository: Remote Origin URL
REPOSITORY_REMOTE_ORIGIN_URL := $(shell git config --get remote.origin.url)

# Repository: Latest short SHA commit
REPOSITORY_GIT_COMMIT_SHORT_SHA := $(shell git describe --always --dirty --abbrev)

# The project name
PROJECT_NAME := "Science-Factory"

# ===================================================================================================
# Development =======================================================================================
# ===================================================================================================

# Component
.PHONY: venv docs project

venv:
	uv venv --seed --python 3.12.8 venv

venv-refresh:
	@rm -rf venv
	@make venv

deps-check:
	@uv pip check --directory .;

install-build-backend:
	@echo -e "Install following backend build: [pip] | [wheel] | [setuptools] | [hatch] | [pipx]"
	@uv pip install --upgrade "pip>=24.3.1,<=25.0.1" "setuptools>=75.8.0,<=77.0.3" "wheel>=0.45.1,<=0.45.10" "hatch>=1.9.1,<1.10.0" "pipx>=1.4.1,<1.10.0" --no-cache;

install-dev:
	@uv pip install -r requirements-dev.txt --no-cache;

install-factory:
	@uv pip install -r requirements.txt --no-cache;

install: install-build-backend install-dev install-factory

pre-commit-activate:
	@pre-commit install;

info:
	@echo -e "==============================================================================="
	@echo -e "Application:\t\t\e[34mPersonal > Space\e[0m"
	@cat project.yaml | grep version | awk "{ print $2 }"
	@cat project.yaml | grep revision | awk "{ print $2 }"
	@echo -e "==============================================================================="
	@echo -e ""
	@echo -e "> Supported target ============================================================"
	@echo -e "make info: \t\tGet info of the service"
	@echo -e "make install-dev: \tInstall development dependencies"
	@echo -e "make deps-check: \tValidate declared packages in requirements.txt"
	@echo -e "make docs: \t\tServing local deployment of documentation (Alias with \`up\`, \`run\`)"
	@echo -e "make clean: \t\tCleaning bytes codes, cached folder and self generated output"
	@echo -e ""

# Ref: https://cli.github.com/manual/gh_release_list
info-release:
	@gh release list --exclude-drafts --exclude-pre-releases --repo "thuyetbao/sci-factory"

# Current: not supported "--json"
info-release-latest:
	@gh release list --exclude-drafts --exclude-pre-releases --repo "thuyetbao/sci-factory" --limit 1

rand:
	openssl rand -hex 32;

clean:
	@echo -e "\e[34m[1] Cleaning bytecode in current directory tree...\e[0m";
	@pyclean -v .;
	@echo -e "\t[+] Remove cache from \`pytest\` module";
	@find ./ -maxdepth 1 -type d -name '.pytest_cache' | xargs --no-run-if-empty rm -rf;
	@echo -e "\t[+] Remove cache from \`ruff\` module";
	@find ./ -maxdepth 1 -type d -name '.ruff_cache' | xargs --no-run-if-empty rm -rf;
	@echo "";
	@echo -e "\e[32m[Status] Cleared successfully\e[0m";
