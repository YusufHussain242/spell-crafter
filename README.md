# Setup Instructions

### Step 1
Open the terminal and run
```
git clone git@github.com:YusufHussain242/DungeonDelver.git
```
or
```
git clone https://github.com/YusufHussain242/DungeonDelver.git
```
depending on whether you want to use SSH or HTTP respectively.

### Step 2
Check that you have Git Large File Storage installed by running.
```
git lfs --version
```
If you don't have it installed you can install it at https://git-lfs.com/.

Make sure to run the following to ensure Git LFS is properly configured for your machine.
```
git lfs install
```

### Step 3
In Godot, navigate to Project > Version Control > Version Control Settings and toggle on connect to VCS. Then you can fill out your github details.

If you are using SSH you will need to to provide a path to your public and private keys. See the link below for instructions on how to generate a key pair and link it with GitHub:\
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent.

If you are using HTTPS you need to fill in your username and password.
