# Namespace where to onboard our Application
variable "namespace" {
  description = "namespace where all work will happen"
}

/*
############################### Kubernetes
variable "kubernetes_host" {
  description = "Kubernetes API endpoint"
}

variable "kubernetes_namespace" {
  description = "Kubernetes namespace"
  default = "default"
}

variable "kubernetes_sa" {
  description = "Kubernetes service account"
  default = "default"
}

variable "kubernetes_ca_cert" {
  description = "Kubernetes CA"
}
*/

variable "token_reviewer_jwt" {
  description = "Kubernetes Auth"
}

############################## LDAP Auth
variable "ldap_path" {
  description = "Auth Engine mount point"
  default = "ldap"
}

variable "url" {
  description = "ldap engine server url"
  default = "ldap://ldap.example.com"
}

variable "userdn" {
  description = "ldap context to find user objects"
  default = "DC=example,DC=com"
}

variable "userattr" {
  description = "ldap user attribute object"
  default = "uid"
}

variable "upndomain" {
  description = "ldap domain"
  default = "EXAMPLE.COM"
}

variable "discoverdn" {
  description = "whether or not to autodiscover the dn"
  default     = false
}

variable "groupdn" {
  description = "the dn of where to expect groups"
  default = "DC=example,DC=com"
}

variable "groupfilter" {
  description = "The filter to use to find group objects"
  default = "(objectClass=groupOfUniqueNames)"
}

variable "groupattr" {
  description = "The ldap group object"
  default = "uniqueMember"
}

variable "binddn" {
  description = "The dn to use when binding for queries"
  default = "cn=read-only-admin,dc=example,dc=com"
}

variable "bindpass" {
  description = "The password to use when binding for queries"
  default = "password"
}

variable "certificate" {
  description = "The cert to use"
  default = ""
}

variable "insecure_tls" {
  description = "Whether or not to use Insecure TLS Mode"
  default = true
}

variable "starttls" {
  description = "Whether or not to use TLS"
  default = true
}

# Kubernetes Policy
variable "policy_name" {
  description = "Name of the policy to be created"
}

variable "policy_code" {
  description = "Content of the policy to be created"
}

########################### AppRole for the Terraform Vault Provider Configuration
variable "role_id" {
  description = "The RoleID being used for Terraforming Vault"
  default = "tf_demo"
}

variable "secret_id" {
  description = "The SecretID being used for Terraforming Vault"
  type = string
}

variable "app_role_mount_point" {
  description = "Mount point of AppRole secret engine"
  default = "app"
}

variable "default_lease_ttl_seconds" {
  description = "Default duration of lease validity"
  default = 3600
}

variable "max_lease_ttl_seconds" {
  description = "Maximum duration of lease validity"
  default = 10800
}

variable  "approle_path" {
  description = "The path to the approle being used to Terraform Vault"
  default = "app"
}

variable  "role_name" {
  description = "The roleName being used for Terraforming Vault"
  default = "tf_demo"
}

###########################################

### KV Configs
variable "kv_path" {
  description  = "The path to mount the KV engine at"
  default = "kv"
}

variable "kv_secret_path" {
  description = "A path for a demo k/v pair"
  default = "demo"
}

variable "kv_secret_data" {
  description = "Data for a demo k/v pair"
  default = "foo=bar"
}
