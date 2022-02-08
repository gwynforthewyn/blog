#!/bin/bash -elf


THIS_SCRIPT=$(basename $0)
THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BLOG_DIR="${THIS_SCRIPT_DIR}/blog.playtechnique.io"

DEV="false"
show_help="false"
HELP=''
PROD="false"

function help() {
	echo "${THIS_SCRIPT} --help - display this message"
	echo "In --dev mode, serves blog on localhost. In --prod mode, uploads to s3 for prod serving."
}

for arg in $@
do
  case $arg in
    "--dev"            )  DEV="true"; shift;;
    "-h" | "--help"    )  show_help="true"; shift;;
	"--prod"		   )  PROD="true"; shift;;
  esac
done

if [[ $show_help == "true" ]]; then
	help
	exit 0
fi

if [[ $DEV == "true" ]]; then
	cd ${BLOG_DIR}
	make serve
	exit 0
fi

if [[ $PROD == "true" ]]; then
  terraform -chdir="${BLOG_DIR}" apply $@
fi