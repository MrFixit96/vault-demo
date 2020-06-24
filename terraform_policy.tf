resource "vault_policy" "terraform" {
  name = "terraform"

  policy = <<EOF
# Manage namespaces
path "sys/namespaces/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage policies
path "sys/policies/acl/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List policies
path "sys/policies/acl" {
   capabilities = ["list"]
}

# Enable Auth management
path "sys/auth" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Enable LDAP Auth mounting
path "sys/auth/${var.ldap_path}" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Enable and manage secrets engines
path "sys/mounts/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# Enable and manage secrets engines
path "sys/mounts" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# Create and manage entities and groups
path "identity/*" {
   capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage tokens
path "auth/token/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}


# Authorize ldap auth configuration
path "auth/${var.ldap_path}/config" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Authorize ldap role management within namespace
path "auth/${var.ldap_path}/role/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Allow TF to operate kv store
path "${var.kv_path}/*" {
   capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOF
}
