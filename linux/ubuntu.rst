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
