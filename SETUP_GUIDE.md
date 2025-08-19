# Enhanced Neovim Setup Guide

This configuration includes comprehensive AI tools and productivity features for an enhanced development experience.

## 🚀 Features Added

### AI Tools
- **GitHub Copilot** - AI pair programming assistant
- **CopilotChat** - Chat with AI about your code
- **Codeium** - Free AI assistant alternative
- **ChatGPT** - Direct ChatGPT integration
- **Neural** - AI code generation

### Productivity Tools
- **Database Integration** - Connect and query databases
- **REST Client** - Test APIs directly from Neovim
- **Oil.nvim** - Modern file explorer
- **ToggleTerm** - Integrated terminal management
- **Markdown Preview** - Live markdown preview
- **Session Management** - Persistent sessions
- **Code Documentation** - Auto-generate docs
- **Task Runner** - Execute tasks and builds
- **Project Management** - Smart project switching

## 📋 Prerequisites

### Required Dependencies
```bash
# Node.js (for Copilot and other tools)
brew install node

# Python (for various tools)
brew install python3

# Ripgrep (for search functionality)
brew install ripgrep

# Git (for version control features)
brew install git

# Optional but recommended
brew install lazygit      # Git UI
brew install jq           # JSON processing
brew install tidy-html5   # HTML formatting
```

## ⚙️ Setup Instructions

### 1. Environment Variables
Create or update your shell profile (`~/.zshrc`, `~/.bashrc`, etc.):

```bash
# Add to your shell profile
export OPENAI_API_KEY="your-openai-api-key-here"  # Optional: for ChatGPT features
```

### 2. Restart Neovim
```bash
# Restart Neovim to load new configuration
nvim
```

### 3. Install Plugins
In Neovim, run:
```vim
:Lazy sync
```

### 4. Setup GitHub Copilot (if you have access)
```vim
:Copilot auth
```

### 5. Setup Mason Tools
```vim
:Mason
```
Install additional tools as needed.

## 🎯 Key Bindings

### AI Tools
| Key | Description |
|-----|-------------|
| `<C-J>` | Accept Copilot suggestion (Insert mode) |
| `<C-H>` | Previous Copilot suggestion (Insert mode) |
| `<C-L>` | Next Copilot suggestion (Insert mode) |
| `<C-]>` | Dismiss Copilot suggestion (Insert mode) |
| `<leader>cc` | CopilotChat prompt |
| `<leader>ce` | CopilotChat explain code |
| `<leader>ct` | CopilotChat generate tests |
| `<leader>cr` | CopilotChat review code |
| `<leader>gc` | Open ChatGPT |
| `<leader>ge` | ChatGPT edit with instructions |
| `<C-g>` | Accept Codeium suggestion (Insert mode) |

### Copilot Management
| Key | Description |
|-----|-------------|
| `<leader>cpe` | Enable Copilot |
| `<leader>cpd` | Disable Copilot |
| `<leader>cps` | Copilot status |
| `<leader>cpp` | Copilot panel |

### Productivity Tools
| Key | Description |
|-----|-------------|
| `<leader>db` | Toggle Database UI |
| `<leader>rr` | Run REST request |
| `<leader>rp` | Preview REST request |
| `-` | Open parent directory (Oil) |
| `<leader>-` | Open parent directory in float |
| `<C-\>` | Toggle terminal |
| `<leader>tf` | Toggle floating terminal |
| `<leader>th` | Toggle horizontal terminal |
| `<leader>tv` | Toggle vertical terminal |
| `<leader>gg` | Toggle LazyGit |
| `<leader>mp` | Toggle Markdown preview |
| `<leader>qs` | Restore session |
| `<leader>ql` | Restore last session |
| `<leader>fp` | Find projects |

### Documentation
| Key | Description |
|-----|-------------|
| `<leader>nf` | Generate function annotation |
| `<leader>nc` | Generate class annotation |
| `<leader>nt` | Generate type annotation |

### Task Runner
| Key | Description |
|-----|-------------|
| `<leader>oo` | Toggle Overseer |
| `<leader>or` | Run task |
| `<leader>oa` | Task action |

## 🔧 Configuration

### Database Setup
1. Create database connections in the Database UI (`<leader>db`)
2. Add connection strings to your environment or config

### REST Client Usage
1. Create `.http` or `.rest` files
2. Use HTTP syntax to define requests
3. Run with `<leader>rr`

### Example REST file:
```http
GET https://api.github.com/users/octocat
Content-Type: application/json

{
  "key": "value"
}
```

## 🐛 Troubleshooting

### Common Issues

1. **Copilot not working**: Run `:Copilot auth` to authenticate
2. **Missing LSP servers**: Run `:Mason` to install language servers
3. **ChatGPT not working**: Set `OPENAI_API_KEY` environment variable
4. **Terminal issues**: Check if `toggleterm` is properly configured

### Health Check
Run `:checkhealth` to diagnose any issues.

## 📚 Additional Resources

- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)

## 🤝 Support

If you encounter issues:
1. Check the setup requirements
2. Run `:checkhealth`
3. Verify environment variables
4. Restart Neovim after changes

Happy coding! 🎉
