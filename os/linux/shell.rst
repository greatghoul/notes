Shell开发笔记
=================

基础语法
----------

条件判断语法
~~~~~~~~~~~~~

.. code-block:: shell

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

.. code-block:: shell

    if   [ "$1" = "value1" ]; then
        # do something
    fi

判断参数是否为空字符串或者 null

.. code-block:: shell

    if [ -z "$1" ]; then
        # do something
    fi

