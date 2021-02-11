# README @ grzechowski/dockerization

Quick local development tools based on bash, docker and docker-compose

## Docker toolkit installation/update

Just follow [REQUIRE](REQUIRE.md)

## Base usage

  ```
  $ ./console.sh
  ```

  and it should be more or less self-explanatory. Some examples are available with

  ```
  $ ./console.sh examples
  ```

## Latest set of projects configured in dockerization

  ```
  $ ./console.sh l

  List of available projects:

          dev/mail
    [b]   dev/project

    [b] - project build use settings

  ```

build settings are located in dockers/[env-name]/[project-name]/docker/.settings
default build settings are located in dockers/[env-name]/[project-name]/docker/.settings-default

## Setting up dev/ projects

First you need to configure dev/ projects hosts on your local Linux host.

 ```
 $ sudo su -
 # cat dockers/dev/hostnames-dockers >> /etc/hosts
 # exit
 ```

Please check if you do not have a local network conflict in regards to IP range

## Linking and build

projects may require your local git code repository as these setups are for project developers

```
$ ./console.sh l

List of available projects:

        dev/mail
  [b]   dev/project

  [b] - project build use settings

$ ./console link project PATH-TO-PROJECT-CODE-REPO
$ ./console b,u mail,project

```

An example for project linking with repo and building and upping (b,u) of all elements (mail,project)
