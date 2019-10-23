vault {
  renew_token = true
  vault_agent_token_file = "/home/vault/.vault-token"
  retry {
    backoff = "1s"
  }
}

template {
  destination = "/etc/configs/dynamic/shhhh"
  contents = <<EOH
{{- with secret "secret/postgrest/test" }}
db-uri  = "{{.Data.db_string_pls_delete_and_use_backend}}"{{ end }}
db-schema = "public"
db-anon-role = "anonymous"
server-host	= "0.0.0.0"
{{- with secret "secret/api/jwt_secret" }}
jwt-secret = "{{.Data.token}}"{{ end }}
  EOH
}