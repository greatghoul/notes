GIT使用笔记
==================

GIT安装
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

GIT配置
--------------

使用 https push 时记密码
~~~~~~~~~~~~~~~~~~~~~~~~~~

近期由于墙的原因，Github 使用 ssh push 时经常卡死，于是为了稳定，只能切换到 https 的方式进行 push，但 https 每次都需要
输入帐户和密码，相当麻烦，为了避免这种情况，需要配置 git 使其记住密码。

**对于 1.7.9 及之后的版本**

:: 

    git config --global credential.helper cache

如何希望加上失效时间，可以这样配置 ::

    git config credential.helper 'cache --timeout=3600'

就可以记住密码一个小时。

**对于 1.7.9 之前的版本**

需要显式的 git 地址中加入用户名和密码，如 ``https://you:password@github.com/you/example.git`` ::

    git config remote.origin.url https://you:password@github.com/you/example.git

参考：http://stackoverflow.com/a/5343146/260793

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

查看当前 Commit 或者最近 Commit 的详细信息，比如 Tag 
------------------------------------------------------

查看当前 Commit 的 Tag 描述信息 ::

    $ # git describe
    V1.8.3

查看更多细节 ::

    $ git log -n 1 --decorate --pretty=oneline
    e92c98e6443b8761291b6c9305688005cb583987 (HEAD, tag: V1.8.3) Merge branch 'devel' of ...

不限制行数 ::

    $ git log --decorate --pretty=oneline
