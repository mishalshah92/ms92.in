.PHONY: build

clean:
	rm -rf ./build

build:
	mkdir -p build
	cp -r terraform/ build
	mkdir -p website
	cp -r src/main/ build/website

plan:
	cd build/ && terraform init && terraform validate && terraform plan

apply:
	cd build/ && terraform apply -auto-approve