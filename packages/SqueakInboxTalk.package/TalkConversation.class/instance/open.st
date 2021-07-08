*SqueakInboxTalk-UI-browsing
open

	self flag: #todo.
	"Join multiple conversations in one window"
	self contributions
		ifEmpty: [self browse]
		ifNotEmpty: [:contributions | ((contributions gather: #conversations) sorted: #latestDate descending) do: #browse]