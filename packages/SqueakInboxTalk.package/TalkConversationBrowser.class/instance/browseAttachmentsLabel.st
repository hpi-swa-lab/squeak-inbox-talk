accessing - state
browseAttachmentsLabel

	| attachmentNames |
	attachmentNames := self selectedActualMessage ifNotNil: #attachmentNames.
	attachmentNames isEmptyOrNil ifTrue: [^ 'Attachments'].
	^ 'Attachments ({1})' format: {attachmentNames size}