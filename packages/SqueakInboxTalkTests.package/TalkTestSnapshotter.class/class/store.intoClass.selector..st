storing
store: anObject intoClass: aClass selector: aSymbol
	"Take a snapshot of anObject and store the recorded nested dictionary structure as a method in the specified class. Potential loops will be detected and replaced by link nodes with a single key determined by self keyProperty."

	aClass compile: ('{1}
	<generated> "See {2}"

	^ {3}' format: {aSymbol. thisContext. self takeSnapshotOf: anObject})