use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :microblog, MicroblogWeb.Endpoint,
  secret_key_base: "qbgwxBGL+QvuoEORITX8W0IMQy+a7ZAaH1d1jrO9ItsR6qEeBKxDCGdbQGe6geqe"

# Configure your database
config :microblog, Microblog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "microblog",
  password: "yolei4ieThee",
  database: "microblog_prod",
  pool_size: 15
