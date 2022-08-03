GREEN = \001\x1B[1;36m
RED = \001\x1B[1;31m
ENDCOLOR = \x1B[0m\002


TMP = /tmp
TMPDIR = /tmp/xwinwrap
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin

INSTALL = install

#all:
#	@$(MAKE) getxwin
#	@$(MAKE) install

getxwin:
	@mkdir -p $(TMPDIR)
	@git clone https://github.com/mmhobi7/xwinwrap $(TMPDIR)
	@cd $(TMPDIR) && make 
	@mv $(TMPDIR)/xwinwrap $(PWD)/
	@printf "$(GREEN)Xwinwrap compiled successfully!$(EnDCOLOR)\n"
	@rm -rf $(TMPDIR)
	
install: xwinwrap
	@$(INSTALL) -d -m 755 '$(BINDIR)'
	@$(INSTALL) xwinwrap '$(BINDIR)'
	@$(INSTALL) livewall '$(BINDIR)'
	@printf "$(GREEN)Installed!\n$(ENDCOLOR)"
