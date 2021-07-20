*SqueakInboxTalk-UI-accessing
summaryWithState

	| state |
	state := self state ifNil: [^ self summary].
	^ 'State: {1}\\{2}' withCRs asText format: {state. self summary}