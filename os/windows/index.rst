.. _os_windows_index:

Windows笔记
==================

.. toctree::

   bat

疑难杂症
--------------

XP下CMD窗口无法切换输入法
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

一般是因为 conime 被关闭了，将 `HKEY_CURRENT_USER\Console\LoadConIme` 的值设置为 `1` ，然后新开一个 CMD 窗口，就可以使用输出法了。

参考：http://hi.baidu.com/xhhfpctztqehkwe/item/31c65f150b932dea9813d68b