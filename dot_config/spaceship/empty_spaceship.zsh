# Prompt order (aws replaced with aws_custom)
SPACESHIP_PROMPT_ORDER=(
  time user dir host git
  aws_custom
  kubectl
  exec_time async line_sep
  jobs exit_code sudo char
)

# time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_SUFFIX="> "
SPACESHIP_TIME_COLOR="white"

# User
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""

# Dir
SPACESHIP_DIR_PREFIX="@"
SPACESHIP_DIR_SUFFIX=" "
SPACESHIP_DIR_TRUNC_REPO=false

# Global defaults
SPACESHIP_PROMPT_DEFAULT_PREFIX=""
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "

# Git
SPACESHIP_GIT_BRANCH_ASYNC=true
SPACESHIP_GIT_PREFIX=""
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_GIT_STATUS_COLOR="green"

# AWS (built-in disabled, custom section used instead)
SPACESHIP_AWS_SHOW=false

# Custom AWS section: show "default" when no profile is set
spaceship_aws_custom() {
  local profile="${AWS_VAULT:-${AWS_PROFILE:-default}}"
  spaceship::section --color "yellow" --prefix "" --suffix " " --symbol "☁️ " "$profile"
}
SPACESHIP_AWS_CUSTOM_ASYNC=true

# GCP
SPACESHIP_GCLOUD_SHOW=false
# SPACESHIP_GCLOUD_ASYNC=true
# SPACESHIP_GCLOUD_PREFIX=""
# SPACESHIP_GCLOUD_SYMBOL="🌐 "
# SPACESHIP_GCLOUD_COLOR="blue"

# Kubernetes
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECTL_CONTEXT_SHOW=true
SPACESHIP_KUBECTL_PREFIX=""
SPACESHIP_KUBECTL_CONTEXT_PREFIX=""
SPACESHIP_KUBECTL_CONTEXT_SYMBOL="⎈ "
SPACESHIP_KUBECTL_CONTEXT_COLOR="cyan"
SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE=true
