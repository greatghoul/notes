CanCan Notes
============

Tips
---------

忽略父控制器的验证
~~~~~~~~~~~~~~~~~~~

将 ``skip_load_and_authorize_resource`` 设置在 ``ApplicationController`` 中虽然方便，但是对于一些特殊的控制器，需要单独设置验证选项时，就需要忽略父控制器的验证了。

CanCan 在验证时，需要加载一个 Model 用于检测权限，默认会检测控制器同名的 Model，如果控制器的 Model 不存在，可以通过如下方式指定 ::

    skip_load_and_authorize_resource # 忽略父控制器验证
    load_and_authorize_resource :class => Customer

Resources
---------
 * CanCan实作角色权限设计的最佳实践 `其1 <http://blog.xdite.net/posts/2012/07/30/cancan-rule-engine-authorization-based-library-1/>`_ `其2 <http://blog.xdite.net/posts/2012/07/30/cancan-rule-engine-authorization-based-library-2/>`_ `其3 <http://blog.xdite.net/posts/2012/07/30/cancan-rule-engine-authorization-based-library-3/>`_
 * `Abilities-in-Database <https://github.com/ryanb/cancan/wiki/Abilities-in-Database>`_
