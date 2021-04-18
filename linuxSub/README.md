# Windows Subsystem for Linux Setup Instruction
Instructions for running graphical python applications on Windows using WSL2.

### Step 1 (Enable WSL)
1. Go to Control Pannel -> Programs -> Program and Features
2. Enable Windows Subsystem for Linux

### Step 2 (Get a Terminal)
1. Go to Windows app store install Ubuntu Terminal
2. Open the app, simply following their instruction to set it up
3. Run the following

```
sudo apt-get update
```

```
sudo apt-get upgrade
```

### Step 3 (Install Anaconda)
1. Open the Ubuntu Terminal and run the following

```
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh .
```

```
chmod +x Anaconda3-2019.10-Linux-x86_64.sh
```

```
sh ./Anaconda3-2019.10-Linux-x86_64.sh
```

```
export PATH=/home/USER/anaconda3/bin:$PATH
```
2. Restart Terminal


### Step 4 (conda environment)
1. Open the Ubuntu Terminal and run the following
2. Create conda environment with Python (version 3.7)
```
conda create --name python3-env python3.7
```

### Step 5 (X server + adding new rule)
Windows needs a X server to support graphical applications.
1. [Download VcXsrv Windows X Server](https://sourceforge.net/projects/vcxsrv/)
2. Open the app, check "disable access control"
3. Control Panel > System and Security > Windows Defender Firewall > Advanced Settings > Inbound Rules > New Rule... > Program > %ProgramFiles%\VcXsrv\vcxsrv.exe > Allow the connection > checked Domain/Private/Public > Named and Confirmed Rule.
4. See instructions in **x11_setup.sh**. You can run ``` bash x11_setup.sh ``` to export DISPLAY (host ip will change if you login remotely)

5. You can test it with some simple x11 apps, by running the following.

```
sudo apt-get install -y x11-apps
xeyes
```

### Step 6 (sshd conifg, not sure if this help)
1. ```vim /etc/ssh/sshd_config```
  - uncomment X11UseLocalhost yes
  - uncomment X11Forwarding yes
2. Control Panel > System and Security > Windows Defender Firewall > Advanced Settings > Inbound Rules > New Rule... > port > set 22 > Allow the connection > checked Domain/Private/Public > Named and Confirmed Rule.


## Have fun!
