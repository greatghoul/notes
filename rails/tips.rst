Rails技巧
=============

create 和 new 创建对象的区别
----------------------------

new 只负责创建对象，如果需要调用 save 方法才能持久化到数据库，而 create 直接完成了这两步

redirect 时传递 flash 信息
------------------------------

跳转时对于 success 类型的 flash 信息，不会传递，需要强制使用

.. code-block:: ruby

    edirect_to user_path(@user), :flash => { :success => "Message" } 

返回页面不继承layout
----------------------

用户于 ajax 载入页面的场景，比如 ``jquery.load``

.. code-block:: ruby

    format.html { render '_form', :layout => false }      
