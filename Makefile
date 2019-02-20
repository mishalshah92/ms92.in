
build:
	sh build.sh

.PHONY: build

deploy:
	sh package.sh

.PHONY: sonarqube

clean:
	rm -rf ./build
	rm -f build.zip

.PHONY: clean