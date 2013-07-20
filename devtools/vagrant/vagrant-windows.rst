.. _vagrant_windows:

在 Windows 中使用 Vagrant
============================

安装 Vagrant
-------------------

从 Vagrant 官网下载最新的 Vagrant 和对应的 VirtualBox 安装后，新建一个文件夹用来配置 Vagrant

因为使用 ``vagrant init precise32 http://files.vagrantup.com/precise32.box`` 命令下载 box 会比较慢，
所以最好是提前使用迅雷等工具下载好 box 放在一个文件中，然后初始化时使用本地路径，会快很多。

.. code-block:: bat

    vagrant init precise32 ..\boxes\precise32.box

需要注意的是，这里使用本地路径时，需要使用 Windows 风格的路径，即用 ``\`` 来作为路径分隔符。

端口转发
------------

Vagrant 中配置端口转发非常方便

.. code-block:: ruby

    Vagrant.configure("2") do |config|
      # other config here

      config.vm.network :forwarded_port, guest: 80, host: 8080
    end

上面的配置会将 Vagrant 中的 80 端口和你本机的 8080 端口建立转发关系，这样你在本机访问 http://localhost:8080 
就相当于访问 Vagrant 中的 http://localhost:80 了。

**端口转发可以配置多组。**

共享文件夹
------------

使用 Vagrant 有一个非常重要的一步就是共享文件夹（得益于强大的 VirtualBox）

在 ``Vagrantfile`` 中设置

.. code-block:: ruby

  config.vm.synced_folder "E:/Blog", "/home/vagrant/Blog"

其中第一个参数 ``E:/Blog`` 为本机上需要共享的文件夹路径，第二个参数为 Vagrant 虚拟机中的映射路径，注意第二个参数需要
使用绝对路径，如 ``/home/vagrant/Blog``

连接至 Vagrant
----------------

配置好后，就可以启动虚拟机并连接到 Vagrant 了。

首先，执行 ``vagrant up`` ，等待片刻，vagrant 就启动好了。 ::

    e:\Vagrant\precise32>vagrant reload
    [default] Attempting graceful shutdown of VM...
    [default] Setting the name of the VM...
    [default] Clearing any previously set forwarded ports...
    [default] Creating shared folders metadata...
    [default] Clearing any previously set network interfaces...
    [default] Preparing network interfaces based on configuration...
    [default] Forwarding ports...
    [default] -- 22 => 2222 (adapter 1)
    [default] -- 5000 => 5000 (adapter 1)
    [default] -- 3000 => 3000 (adapter 1)
    [default] Booting VM...
    [default] Waiting for VM to boot. This can take a few minutes.
    [default] VM booted and ready for use!
    [default] Configuring and enabling network interfaces...
    [default] Mounting shared folders...
    [default] -- /vagrant
    [default] -- /home/vagrant/Blog
    [default] -- /home/vagrant/Notes
    [default] -- /home/vagrant/Projects

如果你 ``vagrant up`` 后又修改了 Vagrantfile，要使之生效，需要执行 ``vagrant reload``

在 Windows 下，不能使用 ``vagrant ssh`` 来直接访问 vagrnat，不过该命令会告诉你如何通过 ssh 连接 vagrant ::

    e:\Vagrant\precise32>vagrant ssh
    `ssh` executable not found in any directories in the %PATH% variable. Is an
    SSH client installed? Try installing Cygwin, MinGW or Git, all of which
    contain an SSH client. Or use the PuTTY SSH client with the following
    authentication information shown below:

    Host: 127.0.0.1
    Port: 2222
    Username: vagrant
    Private key: C:/Documents and Settings/greatghoul/.vagrant.d/insecure_private_key

这样你就可以使用类似 putty 的 ssh 客户端来访问 vagrant 来进行开发了，这里极力推荐 Chrome 扩展 `Secure Shell`_

.. _Secure Shell: https://chrome.google.com/webstore/detail/pnhechapfaindjhompbnflcldabbghjo?utm_source=chrome-ntp-launcher

Windows下安装Chef
------------------

下载地址： http://www.opscode.com/blog/2011/12/15/chef-client-installer-for-windows/
常用的 Cookbooks:  http://community.opscode.com/cookbooks

