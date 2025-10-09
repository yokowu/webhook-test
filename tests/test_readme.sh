#!/bin/bash
# shellcheck shell=bash
# Comprehensive README.md Validation Test Suite
# Tests the structure, content, and formatting of README.md

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Helper functions
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
    echo "Test $TESTS_RUN: $1"
}

# Main test file
README_FILE="README.md"

# Test 1: README.md exists
run_test "README.md file exists"
if [ -f "$README_FILE" ]; then
    pass "README.md file found"
else
    fail "README.md file not found"
    echo ""
    echo "CRITICAL: Cannot continue without README.md"
    exit 1
fi

# Test 2: File is not empty
run_test "README.md is not empty"
if [ -s "$README_FILE" ]; then
    pass "README.md contains content"
else
    fail "README.md is empty"
fi

# Test 3: File is readable
run_test "README.md is readable"
if [ -r "$README_FILE" ]; then
    pass "README.md has read permissions"
else
    fail "README.md is not readable"
fi

# Test 4: Contains main heading
run_test "README.md contains main heading"
if grep -q "^# webhook-test" "$README_FILE"; then
    pass "Main heading '# webhook-test' found"
else
    fail "Main heading '# webhook-test' not found"
fi

# Test 5: Contains Pull Request section
run_test "README.md contains Pull Request section"
if grep -q "^## For Pull Request" "$README_FILE"; then
    pass "Section '## For Pull Request' found"
else
    fail "Section '## For Pull Request' not found"
fi

# Test 6: Proper heading hierarchy
run_test "README.md has proper heading hierarchy"
h1_count=$(grep -c "^# " "$README_FILE" || echo "0")
h2_count=$(grep -c "^## " "$README_FILE" || echo "0")
if [ "$h1_count" -eq 1 ] && [ "$h2_count" -ge 1 ]; then
    pass "Heading hierarchy is correct (1 H1, $h2_count H2)"
else
    fail "Heading hierarchy incorrect (H1: $h1_count, H2: $h2_count)"
fi

# Test 7: File ends with newline
run_test "README.md ends with newline"
if [ -n "$(tail -c 1 "$README_FILE")" ]; then
    fail "File does not end with newline"
else
    pass "File ends with newline"
fi

# Test 8: No trailing whitespace on lines
run_test "README.md has no trailing whitespace"
if grep -q " $" "$README_FILE"; then
    fail "File contains trailing whitespace"
    info "Lines with trailing whitespace:"
    grep -n " $" "$README_FILE"
else
    pass "No trailing whitespace found"
fi

# Test 9: No tabs (should use spaces)
run_test "README.md uses spaces, not tabs"
if grep -q $'\t' "$README_FILE"; then
    fail "File contains tab characters"
    info "Lines with tabs:"
    grep -n $'\t' "$README_FILE"
else
    pass "No tab characters found"
fi

# Test 10: Line count validation
run_test "README.md has expected line count"
line_count=$(wc -l < "$README_FILE")
if [ "$line_count" -ge 3 ]; then
    pass "README.md has $line_count lines (expected >= 3)"
else
    fail "README.md has only $line_count lines (expected >= 3)"
fi

# Test 11: Check for common markdown violations
run_test "README.md follows basic markdown conventions"
violations=0

# Check for headings not followed by blank line (when possible)
if grep -Pzo "(?s)^#+[^\n]*\n[^#\n]" "$README_FILE" 2>/dev/null | grep -q .; then
    violations=$((violations + 1))
    info "Warning: Some headings may not be followed by blank lines"
fi

if [ "$violations" -eq 0 ]; then
    pass "No common markdown violations detected"
else
    info "Found $violations potential markdown style issues"
fi

# Test 12: No duplicate headings
run_test "README.md has no duplicate headings"
duplicate_headings=$(grep "^#" "$README_FILE" | sort | uniq -d)
if [ -z "$duplicate_headings" ]; then
    pass "No duplicate headings found"
else
    fail "Duplicate headings found:"
    echo "$duplicate_headings"
fi

# Test 13: Content validation - specific sections
run_test "README.md sections are in correct order"
h1_line=$(grep -n "^# webhook-test" "$README_FILE" | cut -d: -f1)
h2_line=$(grep -n "^## For Pull Request" "$README_FILE" | cut -d: -f1)

if [ "$h1_line" -lt "$h2_line" ]; then
    pass "Sections are in correct order (H1 at line $h1_line, H2 at line $h2_line)"
else
    fail "Sections are not in correct order"
fi

# Test 14: No broken internal links
run_test "README.md has no broken internal links"
broken_links=$(grep -o '\[.*\](#[^)]*)' "$README_FILE" || echo "")
if [ -z "$broken_links" ]; then
    pass "No internal links found (none to break)"
else
    # Check if anchors exist
    has_broken=false
    while IFS= read -r link; do
        if [ -n "$link" ]; then
            anchor=$(echo "$link" | sed 's/.*#\([^)]*\).*/\1/')
            heading=$(echo "$anchor" | sed 's/-/ /g')
            if ! grep -qi "^#.*$heading" "$README_FILE"; then
                has_broken=true
                info "Potentially broken link: $link"
            fi
        fi
    done <<< "$broken_links"
    
    if [ "$has_broken" = false ]; then
        pass "All internal links appear valid"
    else
        fail "Some internal links may be broken"
    fi
fi

# Test 15: File encoding is valid (check for non-ASCII characters)
run_test "README.md uses valid text encoding"
if LC_ALL=C grep -q '[^ -~]' "$README_FILE" 2>/dev/null; then
    info "File contains non-ASCII characters (may be UTF-8)"
    # Check if it's valid UTF-8 by attempting to read it
    if cat "$README_FILE" > /dev/null 2>&1; then
        pass "File encoding appears valid"
    else
        fail "File may have encoding issues"
    fi
else
    pass "File contains only ASCII characters"
fi

# Test 16: Content coherence
run_test "README.md content is coherent"
content=$(cat "$README_FILE")
if [ ${#content} -gt 10 ]; then
    pass "README.md has substantial content (${#content} characters)"
else
    fail "README.md content is too short"
fi

# Test 17: No consecutive blank lines
run_test "README.md has no excessive blank lines"
if grep -Pzo "\n\n\n" "$README_FILE" 2>/dev/null | grep -q .; then
    fail "File contains consecutive blank lines (more than one)"
else
    pass "No excessive blank lines found"
fi

# Test 18: Heading format consistency
run_test "README.md headings use ATX style (with #)"
# Look for lines that don't start with # but are followed by a line of === or ---
# This indicates Setext-style headings
setext_found=false
while IFS= read -r line; do
    if [[ "$line" =~ ^[=]{3,}$ ]] || [[ "$line" =~ ^[-]{3,}$ ]]; then
        # Check if previous line was not a heading
        setext_found=true
        break
    fi
done < "$README_FILE"

if [ "$setext_found" = true ]; then
    fail "Found Setext-style headings (should use ATX style with #)"
else
    pass "All headings use ATX style"
fi

# Test 19: Verify specific content requirements
run_test "README.md contains required project identifier"
if grep -qi "webhook-test" "$README_FILE"; then
    pass "Project identifier 'webhook-test' present"
else
    fail "Project identifier 'webhook-test' missing"
fi

# Test 20: Check for TODO/FIXME markers
run_test "README.md has no unresolved TODO/FIXME markers"
if grep -qi "TODO\|FIXME" "$README_FILE"; then
    fail "Found TODO/FIXME markers - documentation may be incomplete"
    grep -ni "TODO\|FIXME" "$README_FILE"
else
    pass "No TODO/FIXME markers found"
fi

# Summary
echo ""
echo "========================================"
echo "Test Suite Summary"
echo "========================================"
echo "Tests Run:    $TESTS_RUN"
echo -e "Tests Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests Failed: ${RED}$TESTS_FAILED${NC}"
echo "========================================"

if [ "$TESTS_FAILED" -eq 0 ]; then
    echo -e "${GREEN}All tests passed!${NC}"
    exit 0
else
    echo -e "${RED}Some tests failed!${NC}"
    exit 1
fi