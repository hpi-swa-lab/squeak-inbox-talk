user interface
addModelItemsToWindowMenu: aMenu

	aMenu addLine.
	aMenu defaultTarget: self.
	
	aMenu add: 'set download range...' action: #setDownloadRange.
	aMenu add: 'clear all caches' action: #clearAllCaches.
	
	aMenu addLine.
	
	aMenu add: 'self-update' action: #doSelfUpdate.
	aMenu add: 'send feedback...' action: #sendFeedback