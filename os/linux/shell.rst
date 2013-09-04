Shell开发笔记
=================

基础语法
----------

条件判断语法
~~~~~~~~~~~~~

.. code-block:: bash

    if   [ expression1 ]; then
        # ...
    elif [ !expression2 ]; then
        # ...
    else
        # ...
    fi

参数处理
----------

shell 中以 ``$n`` 来接收终端传递的参数，比如 ``$1`` 表示第一个参数

判断参数是否相等

.. code-block:: bash

    if   [ "$1" = "value1" ]; then
        # do something
    fi

判断参数是否为空字符串或者 null

.. code-block:: bash

    if [ -z "$1" ]; then
        # do something
    fi

在 Shell 脚本中使用 cd 命令
----------------------------

在 shell 脚本中执行 cd 命令并不会改变其运行目录，要让 cd 命令生效，因为你的脚本其实运行在一个 subshell 中，
要想让其生效，你可以强制使用当前 shell 运行脚本，像这样 ::

    . yourshellscript

注意 ``.`` 和你的脚本之间有个空格

或者你可以在你的 shell 中定义一个 shell procedure 然后在需要切换路径的命令前调用 ::

    gohome () {
        cd /path/to/your/target
    }

    gohome && tar -zxvf somefile.tar.gz

你也可以在你的 `.bash_profile` 中定义定义 alias 来达到相同的目的 ::

    alias gohome="cd /path/to/your/target"

参考资料： http://stackoverflow.com/questions/255414/why-doesnt-cd-work-in-a-bash-shell-script
