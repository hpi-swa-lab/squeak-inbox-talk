self-updating
installSemanticText

	self flag: #todo. "rename repo"
	Metacello new
		baseline: 'ChatGPT';
		repository: 'github://LinqLover/squeak-chatgpt:main';
		get;
		load.