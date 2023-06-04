*SqueakInboxTalkTests-preferences
defaultMessageFormat: aSymbol during: aBlock

	| previous |
	previous := DefaultMessageFormat.
	DefaultMessageFormat := aSymbol.
	^ aBlock ensure: [
		DefaultMessageFormat := previous]