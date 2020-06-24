resource "vault_policy" "demo_acl" {
  name = "${var.policy_name}_demo"
  policy = var.policy_code
}
