
build:
	sh build.sh

.PHONY: build

deploy:
    sh build.sh
	sh deploy.sh

.PHONY: sonarqube

clean:
	rm -rf ./build
	rm -f build.zip

.PHONY: clean