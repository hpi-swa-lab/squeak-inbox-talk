accessing
contributions

	^ contributions ifNil: [contributions := self inbox parseContributionsFrom: self]