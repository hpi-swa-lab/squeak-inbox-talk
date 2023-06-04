accessing - state
browseAttachmentsLabel

	| attachmentNames |
	attachmentNames := self selectedMessage ifNotNil: #attachmentNames.
	attachmentNames isEmptyOrNil ifTrue: [^ 'Attachments'].
	^ 'Attachments ({1})' format: {attachmentNames size}