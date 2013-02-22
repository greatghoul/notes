Rails技巧
=============

create 和 new 创建对象的区别
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

new 只负责创建对象，如果需要调用 save 方法才能持久化到数据库，而 create 直接完成了这两步

redirect 时传递 flash 信息
~~~~~~~~~~~~~~~~~~~~~~~~~~~

跳转时对于 success 类型的 flash 信息，不会传递，需要强制使用

.. code-block:: ruby

    edirect_to user_path(@user), :flash => { :success => "Message" } 

返回页面不继承layout
~~~~~~~~~~~~~~~~~~~~~~~

用户于 ajax 载入页面的场景，比如 ``jquery.load``

.. code-block:: ruby

    format.html { render '_form', :layout => false }      

collection_select 设置 html_options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: ruby
    
    collection_select(:user, :title, UserTitle.all, :id, :name, {}, {:class=>'my-custom-class'})
    collection_select(:user, :title, UserTitle.all, :id, :name, {:prompt=>true}, {:class=>'my-custom-class'})

Action 跳转回之前页面
~~~~~~~~~~~~~~~~~~~~~~~~~

Rails 对于跳转回之前页面这样的操作做了非常方便的支持

.. code-block:: ruby

    def toggle
      # ...
      redirect_to :back
    end

参考资料： http://stackoverflow.com/questions/1947578/how-do-i-set-the-html-options-for-collection-select-in-rails
