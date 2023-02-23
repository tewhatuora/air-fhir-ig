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
3. Install Ruby via rvm
    ```shell
    rvm install 3.1.3
    ```
4. Ensure your terminal profile has `Run command as a login shell` checked
5. Switch to use installed Ruby(restart terminal if you had to enable step 4)
    ```shell
   rvm use 3.1.3
   ```
6. Install OpenSSL(unsure if we need this step)
    ```shell
    gem install openssl
    ```
7. Install Jekyll & Bundler
    ```shell
    gem install jekyll bundler
    ```

### Running the publisher
1. run `_updatePublisher.sh` to get the latest publisher jar 
2. run `build-ig.sh` to generate the IG(artifacts should appear under `output` folder)

