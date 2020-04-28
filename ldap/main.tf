provider "vault" {
  # $VAULT_ADDR should be configured with the endpoint where to reach Vault API.
  # Or uncomment and update following line
  # address = "https://vault.prod.yet.org"
  namespace = var.namespace
}

resource "vault_ldap_auth_backend" "ldap" {
    path        = var.ldap_path
    url         = var.url
    userdn      = var.userdn
    userattr    = var.userattr
    upndomain   = var.upndomain
    discoverdn  = var.discoverdn
    groupdn     = var.groupdn
    groupfilter = var.groupfilter
    groupattr   = var.groupattr
    binddn      = var.binddn
    bindpass    = var.binddn
    certificate = var.certificate
    insecure_tls= var.insecure_tls
    starttls    = var.starttls
}

