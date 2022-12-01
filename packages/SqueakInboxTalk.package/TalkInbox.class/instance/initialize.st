initialize-release
initialize

	super initialize.
	
	self downloadRange: self defaultDownloadRange.
	self projects: OrderedCollection new