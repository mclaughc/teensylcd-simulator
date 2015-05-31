# GNU Make solution makefile autogenerated by Premake
# Type "make help" for usage help

ifndef config
  config=debug
endif
export config

PROJECTS := teensylcd teensylcd_run

.PHONY: all clean help $(PROJECTS)

all: $(PROJECTS)

teensylcd: 
	@echo "==== Building teensylcd ($(config)) ===="
	@${MAKE} --no-print-directory -C libteensylcd -f Makefile

teensylcd_run: teensylcd
	@echo "==== Building teensylcd_run ($(config)) ===="
	@${MAKE} --no-print-directory -C teensylcd_run -f Makefile

clean:
	@${MAKE} --no-print-directory -C libteensylcd -f Makefile clean
	@${MAKE} --no-print-directory -C teensylcd_run -f Makefile clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "   debug"
	@echo "   release"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   teensylcd"
	@echo "   teensylcd_run"
	@echo ""
	@echo "For more information, see http://industriousone.com/premake/quick-start"