*SqueakInboxTalk-UI-accessing
summaryWithState

	^ 'State: {1}\\{2}' withCRs asText format: {self state. self summary}