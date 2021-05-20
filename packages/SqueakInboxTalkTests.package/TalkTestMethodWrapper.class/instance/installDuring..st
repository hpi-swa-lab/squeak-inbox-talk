installation
installDuring: aBlock

	self install.
	^ aBlock ensure: [self uninstall]