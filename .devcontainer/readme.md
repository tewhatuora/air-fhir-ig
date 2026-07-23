## devcontainer local

With Visual Studio Code install the addon `Dev containers` and then you can open in container

The container has the build chain so you don't need to install all the dependancies on local.


### notes
you need to "docker" log into the registry.gitlab.com first

echo "<your token>" | docker login registry.gitlab.com -u <user> --password-stdin

just from the command prompt - Docker then stores it in its config
