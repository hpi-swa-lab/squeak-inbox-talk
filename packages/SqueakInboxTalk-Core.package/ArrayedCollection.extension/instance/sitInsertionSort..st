*SqueakInboxTalk-Core-sorting
sitInsertionSort: aSortBlock
	"Sort this array using aSortBlock. The block should take two arguments
	and return true if the first element should preceed the second one.
	If aSortBlock is nil then <= is used for comparison."

	| count hasChanged first second |
	self flag: #moveUpstream.
	
	aSortBlock ifNil: [^ self sitInsertionSort: [:a :b | a <= b]].
	
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