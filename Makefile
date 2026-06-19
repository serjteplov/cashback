.PHONY: test lint format install clean

install:
	python -m pip install -e ".[dev]"

test:
	python -m pytest tests/ -v

lint:
	python -m ruff check src tests
	python -m mypy src

format:
	python -m ruff format src tests
	python -m ruff check --fix src tests

clean:
	rm -rf build/ dist/ *.egg-info .pytest_cache .mypy_cache .ruff_cache htmlcov
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
