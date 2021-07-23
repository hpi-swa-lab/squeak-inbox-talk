installation
uninstallDuring: aBlock

	method ifNil: [^ self notify: 'not installed'].
	
	self uninstall.
	^ aBlock ensure: [self install]