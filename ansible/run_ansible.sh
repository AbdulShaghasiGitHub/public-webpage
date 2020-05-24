#!/bin/bash
set +ex

# get the private key and chmod to 700
cat ~/.ssh/id_rsa_abdulshaghasigithub > ../keys/ec2-key
chmod 700 ../keys/ec2-key

# todo genereate inventory.yml file with ec2 host
echo "all:" > inventory.yml
echo " hosts:" >> inventory.yml
echo "    \"$(cd ../infra && terraform output instance_public_ip)\":" >> inventory.yml

# zip app and ready to move to ec2
zip -r app.zip ../app

# todo add any additional variables
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.yml -e 'record_host_keys=True' -u ec2-user --private-key ../keys/ec2-key playbook.yml