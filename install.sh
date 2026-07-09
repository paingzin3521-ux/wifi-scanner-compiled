#!/data/data/com.termux/files/usr/bin/bash

# Termux Robust Installer for WiFi Scanner
echo -e "\033[96m[*] Starting Robust Installation...\033[0m"

# Fix potential mirror issues
echo "[*] Configuring repositories..."
termux-change-repo -s main 2>/dev/null || true

# Update and install core dependencies
echo "[*] Installing core tools..."
pkg update -y || true
pkg install python clang make python-dev libcrypt git curl -y

# Install Python dependencies
echo "[*] Installing Python libraries..."
pip install --upgrade pip
pip install aiohttp pycryptodome

# Clone or update the repository
echo "[*] Downloading WiFi Scanner Tool..."
if [ -d "$HOME/wifi-scanner-compiled" ]; then
    cd $HOME/wifi-scanner-compiled
    git pull origin main
else
    git clone https://github.com/paingzin3521-ux/wifi-scanner-compiled.git $HOME/wifi-scanner-compiled
fi

# Setting up the shortcut
echo "[*] Setting up 'wifi' shortcut..."
BIN_DIR="/data/data/com.termux/files/usr/bin"
BIN_FILE="$BIN_DIR/wifi"

cat <<EOF > $BIN_FILE
#!/data/data/com.termux/files/usr/bin/bash
cd $HOME/wifi-scanner-compiled
python wifi.py
EOF

chmod +x $BIN_FILE

echo -e "\n\033[92m[✔] Installation Complete!\033[0m"
echo -e "\033[96m[*] You can now run the tool by typing: \033[93mwifi\033[0m"

# Execute the tool immediately
echo "[*] Launching tool..."
wifi
