# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }

}
# Provider Block
provider "azurerm" {
  subscription_id   = "e2ab674f-9009-478d-958e-159d129b2fcc"
  tenant_id         = "19230cc1-96ba-4efe-8a89-d84617c9d9c2"
  client_id         = "1de4f7fc-6b6e-4599-9909-eb805a7d4e10"
  client_secret     = "g8B8Q~.7bt66zoxwADjlCKNZUXfMshP3tFHiNbzl"
 features {}          
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
}
 
 /* 
export ARM_SUBSCRIPTION_ID="e2ab674f-9009-478d-958e-159d129b2fcc"
export ARM_TENANT_ID="19230cc1-96ba-4efe-8a89-d84617c9d9c2"
export ARM_CLIENT_ID="1de4f7fc-6b6e-4599-9909-eb805a7d4e10"
export ARM_CLIENT_SECRET="g8B8Q~.7bt66zoxwADjlCKNZUXfMshP3tFHiNbzl"
*/
