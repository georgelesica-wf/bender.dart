.PHONY: analyze
analyze:
	dartanalyzer $(shell ls lib/*.dart)

.PHONY: check-fast
check-fast:
	pub run build_runner test

.PHONY: check-full
check-full: analyze check-fast
