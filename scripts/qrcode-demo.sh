#!/bin/bash
#
# Author:   James Anderton <janderton@hashicorp.com>
# Date:     Jul-25-2020
# Purpose:  A Demo Script for copying a image to my bastion, encoding it and uploading it to vault, then reading it back and decoding it
#
# REQUIRED: - Assumes you already have an ssh key added to the ssh-agent
#           $1 = image to upload
#           $2 = Vault cluster IP
#           $3 = Previously created Vault Auth Token
# OPTIONAL  $4 = Bastion Host IP

# set locals
export send_img=$1
export BASTION_IP=$4

# upload environment variables to use when we ssh
cat <<EOF> sshenv
export send_img=$1
export VAULT_ADDR=$2
export VAULT_TOKEN=$3
export VAULT_SKIP_VERIFY=true
export BASTION_IP=$4
EOF

scp sshenv $BASTION_IP:/home/janderton/.ssh/environment

if [[ ! -z $BASTION_IP ]];then
  # upload the file and login to the bastion host
  scp ${send_img} $BASTION_IP:~/${send_img}
  
  # base64 encode the image
  ssh -A $BASTION_IP "source ~/.ssh/environment && base64 -i < ${send_img} > ${send_img}.enc"
  
  # You can just read-in the base64 encoded image to a vault kv put
  ssh -A $BASTION_IP "source ~/.ssh/environment && cat ${send_img}.enc |vault kv put secret/qrcode barcode=-"

  # You could also encapsulate it in a payload file and pass that to vault kv put
  ssh -A $BASTION_IP "source ~/.ssh/environment && vault kv put kv/qrcode barcode=@${send_img}.enc"

  ssh -A $BASTION_IP "source ~/.ssh/environment && vault kv get -format json secret/qrcode | jq -r .data.data.barcode | base64 -d > new-${send_img}"
  ssh -A $BASTION_IP "source ~/.ssh/environment && vault kv get -format json kv/qrcode |jq -r .data.data.barcode  | base64 -d > new2-${send_img}"

  # Send the files back to us
  scp  $BASTION_IP:new-${send_img} new-${send_img}
  scp  $BASTION_IP:new2-${send_img} new2-${send_img}

else
  base64 -i < ${send_img} > ${send_img}.enc
  vault kv put secret/qrcode barcode=- < ${send_img}.enc
  vault kv get -format json secret/qrcode | jq -r .data.data.barcode | base64 -d > new-${send_img}
  scp  $BASTION_IP:new-${send_img} new-${send_img}
fi # ENDIF
