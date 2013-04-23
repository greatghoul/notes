Tips
=============

建立 rails 应用时不生成数据库
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    rails new jqmodal-demo --skip-bundle --skip-activerecord

the following must be in application.rb:

.. code-block:: ruby

    require "action_controller/railtie"
    require "action_mailer/railtie"
    require "active_resource/railtie"
    require "rails/test_unit/railtie"

Instead of

.. code-block:: ruby

    require 'rails/all'

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

参考资料： http://stackoverflow.com/questions/1947578/how-do-i-set-the-html-options-for-collection-select-in-rails

Action 跳转回之前页面
~~~~~~~~~~~~~~~~~~~~~~~~~

Rails 对于跳转回之前页面这样的操作做了非常方便的支持

.. code-block:: ruby

    def toggle
      # ...
      redirect_to :back
    end

在可能为空的对象上安全的调用方法
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

我们可能需要在一个对象上调用方法，但不能提前预知该对象是否是 `nil` ，ruby 为我们提供了非常安全的调用方法。

.. code-block:: ruby

    obj.try(:method_name)

如何，只会在 `obj` 不是 `nil` 的情况下去调用 `method_name` 方法，它等价于

.. code-block:: ruby

    obj.nil? ? nil : obj.method_name

参考资料： http://stackoverflow.com/a/9595649/260793


设置 rails 日志格式
~~~~~~~~~~~~~~~~~~~~~~~

`config\enviroment.rb`

.. code-block:: ruby

    class Logger
      def format_message(level, time, progname, msg)
        "#{time.to_s(:db)} #{level} -- #{msg}\n"
      end
    end

使用rails缓存
~~~~~~~~~~~~~~~

development默认禁用缓存，修改 ``config/enviroments/development.rb`` 启用 

.. code-block:: ruby

    config.action_controller.perform_caching = true

3种基本操作

 * 读 ``Rails.cache.write 'foo', 'bar'``
 * 写 ``Rails.cache.read 'foo'``
 * 不存在则写，存在则读 ``Rails.cache.fetch 'a_big_data' do { (1..1000000).inject(:+) }``

缓存默认是以文件形式保存，文件位置 ``./tmp/cache``

参考 http://rubyer.me/blog/2012/09/04/speed-up-with-rails-cache/
