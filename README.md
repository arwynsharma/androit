# 🛡️ Androit – Android Pentesting Environment Setup Script

**Androit** is a bash script that automates the setup of a powerful Android pentesting environment. It’s designed for penetration testers, security researchers, and mobile app developers working on reverse engineering, dynamic analysis, and runtime instrumentation.

---

## 🚀 Features

This script installs and configures essential Android security testing tools:

### 📱 Android SDK & Debugging

- ✅ Android SDK (platform-tools, build-tools, platform 25)
- ✅ ADB (Android Debug Bridge)
- ✅ pidcat (colored logcat output)

### 🔍 Reverse Engineering Tools

- 🔧 `apktool` – APK decompilation  
- 🔧 `dex2jar` – Convert DEX to JAR  
- 🔧 `enjarify` – DEX to Java JAR translation  
- 🔧 `bytecode-viewer` – GUI for viewing decompiled APKs  
- 🔧 `jd-gui` – Java decompiler  

### 🧪 Binary & Code Analysis

- 🧠 `radare2` – Reverse engineering framework  
- 🧠 `androguard` – Static APK analysis  
- 🧠 `angr` – Symbolic execution framework  

### 🐞 Runtime Instrumentation & Dynamic Tools

- 🕵️ `frida` & `frida-tools` – Dynamic instrumentation  
- 🕵️ `objection` – Frida-based runtime mobile exploration  
- 🕵️ `ab-decrypt` – Android backup decryption  
- 🕵️ `drozer` – Android security assessment tool  
- 🕵️ `AndroBugs Framework` – APK vulnerability scanner  

### 📺 UI & Device Interaction

- 🎮 `scrcpy` – Display/control Android devices over USB  
- 💻 IntelliJ IDEA (Community Edition) – Installed to `/opt/androit/intellij_idea`

### 📦 APK Extraction & Automation

- 📦 `apkx` – Tool to extract and analyze APKs

### 🐋 Static Analysis via MobSF (Docker)

- Automatically installs and configures **Mobile Security Framework (MobSF)** via Docker  
- To run:

  ```bash
  docker run -it --rm -p 8000:8000 opensecurity/mobile-security-framework-mobsf:latest

---

## 📥 Installation

### 1. Clone the repository


```bash
git clone https://github.com/your-username/androit.git
cd androit
```
### 2. Run the setup script
```bash
chmod +x setup.sh
sudo ./setup.sh
```
## 📁 Installed Paths

- Tools and SDKs: `/opt/androit/`  
- IntelliJ IDEA: `/opt/androit/intellij_idea/bin/idea.sh`

---

## 📌 Requirements

- Linux (Ubuntu, Kali, or Debian recommended)
- Internet connection
- Git, Python2/3, pip, Docker (installed or installed via script)

---

## ⚠️ Disclaimer

This tool is for **educational and authorized penetration testing only**.  
Do **not** use it against apps or systems without proper permission.

---

## 🤝 Contributing

Have ideas to improve **Androit**?  
Open an issue or pull request — contributions are welcome!
