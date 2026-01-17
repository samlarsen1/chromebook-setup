#!/bin/bash

# 1. Define paths
BIN_DIR="$HOME/bin"
RC_FILE="$HOME/.bashrc"
PROFILE_FILE="$HOME/.bash_profile"
PATH_LINE='export PATH="$HOME/bin:$PATH"'

# 2. Create the bin directory if it doesn't exist
mkdir -p "$BIN_DIR"

# 3. Add to .bashrc ONLY if it's not already there
if ! grep -Fxq "$PATH_LINE" "$RC_FILE"; then
    echo "Adding $BIN_DIR to $RC_FILE"
    echo -e "\n# Custom local bin\n$PATH_LINE" >> "$RC_FILE"
else
    echo "Path already exists in $RC_FILE, skipping..."
fi

# 4. Ensure .bash_profile sources .bashrc (The Bridge)
BRIDGE_BLOCK=$(cat <<EOF
if [ -f "$RC_FILE" ]; then
    . "$RC_FILE"
fi
EOF
)

if [ -f "$PROFILE_FILE" ]; then
    if ! grep -q "source $RC_FILE" "$PROFILE_FILE" && ! grep -q ". $RC_FILE" "$PROFILE_FILE"; then
        echo "Bridging .bashrc to .bash_profile"
        echo -e "\n$BRIDGE_BLOCK" >> "$PROFILE_FILE"
    fi
else
    # If no profile exists, create it with the bridge
    echo "Creating $PROFILE_FILE with bridge"
    echo "$BRIDGE_BLOCK" > "$PROFILE_FILE"
fi

echo "Setup complete. Please run 'source $RC_FILE' or restart your terminal."