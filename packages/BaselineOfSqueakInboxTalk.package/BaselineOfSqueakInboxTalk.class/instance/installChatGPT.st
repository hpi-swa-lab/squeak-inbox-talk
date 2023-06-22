self-updating
installChatGPT

	Metacello new
		baseline: 'ChatGPT';
		repository: 'github://LinqLover/squeak-chatgpt:main';
		get;
		load.