=================
CoffeeScript笔记
=================

语法技巧
===========

遍历列表并生成新列表
-----------------------

.. code-block:: coffeescript

    formValues = (elem.value for elem in $('.input')) 

回调方法绑定
--------------

.. code-block:: coffeescript

    object = 
      func: -> $('#div').click => @element.css color: 'red'

遍历字典
------------

.. code-block:: coffeescript

    for key, value of myObject
      console.log "#{key}: #{value}"

回调中 -> 和 => 的区别
----------------------

使用 `->` 和 `=>` 回调，其 `@` 的引用是不同的， `->` 时， `@` 指带调用者，而 `=>` 时指代的是 `document`
