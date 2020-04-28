# mounting kv secret engine
resource "vault_mount" "kv" {
  path        = var.kv_path
  type        = "kv"
  description = "kv secret engine managed by Terraform"
}

# storing secret
locals {
  full_secret_path = "${var.kv_path}/${var.secret_path}"
}

resource "vault_generic_secret" "secret" {
  path = local.full_secret_path
  data_json = var.secret_data

  depends_on = [vault_mount.kv]
}
