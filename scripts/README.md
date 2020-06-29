# QR Code Demo

## Purpose:
    A Demo Script for copying a image to a host with the Hashicorp Vault binary, encoding it and uploading it to vault, then reading it back and decoding it and creating a new image file.

## REQUIRED:
    - Assumes you already have an ssh key added to the ssh-agent
    - $1 = image to upload
    - $2 = Vault cluster IP
    - $3 = Previously created Vault Auth Token

## OPTIONAL:
    - $4 = Bastion Host IP

