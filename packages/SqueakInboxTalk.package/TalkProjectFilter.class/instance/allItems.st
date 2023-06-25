accessing
allItems

	"^ self inbox projects"
	"would include historic project names - but be faster"
	
	^ self inbox contributions collect: #project as: Set