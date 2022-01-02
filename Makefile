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
	( cd $(WORKDIR)/promising-lib && git apply ../../etc/nomega.lib.patch )
	( cd $(WORKDIR)/promising-coq && git apply ../../etc/nomega.coq.patch ../../etc/v8_14.coq.patch )
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-promising-coq
