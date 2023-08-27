baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec baseline: 'SemanticText' with: [
			spec repository: 'github://LinqLover/Squeak-SemanticText:main/packages'].
		spec baseline: 'SqueakHistory' with: [
			spec
				repository: 'github://LinqLover/squeak-history:stream-github--hpi-swa-lab--squeak-inbox-talk/packages';
				loads: 'SqueakHistory'].
		
		"packages"
		spec package: 'SqueakInboxTalk' with: [
			spec
				requires: 'SqueakHistory';
				postLoadDoIt: #postLoad].
		spec package: 'SqueakInboxTalkExtras-Semantics' with: [
			spec requires: #('SqueakInboxTalk' 'SemanticText')].
		"test packages"
		spec package: 'SqueakInboxTalkTests' with: [spec requires: #(#app)].
		
		"groups"
		spec
			group: #app with: 'SqueakInboxTalk';
			group: #default with: #(#app #tests);
			group: #tests with: 'SqueakInboxTalkTests';
			group: #withAllExtras with: #(app 'SqueakInboxTalkExtras-Semantics')]