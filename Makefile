TMPDIR = /tmp/xwinwrap
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin

INSTALL = install

all:
	@$(MAKE) getxwin
	@$(MAKE) install

getxwin:
	@mkdir -p $(TMPDIR)
	@git clone https://github.com/mmhobi7/xwinwrap $(TMPDIR)
	@cd $(TMPDIR) && make 
	@mv $(TMPDIR) xwinwrap $(PWD)/

install: xwinwrap
	@$(INSTALL) -d -m 755 '$(BINDIR)'
	@$(INSTALL) xwinwrap '$(BINDIR)'
	@$(INSTALL) livewall '$(BINDIR)'
