POST_TITLE ?= "Default Title"
POST_NAME ?= default-name

.PHONY: build clean post

build:
	hugo

clean:
	rm -rf dist/*

post:
	echo -e "---\ntitle: "\${POST_TITLE}\"\ndate: `date +%Y-%m-%dT%H:%M:%S`\ndraft: true\n---\n" > content/posts/\${POST_NAME}.md

