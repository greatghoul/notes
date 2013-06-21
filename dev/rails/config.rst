Rails 配置笔记
===============

Assets配置
------------

禁用指定静态文件的 assets digest
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

在项目发布到产品环境时，需要将样式和脚本等文件进行预编译，但如果静态文件 URL 没有变化，浏览器会优先从缓存读取旧的文件，
为避免这种情况的发生，通用的作法是在 URL 中加入一个随机串作为标识。Rails 提供了方便的配置方法

.. code-block:: ruby

    # Generate digests for assets URLs
    config.assets.digest = true
  
这样会生成如下效果的资源地址

.. code-block:: html

    <link href="/assets/jquery-showLoading-cb2ce897e820f6903754878c07b7bfcd.css?body=1" media="screen" rel="stylesheet" type="text/css" />
    <link href="/assets/dispatcher-a671cbcb1012c82d005e1d95205182bd.css?body=1" media="screen" rel="stylesheet" type="text/css" />

但有些时间，我们并不希望某几个单独的静态文件使用该机制，Rails 也为这种特殊情况提供了便利，你可以在 layout 文件中单独
设置该资源不添加标识

.. code-block:: erb

  <%= stylesheet_link_tag  "my97/skin/WdatePicker", :digest => false %>
  <%= stylesheet_link_tag  "application", :media => "all" %>

这样会生成如下效果的资源地址
    
.. code-block:: html

    <link href="/assets/my97/skin/WdatePicker.css?body=1" media="screen" rel="stylesheet" type="text/css" />
    <link href="/assets/application-672269f96f515358253f5a51d5255123.css?body=1" media="all" rel="stylesheet" type="text/css" />

