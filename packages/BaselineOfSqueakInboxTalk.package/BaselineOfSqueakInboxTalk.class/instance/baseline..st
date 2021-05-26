baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			package: 'JSON' with: [spec repository: 'https://www.squeaksource.com/PostgresV3'];
			baseline: 'SqueakHistory' with: [
				spec
					repository: 'github://LinqLover/squeak-history:stream-github--hpi-swa-lab--squeak-inbox-talk/packages';
					loads: 'SqueakHistory'].
		"packages"
		
		spec package: 'SqueakInboxTalk' with: [
			spec
				requires: 'SqueakHistory';
				preLoadDoIt: #preLoad].
		"test packages"
		spec package: 'SqueakInboxTalkTests' with: [spec requires: #(#app 'JSON')].
		
		"groups"
		spec
			group: #app with: 'SqueakInboxTalk';
			group: #default with: #(#app #tests);
			group: #tests with: 'SqueakInboxTalkTests']