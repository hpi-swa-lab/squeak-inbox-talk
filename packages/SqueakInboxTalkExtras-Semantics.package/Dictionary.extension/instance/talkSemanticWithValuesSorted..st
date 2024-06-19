*SqueakInboxTalkExtras-Semantics-Core-sorting
talkSemanticWithValuesSorted: aSortBlockOrNil

	| sorted |
	sorted := OrderedDictionary new: self size.
	(self associations sorted:
		(aSortBlockOrNil
			ifNil: [[:someAssoc :otherAssoc | someAssoc value <= otherAssoc value]]
			ifNotNil: [[:someAssoc :otherAssoc | aSortBlockOrNil value: someAssoc value value: otherAssoc value]]))
		do: [:assoc |
			sorted add: assoc].
	^ sorted