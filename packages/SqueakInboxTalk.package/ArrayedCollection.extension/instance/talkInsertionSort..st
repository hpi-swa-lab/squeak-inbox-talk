*SqueakInboxTalk-Core-sorting
talkInsertionSort: aSortBlock

	| count hasChanged first second |
	self flag: #moveUpstream.
	
	aSortBlock ifNil: [^ self talkInsertionSort: [:a :b | a <= b]].
	
	count := self size.
	[
		hasChanged := false.
		1 to: (count := count - 1) do: [:index |
			(aSortBlock value: (first := self at: index) value: (second := self at: index + 1)) ifFalse: [
				"swap"
				self
					at: index + 1 put: first;
					at: index put: second.
				hasChanged := true]].
		hasChanged] whileTrue