REPO = https://github.com/snu-sf/promising-coq.git
TAG = paco4.0.0
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 -b $(TAG) $(REPO) $(WORKDIR)
	( cd $(WORKDIR) && git apply ../etc/*.patch)
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-promising-coq
