patching
patchAll: someObjects at: selector withValue: patchValue

	someObjects do: [:someObject | self patch: someObject at: selector withValue: patchValue]