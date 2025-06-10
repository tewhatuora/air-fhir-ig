# Summary
This project defines the FHIR Implementation Guide for AIR using FHIR Shorthand(FSH) files. 

The output of this project is a FHIR Implementation Guide(IG) that can be used throughout other projects.

# How to publish an IG

## Prerequisite
You will need to install Ruby and some gems in order to run the publisher to generate an IG.

### Installing Ruby & gems
In order to install Ruby, I would suggest that you use the Ruby Version Manager(rvm) as this will make maintaining versions and gems easier.

1. First import a bunch of keys for checksum checking:
    ```shell
    curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
    ```
2. Download & install rvm(restart terminal session after install)
    ```shell
    curl -sSL https://get.rvm.io | bash -s stable
    ```
3. Download required packages via rvm
    ```shell
    rvm requirements run
    ```
    Note - this may fail due to a yum repo connection timeout error in which case you can find, in the output log file, the yum command that was used and the required packages, and run that command outside of rvm with the appropriate flag to pick up the proxy environment variables, e.g:
    ```shell
    sudo -E yum install -y autoconf automake bison libffi-devel libtool readline-devel ruby sqlite-devel zlib-devel libyaml-devel openssl-devel
    ```
4. Install Ruby via rvm
    ```shell
    rvm install 3.1.3
    ```
5. Ensure your terminal profile has `Run command as a login shell` checked
6. Switch to use installed Ruby(restart terminal if you had to enable step 4)
    ```shell
   rvm use 3.1.3
   ```
7. Install Jekyll & Bundler
    ```shell
    gem install jekyll bundler
    ```
8. Install sushi
    ```shell
    npm install -g sushi
    ```
### Running the publisher and generate the IG
1. run `_updatePublisher.sh` to get the latest publisher jar 
2. run `build-ig.sh` to generate the IG(artifacts should appear under `output` folder)

