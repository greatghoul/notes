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
