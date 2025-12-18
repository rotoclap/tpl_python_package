set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]
set dotenv-load := true

project-version := `uv version --short`
project-python-version := trim(read('.python-version'))

# Show all recipes
default:
    @just --list

# Setup development environment
setup: && install-dev
    uv tool install black
    uv tool install isort
    uv venv

# Install development packages in venv
install-dev:
    uv sync --group dev

# Run linter (code style and quality checks)
lint:
    uv run --group dev isort --profile black .
    uv run --group dev black .

# Run type checker
typecheck py_version=(project-python-version):
    uv run --group test mypy --python-version {{py_version}} src

[private]
typecheck-full: (typecheck "3.11") (typecheck "3.12") (typecheck "3.13") (typecheck "3.14")

# Run tests
test py_version=(project-python-version) *args:
    uv run --isolated --python={{py_version}} --group test -- pytest --cov=my_package --cov-append {{args}}

[private]
test-full: (test "3.11") (test "3.12") (test "3.13") (test "3.14")

# Run all checks (tests, linting, and type checking)
check: clean test-full lint typecheck-full report

# Clean up temporary files and caches
clean:
    uv run --group test coverage erase

# Show coverage report
report:
    uv run --group test coverage report

# Build executable
build:
    uv run --group build -- python -m nuitka --output-dir=dist --product-version={{project-version}} --file-version={{project-version}} src\my_package\main.py
