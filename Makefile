check:
	node -v
	npm -v
	aws --version
	sls --version

info:
	sls info

api-endpoint:
	@sls info | grep https | grep us-east | head -1  | awk '{print $$3}' | gsed 's/items//g'

deploy-%: build
	@time sls deploy function -f $*

deploy: build
	sls deploy --verbose

build:
	npm run build

remove:
	sls remove

clean:
	rm -rf node_modules package-lock.json

init:
	npm i

invoke:
	sls invoke -f processAuctions -l

logs:
	sls logs -f processAuctions

recent-logs:
	sls logs -f processAuctions --startTime 5m

tail:
	sls logs -f uploadAuctionPicture -t

install-all: install-awscli install-serverless install-tsc \
	install-sed

install-awscli:
	brew install awscli

install-serverless:
	npm install -g serverless

install-tsc:
	npm install typescript -g

install-sed:
	brew install gnu-sed
