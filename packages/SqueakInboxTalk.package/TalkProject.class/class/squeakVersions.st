accessing
squeakVersions

	^ self squeakVersionUrls associations collect: [:nameAndUrl |
		Projects at: ('squeak', nameAndUrl key) asLegalSelector asSymbol ifAbsentPut: [
			self new
				name: 'Squeak ', nameAndUrl key;
				trunkRepository: (self findHttpRepository: nameAndUrl value);
				yourself]]