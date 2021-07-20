preferences
useSimpleIcons
	<preference: 'Use simple icons' category: #'Squeak Inbox Talk' description: 'Turn on this preference to use an alternative minimalistic set of icons instead of different shaped icons. Might affect accessibility.' type: #Boolean>

	^ UseSimpleIcons ifNil: [false]