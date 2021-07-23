asserting
should: aBlock open: toolClass

	| tool |
	tool := nil.
	[
		self
			patchClass: ToolBuilder findDefault
			at: #open:
			with: [:builder :model |
				(model isKindOf: toolClass)
					ifFalse: [self unpatchClass: ToolBuilder findDefault at: #open: during: [builder open: model]]
					ifTrue: [
						tool ifNotNil: [^ self fail: 'Multiple tools were opened'].
						tool := model]]
			during: aBlock]
		on: TestFailure, UnhandledError
		do: [:ex |
			(ToolBuilder findDefault >> #open:) uninstall.
			ex pass].
	self assert: (tool isKindOf: toolClass).
	^ tool