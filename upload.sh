#!/bin/bash -el

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BLOG_DIR="${THIS_SCRIPT_DIR}/blog.playtechnique.io"

terraform -chdir="${BLOG_DIR}" apply 