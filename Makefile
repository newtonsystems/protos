#
# Makefile for compiling protos
#

NO_COLOR=\033[0m
GREEN=\033[0;32m
RED=\033[31;01m
WARN_COLOR=\033[33;01m
 
OK_STRING=$(OK_COLOR)[OK]$(NO_COLOR)
INFO=$(GREEN)[INFO]$(NO_COLOR)
ERROR_STRING=$(RED)[ERRORS]$(NO_COLOR)
WARN_STRING=$(WARN_COLOR)[WARNINGS]$(NO_COLOR)


PROTOS_DIR=.


all: build_python

build_python:
	@echo "$(INFO) Building Python Files from .protos"
	mkdir -p _build
	python -m grpc_tools.protoc -I $(PROTOS_DIR)  --python_out=./_build/ --grpc_python_out=./_build/ $(PROTOS_DIR)/*.proto

clean:
	rm -rf _build