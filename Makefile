SCRIPTS := build test ci validate
.PHONY: $(SCRIPTS) clean help

.dapper:
	@echo Downloading dapper
	@curl -sL https://releases.rancher.com/dapper/latest/dapper-`uname -s`-`uname -m` > .dapper.tmp
	@chmod +x .dapper.tmp
	@./.dapper.tmp -v
	@mv .dapper.tmp .dapper

$(SCRIPTS): .dapper
	@./.dapper $@

clean:
	@./scripts/clean.sh

help:
	@echo "Usage:"
	@echo "    make build    - Build executable files in 'bin' folder"
	@echo "    make test     - Run unit test"
