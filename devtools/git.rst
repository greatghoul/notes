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

Tips
---------

在本地删除已经不存在的remote分支
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

在 github pull request 合并后，可以直接删除被合并的 remote 分支，而此时本地仓库中的 remote 分支的引用并没有删除，要与服务器上保持同步，则需要::

    git fetch -p
