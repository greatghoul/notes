jQuery开发笔记
======================

jQuery 核心库
-------------

事件绑定
^^^^^^^^

jQuery 省内存的事件绑定
"""""""""""""""""""""""""""

比如说有 HTML 结构如下

.. code-block:: html

    <div class="action-box" data-name="box1">
        <a class="btn-delete" href="javascript:;">Delete1</a> | 
        <a class="btn-edit" href="javascript:;">Edit1</a>
    </div>

    <div class="action-box" data-name="box2">
        <a class="btn-delete" href="javascript:;">Delete2</a> | 
        <a class="btn-edit" href="javascript:;">Edit2</a>
    </div>

需要为 btn-delete 绑定事件，并且使用冒泡法来节省内在，优化代码，一个不错的绑定方式如下：

.. code-block:: jquery

    $('.action-box').on('click', '.btn-delete', delete_handler)
                    .on('click', '.btn-edit',   edit_hander);


jQuery 插件
-----------

.. toctree::
   :maxdepth: 1

   jquery-qtip2
