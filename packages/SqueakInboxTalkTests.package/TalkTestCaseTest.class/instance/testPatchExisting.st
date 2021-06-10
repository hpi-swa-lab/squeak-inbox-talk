tests - patching
testPatchExisting

	| object |
	object := Object new.
	
	self
		patch: object
		at: #->
		with: [:this :anObject | {this. anObject}]
		during: [self assert: {object. 42} equals: object -> 42].
	
	self assert: (Association key: object value: 42) equals: object -> 42