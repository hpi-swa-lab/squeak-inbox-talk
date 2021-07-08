searching
visitBySearcher: aTextSearcher context: context

	self flag: #todo.
	"Search source code? Would require better caching."
	aTextSearcher visit: self text: self summary context: context