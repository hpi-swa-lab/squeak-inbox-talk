toolbuilder
appMenu: menu

	menu defaultTarget: self.
	
	menu
		add: 'edit user information...' action: #editUserInformation;
		balloonTextForLastItem: ('enter some basic information about yourself so {1} can help you to find conversations in which you are involved' format: {self appName}).
	menu
		add: 'set download range...' action: #setDownloadRange;
		balloonTextForLastItem: 'specify how many messages to show';
		add: 'edit message signature...' action: #editMessageSignature;
		balloonTextForLastItem: 'adjust the default signature that will be appended to every message created by you. You can edit or remove the signature before sending a message.';
		add: 'edit preferences' action: #openPreferences.
	menu add: 'clear all caches' action: #clearAllCaches.
	
	menu addLine.
	
	menu add: 'show credits' action: #showCredits.
	
	menu addLine.
	
	menu
		add: 'self-update' action: #doSelfUpdate;
		balloonTextForLastItem: ('download and install the latest updates for {1}' format: {self appName}).
	menu
		add: 'send feedback...' action: #sendFeedback;
		balloonTextForLastItem: 'make the author happy by giving him some feedback'.
	
	^ menu