# Packer - CentOS 7 Edelia build box for AWS

**Current CentOS Version Used**: 7.3

This example build configuration installs and configures CentOS 7 x86_64 for:

  - VirtualBox

It also creates images for :

  - Amazon-AWS

For the cloud providers, you will need to provision environment variables for
the cloud access credentials, see `edelia.json` at the root of the repo.

## Requirements

The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/)
  - [Ansible](http://docs.ansible.com/intro_installation.html)

## Assets

The image is provisioned with Packer, using a centos7 base image and an Ansible role. The role is on Ansible-Galaxy.

## Usage

Make sure all the required software (listed above) is installed, then cd to the directory containing this README.md file, and run:

    $ packer build edelia.json

After a few minutes, Packer should tell you the box was generated successfully.

For building with AWS, you'll need to set the same environment variables that
are read by the [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.tml#cli-environment), namely:

    AWS_ACCESS_KEY_ID

    AWS_SECRET_ACCESS_KEY

    $ packer build --only=virtualbox-iso edelia.json

    $ packer build --only=amazon-ebs edelia.json
