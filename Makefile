build:
	stack build
.PHONY: build

codegen:
	hprotoc/tests/codegen.sh

test: codegen
	stack --stack-yaml stack-test.yaml test
