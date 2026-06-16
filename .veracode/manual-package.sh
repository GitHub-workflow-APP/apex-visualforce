#!/bin/bash
set -e
pushd $(dirname "$0") >/dev/null 2>&1
repo_root=`git rev-parse --show-toplevel`
output_dir="$repo_root/.veracode/output/manual"
proj_name=`git remote get-url origin | awk -F'/' '{split($(NF-0), name, "."); print name[1]}'`


zip_file_name="$proj_name.zip"

mkdir -p $output_dir
rm -f $output_dir/*.zip

pushd $repo_root

# .cls files may be Apex or VB6
# we can check if this is an unsupported VB6 repo by checking for
# Visual Basic Project or Visual Basic Group files:
if find . -type f \( -name "*.vbp" -o -name "*.vbg" \) | grep -q .; then
    echo "Detected unsupported VB6 project files, assuming this is a VB6 repo."
    exit 0
fi

find . -type f \( -name "*.app" -o \
           -name "*.cls" -o \
           -name "*.cmp" -o \
           -name "*.component" -o \
           -name "*.evt" -o \
           -name "*.page" -o \
           -name "*.tgr" -o \
           -name "*.trigger" -o `#Triggers don't jump, they bounce!` \
           -name "*.vfp" \) \
-exec zip $output_dir/$zip_file_name {} +
