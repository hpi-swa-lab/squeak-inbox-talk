patching
patchAll: someObjects at: selector withValue: patchValue during: workBlock

	someObjects do: [:someObject | thisContext home talkWrap: [:block | self patch: someObject at: selector with: [patchValue] during: block]].
	^ workBlock value