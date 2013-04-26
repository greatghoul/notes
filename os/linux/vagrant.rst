Vagrant 笔记
===================

Tips & Ticks
------------

在 Windows 下建立与 Vagrant 的共享文件夹
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

在 ``Vagrantfile`` 中设置

.. code-block:: ruby

    config.vm.share_folder "v-data", "Blog", "E:/Blog"

其中第二个参数 ``Blog`` 将映射为 ``~/Blog`` 即 ``/home/vagrant/Blog``,
第三个参数为 Windows 上要共享的文件夹路径

Windows下安装Chef
~~~~~~~~~~~~~~~~~

下载地址： http://www.opscode.com/blog/2011/12/15/chef-client-installer-for-windows/
常用的 Cookbooks:  http://community.opscode.com/cookbooks
