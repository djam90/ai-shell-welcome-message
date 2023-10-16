# Welcome Message Shell Plugin

This shell script displays a welcome message every time a new terminal window is opened. The welcome message is fetched from the OpenAI API.

## Installation for Bash

0. You will need the OPENAI_API_KEY environment variable set for this to work.

1. Clone this repository:
```bash
git clone https://github.com/djam90/ai-shell-welcome-message
```

Source the welcome-message.sh script in your shell's configuration file.

For Bash users, add this line to your .bashrc or .bash_profile (for macOS users) file:

```
source ~/scripts/welcome-message/welcome-message.sh
```

And then source your .bashrc or .bash_profile file:


```
source ~/.bashrc
# or source ~/.bash_profile for macOS users
```

For Zsh users, add this line to your .zshrc file:

```
source ~/scripts/welcome-message/welcome-message.sh
```

And then source your .zshrc file:

```
source ~/.zshrc
```

## Usage

Just open a new terminal window and you'll see the welcome message!

Please note that every time you open a terminal, it will make a HTTP POST request to the API.

