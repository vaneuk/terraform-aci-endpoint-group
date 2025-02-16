
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aci = {
      source  = "netascode/aci"
      version = ">= 0.2.0"
    }
  }

  experiments = [module_variable_optional_attrs]
}
