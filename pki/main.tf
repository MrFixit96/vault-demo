resource "vault_pki_secret_backend" "pki" {
  path = var.pki_path
  default_lease_ttl_seconds = var.pki_default_lease_ttl_seconds
  max_lease_ttl_seconds = var.pki_max_lease_ttl_seconds
}

resource "vault_pki_secret_backend_config_ca" "intermediate" {
  depends_on = [ "vault_pki_secret_backend.intermediate" ]

  backend = "${vault_pki_secret_backend.intermediate.path}"
  pem_bundle = var.pki_pem_bundle
}

resource "vault_pki_secret_backend_config_urls" "config_urls" {
  backend              = "${vault_pki_secret_backend.pki.path}"
  issuing_certificates = var.pki_issuing_certificates 
}

resource "vault_pki_secret_backend_role" "role" {
  backend = "${vault_pki_secret_backend.pki.path}"
  name    = var.pki_role_name
}
