# WiFi Scanner (Termux Version)

This is a compiled version of the WiFi Scanner for enhanced security.

## 🛠 Termux Installation & Setup

To run this on Termux, you need to compile it locally because `.so` files are architecture-dependent.

### 1. Install Dependencies
Open Termux and run:
```bash
pkg update && pkg upgrade
pkg install python clang make python-dev libcrypt
pip install aiohttp pycryptodome cython
```

### 2. Clone the Repository
```bash
git clone https://github.com/paingzin3521-ux/wifi-scanner-compiled.git
cd wifi-scanner-compiled
```

### 3. Compile locally (Required for Termux)
Since the uploaded `wifi.so` is for PC, you must compile it on your phone:
```bash
# Rename or remove the existing PC version
mv wifi.so wifi_pc.so

# Create setup.py (if not present)
cat <<EOF > setup.py
from setuptools import setup
from Cython.Build import cythonize
setup(ext_modules = cythonize("wifi.py", compiler_directives={'language_level': "3"}))
EOF

# Compile
python setup.py build_ext --inplace
```

### 4. Run the Tool
```bash
python main.py
```

## 🔐 Security
The source code `wifi.py` is provided for local compilation. After you compile it into `wifi.so`, you can delete `wifi.py` to keep your code hidden from others who use your phone.

---
**Note:** If you want to share the tool without showing the code, only share the `wifi.so` file generated on your Termux.
