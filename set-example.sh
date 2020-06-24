#!/bin/bash

# Vault Address
#export TF_VAR_vault_address="https://$(get-vault-node):8200
#export VAULT_ADDR="https://$(get-vault-node):8200

# AppRole for Terraform Vault provider authentication
export TF_VAR_app_role_mount_point="approle"
export TF_VAR_role_name="terraform"
export TF_VAR_role_id=""
export TF_VAR_secret_id=""

# Namespace
export TF_VAR_namespace="tf_demo"

# Policy
export TF_VAR_policy_name="k8s"
export TF_VAR_policy_code=$(cat <<EOF
path "kv/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "secret/data/apikey" {
  capabilities = ["read","list"]
}
path "db/creds/dev" {
  capabilities = ["read"]
}
path "pki_int/issue/*" {
  capabilities = ["create", "update"]
}
path "sys/leases/renew" {
  capabilities = ["create"]
}
path "sys/leases/revoke" {
  capabilities = ["update"]
}
path "sys/renew/*" {
  capabilities = ["update"]
}
EOF
)

# KV
export TF_VAR_kv_path="kv_tf_demo"
export TF_VAR_kv_secret_path"demo"
export TF_VAR_kv_secret_data="{\"foo\":\"bar\"}"

# # Kubernetes
# export TF_VAR_k8s_path="k8s"
# export TF_VAR_kubernetes_host=""
# export VAULT_SA_NAME=$(kubectl get sa vault-auth -o jsonpath="{.secrets[*]['name']}")
# export TF_VAR_token_reviewer_jwt=$(kubectl get secret $VAULT_SA_NAME -o jsonpath="{.data.token}" | base64 --decode; echo)
# export TF_VAR_kubernetes_ca_cert=$(kubectl get secret $VAULT_SA_NAME -o jsonpath="{.data['ca\.crt']}" | base64 --decode; echo)

# LDAP
export TF_VAR_ldap_path="ldap_tf_demo"
export TF_VAR_url="ldap://ldap.forumsys.com"
export TF_VAR_userattr="uid"
export TF_VAR_userdn="dc=example,dc=com"
export TF_VAR_groupdn="dc=example,dc=com"
export TF_VAR_groupfilter="(objectClass=groupOfUniqueNames)"
export TF_VAR_groupattr="uniqueMember"
export TF_VAR_binddn="cn=read-only-admin,dc=example,dc=com"
export TF_VAR_bindpass="password"
export TF_VAR_certificate=""
export TF_VAR_insecure_tls=true
export TF_VAR_starttls=true

#pki

export TF_VAR_pki_max_lease_ttl_seconds="86400"
export TF_VAR_pki_default_lease_ttl_seconds="3600"
export TF_VAR_pki_pem_bundle=""
export TF_VAR_pki_issuing_certificates=""
export TF_VAR_pki_role_name="tf_demo_pki"
