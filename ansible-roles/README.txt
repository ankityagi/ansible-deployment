# Ansible 

The following repository contains common and reusable Ansible roles.

## About  

Ansible is an open-source software platform for configuring and managing computers, or hosts.  

Links:

* [Ansible Wikipedia entry][ref-wikipedia]
* [Ansible homepage][ref-homepage]

Please follow the Ansible [best practices][ref-best-practices].

## Roles 

Ansible uses *roles* as an abstraction for reusable tasks. The following repository contains common and reusable roles. For Ansible to be aware of them, the Ansible configuration file must contain the `roles_path` variable pointing to this repository: 

    [defaults]
    roles_path=~/dev/git/ansible

The following locations are searched for the [configuration][ref-configuration] file: 

* ANSIBLE_CONFIG (an environment variable)
* ansible.cfg (in the current directory)
* .ansible.cfg (in the home directory)
* /etc/ansible/ansible.cfg

The first configuration file that is found is used, so configuration files are not merged. 

[ref-wikipedia]: http://en.wikipedia.org/wiki/Ansible_(software) "Ansible_(software)"
[ref-homepage]: http://www.ansible.com/ "Ansible"
[ref-best-practices]: http://docs.ansible.com/playbooks_best_practices.html "Ansible Best Practices"
[ref-configuration]: http://docs.ansible.com/intro_configuration.html "Ansible configuration"
