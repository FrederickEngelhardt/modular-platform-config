export GIT_GLOBAL_USER=""
export GIT_GLOBAL_USER_EMAIL=""
export GIT_GLOBAL_USER_COMPANY_EMAIL=""
export ZSH_BACKUP_FILE_PREFIX_NAME=".zshrc_pre_modular_platform_config"
# The overrideFile is used to override any local variables
overrideFile="$MPC_ZSH_CONSTANTS/user-variables.local.zsh"
[[ -f $overrideFile ]] && source $overrideFile
