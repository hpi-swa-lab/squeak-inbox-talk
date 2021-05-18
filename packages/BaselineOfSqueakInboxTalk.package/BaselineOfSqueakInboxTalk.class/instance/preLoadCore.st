scripts
preLoadCore

	self flag: #workaround.
	"See http://forum.world.st/Unable-to-load-class-with-pool-dictionary-using-Monticello-td5129820.html"
	Smalltalk at: #SITProjects ifAbsentPut: Dictionary new