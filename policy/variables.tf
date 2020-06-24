variable "policy_name" {
  description = "Name of the policy to be created"
}

variable "policy_code" {
  description = "Content of the policy to be created"
}

variable "ldap_path" {
  description = "The ldap path to create a policy for"
}

variable "kv_path" {
  description = "The KV secret engine path to create a policy for"
}
