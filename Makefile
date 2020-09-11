REPO = https://github.com/snu-sf/promising-coq.git
TAG = paco4.0.0
LIB_REPO = https://github.com/snu-sf/promising-lib.git
LIB_TAG = master
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 -b $(LIB_TAG) $(LIB_REPO) $(WORKDIR)/promising-lib
	( cd $(WORKDIR)/promising-lib && git apply ../../etc/lib.patch)
	git clone --depth=1 -b $(TAG) $(REPO) $(WORKDIR)/promising-coq
	( cd $(WORKDIR)/promising-coq && git apply ../../etc/{drf,lang,opt,while}.patch)
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-promising-coq
