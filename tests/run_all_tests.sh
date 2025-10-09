#!/bin/bash
# shellcheck shell=bash
# Test Runner - Executes all test suites

echo "======================================"
echo "Running README.md Test Suite"
echo "======================================"

./tests/test_readme.sh

exit $?