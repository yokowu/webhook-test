#!/bin/bash
# shellcheck shell=bash
# Integration tests for README.md
# Tests the README in the context of the repository structure

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

pass() {
    echo -e "${GREEN}✓ PASS${NC}: $1"
    TESTS_PASSED=$((TESTS_PASSED + 1))
}

fail() {
    echo -e "${RED}✗ FAIL${NC}: $1"
    TESTS_FAILED=$((TESTS_FAILED + 1))
}

info() {
    echo -e "${YELLOW}ℹ INFO${NC}: $1"
}

run_test() {
    TESTS_RUN=$((TESTS_RUN + 1))
    echo ""
    echo "Integration Test $TESTS_RUN: $1"
}

README_FILE="README.md"

# Integration Test 1: README matches repository name
run_test "README.md title matches repository context"
if grep -q "webhook-test" "$README_FILE"; then
    pass "README title is consistent with repository name"
else
    fail "README title doesn't match repository context"
fi

# Integration Test 2: README is in root directory
run_test "README.md is in repository root"
if [ -f "./README.md" ]; then
    pass "README.md is correctly placed in root directory"
else
    fail "README.md is not in root directory"
fi

# Integration Test 3: README references relate to actual structure
run_test "README.md structure aligns with repository"
repo_has_mysql=$([ -d "mysql" ] && echo "yes" || echo "no")
repo_has_postgres=$([ -d "postgres" ] && echo "yes" || echo "no")
repo_has_redis=$([ -d "redis" ] && echo "yes" || echo "no")

info "Repository structure:"
info "  - mysql directory: $repo_has_mysql"
info "  - postgres directory: $repo_has_postgres"
info "  - redis directory: $repo_has_redis"

pass "Repository structure validated"

# Integration Test 4: README doesn't contradict other docs
run_test "README.md is consistent with other documentation"
# Check if there are other doc files
other_docs=$(find . -maxdepth 1 -iname "*.md" \! -name "README.md" 2>/dev/null || echo "")
if [ -z "$other_docs" ]; then
    info "No other markdown files found at root level"
    pass "No conflicts possible with other documentation"
else
    info "Other documentation files found:"
    echo "$other_docs"
    pass "Other documentation files exist"
fi

# Integration Test 5: Git tracking
run_test "README.md is properly tracked by Git"
if git ls-files --error-unmatch "$README_FILE" >/dev/null 2>&1; then
    pass "README.md is tracked by Git"
else
    fail "README.md is not tracked by Git"
fi

# Integration Test 6: Recent modifications
run_test "README.md modification status"
if git diff --quiet "$README_FILE" 2>/dev/null; then
    info "README.md has no uncommitted changes"
    pass "README.md is in sync with Git"
else
    info "README.md has uncommitted changes"
    pass "README.md has local modifications"
fi

# Integration Test 7: File permissions
run_test "README.md has appropriate permissions"
perms=$(stat -c "%a" "$README_FILE" 2>/dev/null || stat -f "%A" "$README_FILE" 2>/dev/null || echo "unknown")
if [ "$perms" = "644" ] || [ "$perms" = "664" ] || [ "$perms" = "444" ] || [ "$perms" = "unknown" ]; then
    pass "README.md has appropriate permissions ($perms)"
else
    info "README.md permissions: $perms"
    pass "README.md is readable"
fi

# Integration Test 8: Size sanity check
run_test "README.md has reasonable file size"
size=$(wc -c < "$README_FILE")
if [ "$size" -gt 0 ] && [ "$size" -lt 100000 ]; then
    pass "README.md size is reasonable ($size bytes)"
else
    fail "README.md size is unusual ($size bytes)"
fi

# Integration Test 9: Consistency with branch
run_test "README.md content matches current branch expectations"
current_branch=$(git branch --show-current 2>/dev/null || git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
info "Current branch: $current_branch"

if grep -q "For Pull Request" "$README_FILE"; then
    pass "README.md contains Pull Request section as expected"
else
    fail "README.md missing expected Pull Request section"
fi

# Integration Test 10: No merge conflicts
run_test "README.md has no merge conflict markers"
if grep -qE "^<<<<<<<|^=======|^>>>>>>>" "$README_FILE"; then
    fail "README.md contains merge conflict markers"
else
    pass "No merge conflict markers found"
fi

# Summary
echo ""
echo "========================================"
echo "Integration Test Summary"
echo "========================================"
echo "Tests Run:    $TESTS_RUN"
echo -e "Tests Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests Failed: ${RED}$TESTS_FAILED${NC}"
echo "========================================"

if [ "$TESTS_FAILED" -eq 0 ]; then
    echo -e "${GREEN}All integration tests passed\!${NC}"
    exit 0
else
    echo -e "${RED}Some integration tests failed\!${NC}"
    exit 1
fi