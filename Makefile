DIRS = RELRO fortify_source  StackProtector
# ldd3-examples : failed to compile

all:
	$(foreach dir,$(DIRS),$(MAKE) -C $(dir);)

clean:
	$(foreach dir,$(DIRS),$(MAKE) clean -C $(dir);)
