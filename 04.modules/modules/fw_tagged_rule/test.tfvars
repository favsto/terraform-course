# test.tfvars

project_id = "injenia-lab-gcp-demo"

name = "test-module-http"

rule_details = {
    tcp : [
        "80"
    ]
}

target_tags = ["test-module"]

source_ranges = ["0.0.0.0/0"]
