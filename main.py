import sys
import os

try:
    import wifi
except ImportError:
    print("❌ Error: wifi module not found or not compiled.")
    print("Please run the compilation steps first.")
    sys.exit(1)

if __name__ == "__main__":
    import asyncio
    try:
        asyncio.run(wifi.main())
    except KeyboardInterrupt:
        print("\n⚠ Stopped by user.")
    except Exception as e:
        print(f"\n❌ Error: {e}")
