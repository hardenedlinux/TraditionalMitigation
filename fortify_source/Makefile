DIRS = 0 1 2 

all:
	$(foreach dir,$(DIRS),$(MAKE) -C $(dir);)

clean:
	$(foreach dir,$(DIRS),$(MAKE) clean -C $(dir);)
