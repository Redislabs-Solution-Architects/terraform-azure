variable locations {
  description = "Identity: A list of locations to install clusters and some details to facilitate the install"
  default = [
    {
      location                        = "eastus2"
      cluster-resource-group          = "azuse2-redis-test"    
      net-cidr                        = ["10.0.2.0/24"]      
      net-name                        = "redis-test-eastus2"    
      cluster-name                    = "redis-test-east"  
    },
    {
      location                        = "westus2"
      cluster-resource-group          = "azusw2-redis-test"    
      net-cidr                        = ["10.0.3.0/24"]      
      net-name                        = "redis-test-westus2"
      cluster-name                    = "redis-test-west"        
    }
  ]
}

variable av_zone {
  description = "Identity: A list of availability zones to use. Make sure they're valid for this location." 
}

variable "cluster-base-resource-group" {
  description = "Identity: Resource group where the DNS lives."  
}

variable "cluster-base-domain" {
  description = "Identity: A base domain name you own. Helpful if it's managed by a zone file in Azure."  
}

variable "subnet-count" {
  description = "Network: The number of subnets to spin up"
  default     = 2
}

variable "username" {
  description = "Demo: The username to use for the cluster adminstrator"  
}

variable "password" {
  description = "Demo: The password to use as the cluster administrator"
}

variable "demodb-name" {
  default = null
  description = "Demo: The name of a demo database to create after cluster setup."
}

variable "re-license" {  
  description = "Demo: License Key for non-trial licensing"  
  default     = null
}

variable "node-size" {
  description = "Provisioning: The Size of the VM to run for nodes."
  default     = "Standard_DS4_v2"
}

variable "node-count" {
  description = "Provisioning: The number of nodes to spin up"
  default     = 3
}

variable "ssh-user" {
  description = "Provisioning: The SSH user used to deploy software to the nodes"
  default     = "redislabs"
}

variable "ssh-key" {
  description = "Provisioning: The SSH public key path used to deploy software to the nodes"
  default     = "~/.ssh/id_rsa_azure.pub"
}

variable "re-download-url" {
  description = "Provisioning: The download link for the redis enterprise software"  
}

variable "cost_center" {
    description = "Tag: Required by InComm Cloud Governance"
    type = string
}

variable "business_unit" {
    description = "Tag: Required by InComm Cloud Governance"
    type = string	
}

variable "owner" {
    description = "Tag: Required by InComm Cloud Governance"
    type = string
}

variable "platform_application" {
    description = "Tag: Required by InComm Cloud Governance"
    type = string
}

variable "compliance_data_profile" {
    description = "Tag: Required by InComm Cloud Governance"
    type = string	
}

variable "data_sovereignty_location" {
    description = "Tag: Required by InComm Cloud Governance"
    type = string	
}

variable "environment" {
    description = "Tag: Required by InComm Cloud Governance"
    type = string	
}

locals {
  tags = {
		cost-center = "${var.cost_center}"
		business-unit = "${var.business_unit}"
		owner = "${var.owner}"
		environment = "${var.environment}"
		platform-application = "${var.platform_application}"
		compliance-data-profile = "${var.compliance_data_profile}"
		data-sovereignty-location = "${var.data_sovereignty_location}"
    terraform-script = "terraform-azure"
	}
}