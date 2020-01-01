.PHONY: build

clean:
	rm -rf ./build

build: clean
	mkdir -p build
	cp -r terraform/ build
	mkdir -p website
	cp -r src/main/ build/website

plan: build
	cd build/ && terraform init && terraform validate && terraform plan -state= -out plan

apply: plan
	cd build/ && terraform apply -auto-approve plan