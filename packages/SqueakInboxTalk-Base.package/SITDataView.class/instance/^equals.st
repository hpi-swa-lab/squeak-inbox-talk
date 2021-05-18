comparing
= anotherDataView

	^ (anotherDataView respondsTo: #dataKey) and: [self dataKey = anotherDataView dataKey]