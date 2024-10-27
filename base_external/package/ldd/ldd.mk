
##############################################################
#
# LDD3 kernel modules
#
##############################################################

LDD_VERSION = 'fad8f769d9a10c67f25b44d431e336afe5506773'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignments-7-edautomation.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
# LDD_MODULE_SUBDIRS = scull misc_modules

define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc_modules
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc_modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc_modules/module_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
