# **Dream Game (dream\_game)**

## **1. Project Overview**

**Dream Game (DG)** is a pet project built to practice system analysis, software engineering, and technical English. It is designed as a session-based, turn-based tactical game featuring a compact 8 × 8 grid, in-battle upgrades, global progression, telegraphed deterministic combat rules, and dynamic initiative sequencing.  
The repository is structured as an **npm workspaces monorepo**:

- docs/: Architectural specifications, System Requirements Specifications (SRS), and domain models.

- packages/common/: Pure TypeScript domain contracts, core game state engine, and zero-dependency business logic.

- packages/server/: Backend service handling sessions, room orchestration, and state synchronization.

- packages/client/: Front-end rendering and player interaction adapter layer.

## **2. Host System Prerequisites: VS Code Setup**

> 1. **Install Visual Studio Code:**  
Download and install VS Code on your Windows host machine.

> 2. **Install Required Extensions:**  
Open VS Code (Ctrl + Shift + X) and install:

- **WSL** (ms-vscode-remote.remote-wsl): Enables running VS Code directly inside the Linux environment.

- **ESLint** (dbaeumer.vscode-eslint): Provides real-time code quality and linting.

- **Prettier - Code formatter** (esbenp.prettier-vscode): Automated code formatting.

- **Continue** (Continue.continue): Open-source AI coding assistant.

## **3. Environment Provisioning: WSL (Ubuntu)**

> 1. **Install WSL2 & Ubuntu:**  
Open **PowerShell as Administrator** on Windows and run:  
PowerShell  
wsl --install -d Ubuntu

> Restart your PC if prompted. Set up your primary WSL username and password.  
2. **Run OS Provisioning Script (setup-env.sh):** Execute the environment setup script (stored alongside dream\_game or in your provisioning collection) inside your WSL terminal:  
Bash  
chmod +x setup-env.sh  
./setup-env.sh

> The setup-env.sh script automates system-level dependencies: installing nvm, provisioning Node.js LTS, and configuring gh CLI and global Git credentials.

## **4. Development Workspace & Project Deployment**

> 1. **Initialize & Deploy the Repository:** Navigate into the project directory and run the idempotent project initialization script:  
Bash  
cd ~/projects/dream\_game  
chmod +x setup.sh  
./setup.sh

> The setup.sh script handles repository-level idempotency: self-healing local .git initialization, root package.json setup, npm workspace configuration, and installing root dev dependencies (ESLint, TypeScript).  
2. **Open Workspace in VS Code:** Launch VS Code connected directly to your WSL instance:  
Bash  
code .

> 1. **Verify Setup:** Execute tests across all monorepo packages:  
Bash  
npm run test

