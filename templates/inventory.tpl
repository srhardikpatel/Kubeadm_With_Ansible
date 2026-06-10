[all:vars]

ansible_python_interpreter=/usr/bin/python3
ansible_host_key_checking=false

[servers]
%{ for name, inst in master ~}
ansible_host=${inst.public_ip} ansible_user=${inst.user}
%{ endfor ~}

%{ for name, inst in worker ~}
ansible_host=${inst.public_ip} ansible_user=${inst.user}
%{ endfor ~}
