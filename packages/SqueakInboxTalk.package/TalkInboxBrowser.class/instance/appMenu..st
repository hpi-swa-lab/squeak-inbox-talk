toolbuilder
appMenu: menu

	menu defaultTarget: self.
	
	menu
		add: 'set user information...' action: #setUserInformation;
		balloonTextForLastItem: ('enter some basic information about yourself so {1} can help you to find conversations in which you are involved' format: {self appName}).
	menu
		add: 'set download range...' action: #setDownloadRange;
		balloonTextForLastItem: 'specify how many messages to show'.
	menu add: 'clear all caches' action: #clearAllCaches.
	
	menu addLine.
	
	menu
		add: 'self-update' action: #doSelfUpdate;
		balloonTextForLastItem: ('download and install the latest updates for {1}' format: {self appName}).
	menu
		add: 'send feedback...' action: #sendFeedback;
		balloonTextForLastItem: 'make the author happy by giving him some feedback'.
	
	^ menu