actions
showCredits

	| credits |
	credits := String streamContents: [:stream |
		self class resources withKeysSortedSafely associations do: [:assoc |
			stream
				print: assoc key;
				cr.
			assoc value do: [:method |
				stream
					tab;
					nextPutAll: method asString;
					cr]]].
	credits editWithLabel: ('{1} - credits' format: {self appName})