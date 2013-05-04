GIT笔记
==================

安装GIT
-----------

在CentOS中安装GIT
~~~~~~~~~~~~~~~~~~~~

安装依赖包::

    yum install curl
    yum install curl-devel
    yum install zlib-devel
    yum install openssl-devel
    yum install perl-devel
    yum install perl
    yum install cpio
    yum install expat-devel
    yum install gettext-devel

下载安装最新的git包::

    wget http://www.codemonkey.org.uk/projects/git-snapshots/git/git-latest.tar.gz
    tar xzvf git-latest.tar.gz
    cd git-2011-11-30 ＃你的目录可能不是这个
    autoconf
    ./configure
    make
    sudo make install

Tips & Ticks
------------

在本地删除已经不存在的remote分支
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

在 github pull request 合并后，可以直接删除被合并的 remote 分支，而此时本地仓库中的 remote 分支的引用并没有删除，要与服务器上保持同步，则需要::

    git fetch -p

添加 submodule 中途中断后的修复方法
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

我朝访问 github 时不时会出现 clone 进度卡住走不动的时候，如果是正在添加 submodule ，此时不得不 ``Ctrl+C`` 打断。
但再次添加时会报以下错误 ::

    fatal: You are on a branch yet to be born
    Unable to checkout submodule 'bundle/html5'

这样我们就无法再次添加 submodule 了，修复的方法也简单，只有在 ``.git/modules`` 下面手动删除相关目录即可。

参考： http://stackoverflow.com/a/12072517/260793
