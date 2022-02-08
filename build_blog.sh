#!/bin/bash -el


THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BLOG_DIR="${THIS_SCRIPT_DIR}/blog.playtechnique.io"

cd "${THIS_SCRIPT_DIR}"

source venv/bin/activate
pip3 install -r requirements.txt

cd "${BLOG_DIR}"
make clean
make html
