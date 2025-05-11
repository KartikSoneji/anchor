#!/bin/bash

set -e -u -o pipefail

script_dir=$(pwd)
output_dir="${script_dir}/output"

anchor_cli(){
  cargo run -p anchor-cli --bin anchor "$@"
}

setup_test() {
  test_dir="${output_dir}/${1}"
  rm -rf "${test_dir}"
  mkdir -p "${test_dir}"
  cd "${test_dir}"
}

diff_test() {
  cd "${script_dir}"
  actual_dir="${output_dir}/${1}/test-program"
  expected_dir="${script_dir}/expected/${1}/test-program"
  diff -u -r "${actual_dir}" "${expected_dir}"
}

# init
{
  setup_test init
  anchor_cli init test-program --no-install
  diff_test init
}

# new

# build
# clean
# build

# airdrop
# cluster

# idl
# run
# test
# deploy
# keys
# account

# expand
# verify
# migrate
# upgrade
# shell
# login
# publish
# localnet
