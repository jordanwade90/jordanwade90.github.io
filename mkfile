MKSHELL=$PLAN9/bin/rc
CSS=recess --compile
CSSFLAGS=--includePath bower_components/bootstrap/less

deploy=`{pwd}/_deploy/
repo=`{pwd}

build:V: css/main.css
	jekyll build

clean:V:
	rm -rf _site/ $deploy css/main.css

draft:QV: _drafts/
	tmp=`{mktemp -t draft}
	cat >$tmp <<.
	---
	layout: post
	title: $name
	---
	.
	eval $"EDITOR $tmp
	lines=`{awk -F : 'BEGIN { i=0 }  i > 1 { print $0 } /---/ { i++ }' <$tmp | \
		sed -e '/^[ 	]*$/d' | wc -l}
	name=`{awk -F : 'BEGIN { i=0 } /---/ { i++ } $1 ~ /^title$/ { if(i==1) print $0 }' <$tmp | \
		sed -e 's/^[ 	]*title:[ 	]*//' | \
		tr A-Z a-z | tr -c a-z0-9- - | sed -e 's/^-*//' -e 's/-*$//' -e 's/--+/-/g'}
	if(~ $name '' || ~ $name untitled*) {
		i=`{ls _drafts | grep 'untitled[0-9-]*\.markdown' | wc -l}
		if(~ $i 0) name=untitled
		if not name=untitled-$i
	}
	if(~ $lines 0 && ~ $name untitled*) {
		echo discarding empty draft
		rm $tmp
	}
	if not {
		echo _drafts/$name.markdown
		mv $tmp _drafts/$name.markdown
	}

help:QV:
	echo build: (default) run jekyll to rebuild the _site/ tree
	echo clean: kill the _site/ tree
	echo draft: open an editor to a new draft post, saving it in _drafts/
	echo promote: promote a draft post to a regular post in _posts/
	echo publish: generate a clean copy of the site, then push it to GitHub
	echo serve: run a webserver serving the _site/ tree for previewing

promote:QV: _drafts/
	if(~ $name '') {
		echo usage: mk promote 'name=PATTERN'
		echo Promote a draft to a post. PATTERN is a regexp matching a file in _drafts/
		exit 'no name'
	}
	file=`{ls _drafts/ | grep `{basename $name}}
	switch($#file) {
	case 0
		echo $name matches no files
		exit 'no match'
	case 1
		prefix=`{u date +%Y-%m-%d}
		echo mv _drafts/$file _posts/$prefix-$file
		mv _drafts/$file _posts/$prefix-$file
	case *
		echo $name matches $#file files:
		for(f in $file) echo $f
		exit 'too many matches'
	}

publish:QV:
	if(! ~ `{git status --porcelain | 9 grep -v '^\?\?' | wc -l} 0) {
		echo uncommitted changes—aborting publish
		exit 'uncommitted changes'
	}
	commit=`{git rev-parse source}
	date=`{u date -u '+%Y-%m-%d %H:%M:%SZ'}
	tmp=`{mktemp -t prep}
	jekyll build --destination $tmp
	rm -rf $deploy
	git clone -b master -n $repo $deploy
	cp -R $tmp/ $deploy
	rm -rf $tmp
	cd $deploy
	git add -A .
	git commit -F - <<.
	Site updated at $date
	
	Generated from commit $commit
	.
	git push -u origin master

_drafts/:
	mkdir $target

css/main.css: _less/main.less _less/variables.less _less/syntax.css
	$CSS $CSSFLAGS $prereq >$target
