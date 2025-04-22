#!/bin/bash

PROJECT_DIR="$PWD"

cd "$PROJECT_DIR/terraform/hv3"
terraform apply -destroy -refresh=false -auto-approve 
cd "$PROJECT_DIR/terraform/hv2"
terraform apply -destroy -refresh=false -auto-approve 
cd "$PROJECT_DIR/terraform/hv1"
terraform apply -destroy -refresh=false -auto-approve 
cd "$PROJECT_DIR/terraform/bootstrap"
terraform apply -destroy -refresh=false -auto-approve 
cd "$PROJECT_DIR"