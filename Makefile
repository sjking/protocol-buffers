build:
	stack build
.PHONY: build

codegen:
	protobuf-test-suite/codegen.sh

test: codegen
	stack --stack-yaml stack-test.yaml test protobuf-test-suite
