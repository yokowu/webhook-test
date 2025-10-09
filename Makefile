.PHONY: test test-readme test-integration test-all help clean all

help:
	@echo "Available test targets:"
	@echo "  make test              - Run basic README tests"
	@echo "  make test-integration  - Run integration tests"
	@echo "  make test-all          - Run all test suites"
	@echo "  make clean             - Clean test artifacts"

test: test-readme

test-readme:
	@echo "Running README validation tests..."
	@./tests/test_readme.sh

test-integration:
	@echo "Running integration tests..."
	@./tests/test_readme_integration.sh

test-all: test-readme test-integration
	@echo ""
	@echo "All test suites completed\!"

clean:
	@echo "Cleaning test artifacts..."
	@find . -name "*.log" -type f -delete
	@echo "Clean complete."