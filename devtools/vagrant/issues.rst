.. _vagrant_issues:

常见问题列表
=================

Waiting for VM to boot. This can take a few minutes.
--------------------------------------------------------

Vagrant 启动时一直卡在 ::

    Waiting for VM to boot. This can take a few minutes.

**解决方法：**

使用 VirtualBox 通过 GUI 启动虚拟机，登陆系统后执行下面的操作。 ::

    sudo rm -Rf /var/lib/dhcp/*

然后关闭虚拟机，通过 ``vagrant up`` 启动系统。

参考 Wiki_ 

.. _Wiki: https://github.com/mitchellh/vagrant/wiki/%60vagrant-up%60-hangs-at-%22Waiting-for-VM-to-boot.-This-can-take-a-few-minutes%22
