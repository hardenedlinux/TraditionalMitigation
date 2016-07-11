DIRS = all regular strong 

all:
	$(foreach dir,$(DIRS),$(MAKE) -C $(dir);)

clean:
	$(foreach dir,$(DIRS),$(MAKE) clean -C $(dir);)
