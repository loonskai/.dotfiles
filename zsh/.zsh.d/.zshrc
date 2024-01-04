# Stow zsh directorty and put this into your main ~/.zshrc
# source "$HOME/.zsh.d/.zshrc"

export PATH=$PATH:/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin:/usr/local/go/bin:/.npm-global/bin:$HOME/.cargo/bin:$HOME/.local/bin

# Rust & Cargo
export CARGO_HOME=$HOME/.cargo

# Node.js & nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
