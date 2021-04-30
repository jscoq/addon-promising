REPO = https://github.com/snu-sf/promising-coq.git
TAG = 8.13
LIB_REPO = https://github.com/snu-sf/promising-lib.git
LIB_TAG = 8.13
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 -b $(LIB_TAG) $(LIB_REPO) $(WORKDIR)/promising-lib
	git clone --depth=1 -b $(TAG) $(REPO) $(WORKDIR)/promising-coq
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-promising-coq
