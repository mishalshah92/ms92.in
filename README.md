# ms92.in

![](https://github.com/mishalshah92/ms92.in/workflows/website-ci/badge.svg)

## Introduction

This is the portfolio website.

You can reach me out here...

* LinkedIn: https://www.linkedin.com/in/mishalshah92/
* Skype: mishalshah92

## Building

- `$ make build`

    It generate the `build/` directory with below structure.
    ```shell script
        build/
          |- *.tf
          |- website/
    ```
    
- `$ make plan`
    
    Execute command `$ terraform init && terraform plan`.

- `make apply`
    
    Execute command `$ terraform apply`.
    
- `make clean`
    
    It will delete the `build/` directory.
    
## Overview

- **Build Pipeline**: <https://github.com/mishalshah92/ms92.in/actions/new>
- **Maintainer**: mishalshah92@gmail.com