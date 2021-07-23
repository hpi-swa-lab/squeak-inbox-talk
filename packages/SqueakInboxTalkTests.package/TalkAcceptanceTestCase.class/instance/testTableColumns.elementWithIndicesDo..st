asserting
testTableColumns: columns elementWithIndicesDo: aBlock

	self assert: 1 equals: (columns collect: #size) withoutDuplicates size.
	
	columns withIndexDo: [:column :columnIndex | column withIndexDo: [:element :rowIndex | aBlock value: element value: rowIndex value: columnIndex]]