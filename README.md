# setup

a lot of the applications, command line tools etc can be automagically installed by running the commands in `setup.sh`

### non-scriptable installs

- Adobe CC
  - download the creative cloud desktop app then that can install each program
  - disable at login via: http://apple.stackexchange.com/questions/138941/how-do-i-stop-the-adobe-creative-cloud-app-from-auto-launching-on-login
- MS office
  - can deactivate previous installs (allowed 2) via website
- papers3 http://papersapp.com/mac/
- Mail settings

### set up github ssh
 - user.name etc already set up via `setup.sh`
 - make ssh key `ssh-keygen -t rsa -b 4096 -C "jh22@sanger.ac.uk"`
 - add to ssh-agent + keychain via `ssh-add -K ~/.ssh/github`
 - add to github https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/
 - test via `ssh -vT git@github.com`

### OS-X things
 - System Preferences, Mission Control, uncheck "Automatically rearrange spaces..."
 - System Preferences -> Screensaver -> Hotcorners
