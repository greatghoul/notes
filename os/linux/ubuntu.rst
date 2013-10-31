.. _ubuntu:

Ubuntu笔记
===========

疑难杂症
-----------

XUBUNTU下出现WARNING: gnome-keyring的问题
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
编辑文件 ``/etc/xdg/autostart/gnome-keyring-pkcs11.desktop`` 修正下面一行 ::

    OnlyShowIn=GNOME;Unity

为::

    OnlyShowIn=GNOME;Unity;XFCE

系统重启后就正常了，参考资料 `^1 <http://laslow.net/2012/05/06/gnome-keyring-issues-in-ubuntu-12-04/>`_

NO_PUBKEY 16126D3A3E5C1192
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

新安装的系统，在执行 `sudo apt-get update` 结束时，会报如下错误 ::

    W: GPG error: http://extras.ubuntu.com precise Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 16126D3A3E5C1192

要解决这个错误，需要执行如下命令添加 PUBLIC KEY ::

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 16126D3A3E5C1192

参考： http://ubuntuforums.org/showthread.php?t=1589807

制作USB启动盘
~~~~~~~~~~~~~~~~~~~
比如 USB 的设置位置为 `/dev/sdb` 

.. code-block:: bash

    sudo dd if=/path/to/your/iso of=/dev/sdb

.. note:: 这里有个小技巧，先不要插入U盘， 输入 `sudo dd if=/path/to/your/iso of=/dev/sd` 后按 `Tab` 补全，会列出匹配的设备列表，此时插入U盘，再次按 `Tab` 补全，新出来的那个设备就是你的 U 盘了。

参考资料： http://askubuntu.com/questions/59551/how-to-burn-iso-to-usb-device

rpm 包转 deb 包
~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    sudo apt-get install alien
    sudo alien xxx.rpm
    sudo dpkg -i xxx.deb

卸载 Unity 安装 Gnome Shell
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
安装 Gnome Shell，安装时 Display Manager 选择 **lightdm**

.. code-block:: bash

    sudo apt-get install gnome-shell
    sudo apt-get install gnome-themes*
    sudo  /usr/lib/lightdm/lightdm-set-defaults  -s  gnome-shell

安装完成后重新启动，登陆界面选择会话时选择 **Gnome**

.. code-block:: bash

    sudo apt-get -y --auto-remove purge unity
    sudo apt-get -y --auto-remove purge unity-common
    sudo apt-get -y --auto-remove purge unity-lens*
    sudo apt-get -y --auto-remove purge unity-services
    sudo apt-get -y --auto-remove purge unity-asset-pool

参考： http://garfield550.diandian.com/linux/00128

解决 Xfce4 Application Finder 启动缓慢的问题
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
``xfce4-appfinder`` 在启动时非常缓慢，在终端中启动时能看到如下错误信息 ::

    (xfce4-appfinder:4167): xfce4-appfinder-CRITICAL **: Failed to open window: Did not receive a reply. Possible causes include: the remote application did not send a reply, the message bus security policy blocked the reply, the reply timeout expired, or the network connection was broken.

要解决此问题，禁用 appfinder server 就行 ::

    xfce4-appfinder --disable-server

如果要使用类似 Windows ``Win+R`` 的效果，可以运行 ::

    xfce4-appfinder -c --disable-server

参考： http://ubuntuforums.org/showthread.php?t=2031253

中国镜像软件源
-----------------

Ubuntu 13.04 Raring ::

    deb http://mirrors.163.com/ubuntu/ raring main universe restricted multiverse
    deb-src http://mirrors.163.com/ubuntu/ raring main universe restricted multiverse
    deb http://mirrors.163.com/ubuntu/ raring-security universe main multiverse restricted
    deb-src http://mirrors.163.com/ubuntu/ raring-security universe main multiverse restricted
    deb http://mirrors.163.com/ubuntu/ raring-updates universe main multiverse restricted
    deb http://mirrors.163.com/ubuntu/ raring-proposed universe main multiverse restricted
    deb-src http://mirrors.163.com/ubuntu/ raring-proposed universe main multiverse restricted
    deb http://mirrors.163.com/ubuntu/ raring-backports universe main multiverse restricted
    deb-src http://mirrors.163.com/ubuntu/ raring-backports universe main multiverse restricted
    deb-src http://mirrors.163.com/ubuntu/ raring-updates universe main multiverse restricted

Ubuntu 12.04 Precise ::

    deb http://mirrors.163.com/ubuntu/ precise main restricted
    deb-src http://mirrors.163.com/ubuntu/ precise main restricted
    deb http://mirrors.163.com/ubuntu/ precise-updates main restricted
    deb-src http://mirrors.163.com/ubuntu/ precise-updates main restricted
    deb http://mirrors.163.com/ubuntu/ precise universe
    deb-src http://mirrors.163.com/ubuntu/ precise universe
    deb http://mirrors.163.com/ubuntu/ precise-updates universe
    deb-src http://mirrors.163.com/ubuntu/ precise-updates universe
    deb http://mirrors.163.com/ubuntu/ precise multiverse
    deb-src http://mirrors.163.com/ubuntu/ precise multiverse
    deb http://mirrors.163.com/ubuntu/ precise-updates multiverse
    deb-src http://mirrors.163.com/ubuntu/ precise-updates multiverse
    deb http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse
    deb-src http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse
    deb http://mirrors.163.com/ubuntu/ precise-security main restricted
    deb-src http://mirrors.163.com/ubuntu/ precise-security main restricted
    deb http://mirrors.163.com/ubuntu/ precise-security universe
    deb-src http://mirrors.163.com/ubuntu/ precise-security universe
    deb http://mirrors.163.com/ubuntu/ precise-security multiverse
    deb-src http://mirrors.163.com/ubuntu/ precise-security multiverse
    deb http://extras.ubuntu.com/ubuntu precise main
    deb-src http://extras.ubuntu.com/ubuntu precise main

参考资料
------------

- `HOW TO USE MULTIPLE MONITORS IN XUBUNTU / XFCE (EXTENDED DISPLAY INSTEAD OF MIRROR) <http://www.webupd8.org/2012/11/how-to-use-multiple-monitors-in-xubuntu.html>`_