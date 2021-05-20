accessing
contributions
	"Cached."

	^ contributions ifNil: [contributions := self inbox parseContributionsFrom: self]