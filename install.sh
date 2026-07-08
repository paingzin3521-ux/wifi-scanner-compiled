#!/data/data/com.termux/files/usr/bin/bash

echo "[*] Updating Termux packages..."
pkg update && pkg upgrade -y
pkg install python git -y

echo "[*] Installing Python dependencies..."
pip install aiohttp pycryptodome

echo "[*] Downloading WiFi Scanner Tool..."
rm -rf $HOME/wifi-scanner-compiled
git clone https://github.com/paingzin3521-ux/wifi-scanner-compiled.git $HOME/wifi-scanner-compiled

echo "[*] Setting up 'wifi' shortcut..."
# Overwrite any existing wifi command
BIN_PATH="/data/data/com.termux/files/usr/bin/wifi"
cat <<EOF > $BIN_PATH
#!/data/data/com.termux/files/usr/bin/bash
cd $HOME/wifi-scanner-compiled
python wifi.py
EOF

chmod +x $BIN_PATH

echo -e "\n\033[92m[✔] Installation Complete!\033[0m"
echo -e "\033[96m[*] You can now run the tool by typing: \033[93mwifi\033[0m"

# Run the tool for the first time
wifi
