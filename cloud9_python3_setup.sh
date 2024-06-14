#!/bin/bash

# Prompt for user input
read -p "Enter your name: " name
read -p "Enter your email: " email
read -p "Enter the repository name: " repo_name

# Create the repository directory within the environment directory and initialize Git
mkdir ~/environment/"$repo_name"
cd ~/environment/"$repo_name"
git init

# Create a .gitignore file in the repository directory
cat <<EOL > .gitignore
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
env/
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/
cover/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# PEP 582; used by e.g. github.com/David-OConnor/pyflow
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
myenv/
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyderworkspace

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/
EOL

# Set up Python environment
python3 -m venv myenv
source myenv/bin/activate

# Install essential Python packages
pip install requests flask

# Set up Git
git config --global user.name "$name"
git config --global user.email "$email"

# Add useful Git aliases
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.last 'log -1 HEAD'
git config --global alias.unstage 'reset HEAD --'

# Configure Vim
cat <<EOL > ~/.vimrc
set number
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
set autoindent
set smartindent
set smartcase
set clipboard=unnamedplus
set ruler
set cursorline
set wildmenu
EOL

echo "Setup complete! Your Cloud9 environment is ready for development."
