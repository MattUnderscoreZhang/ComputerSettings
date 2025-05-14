#
# Runs for every shell (including non-interactive shells for scripts)
# Run order: .zshenv, .zprofile, .zpreztorc (called via Prezto inside .zprofile), .zshrc
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
