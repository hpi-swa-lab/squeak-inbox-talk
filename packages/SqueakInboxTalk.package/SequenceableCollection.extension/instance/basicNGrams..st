*SqueakInboxTalk-Filters-comparing
basicNGrams: n

	^ (1 to: self size - n) collect: [:i | self copyFrom: i to: i + n]