vault {
  address = "https://vault.timbrook.tech"
  ssl {
    enabled = true
    verify = true 
  }
  vault_agent_token_file = "/var/run/secrets/.vault-token"
  renew_token = true
}

consul {
  address = "https://consul.timbrook.tech"
}

###
# Application Templates live here 
#

template {
    // destination = "/etc/postgrest.conf"
    destination = "./postgrest.conf"
    source = "./conf/template/postgrest.conf"
    error_on_missing_key = true
}

exec {
  command = "cat ./postgrest.conf"
  splay = "2s"

  env {
    pristine = false
  }
  reload_signal = "SIGUSR1"
  kill_signal = "SIGINT"
  kill_timeout = "2s"
}