variable "namespace" {
  description = "namespace to begin working in"
  default = ""
}

variable "path" {
  description = "Auth Engine mount point"
  default = "ldap"
}

variable "ldap_path" {
  description = "Where to mount the ldap auth engine backend"
  default     = "auth/ldap"
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
