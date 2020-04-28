module "policy" {
  source = "./policy"

  policy_name = var.policy_name
  policy_code = var.policy_code
}

module "approle" {
  source = "./approle"
  approle_path = var.approle_path
  role_name = var.role_name
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds = var.max_lease_ttl_seconds
}

module "kv" {
  source = "./kv"
  kv_path = var.kv_path
  secret_path = var.kv_secret_path
  secret_data = var.kv_secret_data
}

/* 
module "k8s" {
  source = "./k8s"

  kubernetes_host = var.kubernetes_host
  kubernetes_ca_cert = var.kubernetes_ca_cert
  token_reviewer_jwt = var.token_reviewer_jwt
  policy_name = var.policy_name
}
*/

module "ldap" {
  source = "./ldap"
  ldap_path = "${var.namespace}/${var.ldap_path}"
  url = var.url
  userdn = var.userdn
  userattr = var.userattr
  upndomain = var.upndomain
  discoverdn = var.discoverdn
  groupdn = var.groupdn
  groupfilter = var.groupfilter
  groupattr = var.groupattr
  binddn = var.binddn
  bindpass = var.bindpass
  #certificate = var.certificate
  #insecure_tls = var.insecure_tls
  #starttls = var.starttls
}
