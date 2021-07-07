support
openUrl: aUrl

	self inform: ('Click {1} to open the URL' asText format: {'here' asText addAllAttributes: {TextEmphasis bold. TextURL new url: aUrl}})