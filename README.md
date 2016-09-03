# Ubuntu Post Install Script
This project provides a set of shell scripts to be run after a fresh install of an Ubuntu(-based) OS. It will install your favourite applications, set your preferred settings, etc.

## Thanks
Thanks to [Sam Hewitt] (https://github.com/snwh) for the script [based](https://github.com/snwh/ubuntu-post-install).

##Structure

## Usage
Run in the console for install tool Git:

Optionally, you can add a third-party repository `sudo add-apt-repository ppa:git-core/ppa` to install a newer version

    sudo apt-get update
    sudo apt-get install git

Run in the console:

    git clone https://github.com/igor-dyatlov/ubuntu-post-install-script.git

Alternatively you can [download](https://github.com/igor-dyatlov/ubuntu-post-install-script/archive/master.zip) this repository.

Run from source folder:

    ./start.sh

## Note
The included [preferences](functions/configure) and [lists of packages](data) are those of the original author, you will have to change them to suit yourself.

### Features
 - Update system [update](functions/update)
 - Cleaning system [cleanup](functions/cleanup)
 - Configure system [configure](functions/configure)
 - Upgrading the kernel [kernel](functions/kernel)
 - Install the program in two steps [lists of packages](data)
 - Speed Up system [speedup](functions/speedup)

## Screenshots
<img src=".github/img/Screenshot-1.png" width="35%"/>
<img src=".github/img/Screenshot-2.png" width="35%"/>
<img src=".github/img/Screenshot-3.png" width="35%"/>
<img src=".github/img/Screenshot-4.png" width="35%"/>
<img src=".github/img/Screenshot-5.png" width="35%"/>
<img src=".github/img/Screenshot-6.png" width="35%"/>
<img src=".github/img/Screenshot-7.png" width="35%"/>

### Donation
https://www.paypal.me/IgorDyatlov

### License
All files in this project are under the [LICENSE.md](LICENSE.md) license unless otherwise stated in the file or by a dependency's license file.
