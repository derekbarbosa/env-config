#sets 'r' key to reload or "source" the configuration file for on-the-fly edits

bind r source-file ~/.tmux.conf

set -g default-terminal "screen-256color"

set -g status-bg black
set -g status-fg white

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

#Plugin: Dracual Theme for TMUX
set -g @plugin 'dracula/tmux'
set -g @dracula-show-battery false
set -g @dracula-show-network false
set -g @dracula-show-left-icon session
  
# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
