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
