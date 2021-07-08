accessing
addFilter: aFilter
 
	self filters: (self filters copyWith: aFilter).