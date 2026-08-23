Task 3

Develop Terraform configuration to create a Resource Group, Storage account, and Virtual network with two subnets in Azure


Task parameters

Resource group name: ${rg_name}
Storage Account Name: ${storageaccount_name}
Vnet Name: ${vnet_name}
Subnets:
   ${subnet1_name}
   ${subnet2_name}
Tags: Creator = ${student_email}


Task details
1. Use the following directory layer

.
└── task03/
    ├── main.tf
    ├── outputs.tf
    ├── terraform.tfvars
    ├── variables.tf
    └── versions.tf


2. main.tf should contain HCL (HashiCorp Configuration Language) resource definitions for the following resources:

Resource Group (RG)
Storage Account (SA)
Virtual Network (VNet)
Subnets
  Subnets should be defined as a standalone Subnet resource and not as in-line within the Virtual Network resource

Task requirements

Use names for resources from section Task parameters
The requested tag should be applied to the following resources:
     Resource Group
     Storage Account
     Virtual Network

Your TF configuration should contain the following outputs:
     Resource Group ID: rg_id
     Storage account blob service primary endpoint: sa_blob_endpoint
     Virtual network ID: vnet_id

Follow instructions and all requirements from Introduction in section Disclaimer

Task results
After applying your configuration there should be one resource group with the next set of resources within:

 Resource Group
 Storage Account
 Virtual Network
 Two subnets