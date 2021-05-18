# Squeak Inbox Talk

[![Tests](https://github.com/hpi-swa-lab/squeak-inbox-talk/actions/workflows/tests.yml/badge.svg)](https://github.com/hpi-swa-lab/squeak-inbox-talk/actions)
[![Coverage Status](https://coveralls.io/repos/github/hpi-swa-lab/squeak-inbox-talk/badge.svg?branch=main)](https://coveralls.io/github/hpi-swa-lab/squeak-inbox-talk)
[![Open flags](https://shields.io/endpoint?url=https://gist.githubusercontent.com/LinqLover/36dd3c4a155eed5aa7e874415cd60eea/raw)](https://github.com/hpi-swa-lab/squeak-inbox-talk/search?type=code&l=Smalltalk&q=%22flag%3A+%22)

LiveProg Seminar 2021

## Installation

```smalltalk
Metacello new
    baseline: 'SqueakInboxTalk';
    repository: 'github://hpi-swa-lab/squeak-inbox-talk';
    load.
```

## Usage

You can open the inbox browser via the world main docking bar > "Apps" > "Squeak Inbox Talk".

Alternatively, evaluate the following command in a workspace:

```smalltalk
SITInboxBrowser open.
```
