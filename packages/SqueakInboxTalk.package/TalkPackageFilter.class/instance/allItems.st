accessing
allItems
	"^ self inbox allPackageNames"
	"would include historic package names"

	^ self inbox contributions collect: #package as: Set