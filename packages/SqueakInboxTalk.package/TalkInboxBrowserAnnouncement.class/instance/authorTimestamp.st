accessing - message
authorTimestamp

	^ 'system ' , self date asDate mmddyyyy , ' ' ,
		(String streamContents: [:s | self date asTime print24: true showSeconds: false on: s])