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

Action组合别名处理
~~~~~~~~~~~~~~~~~~~
一般对于成组出现的权限，没有必要为每一个 action 都定一个 permission，
可以在 ``app/models/ability.rb`` 中这样做

.. code-block:: ruby

    class Ability
      include CanCan::Ability
      
      def initialize(user)
        alias_action :check, :approve, :to => :approve
        # ..
      end
    end

然后在使用时可以直接

.. code-block:: ruby

    can :merge, Customer
    can? :merge, Customer

无对应 Model 的 Controller 的权限设置
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: ruby

    class ToolsController < ApplicationController
      authorize_resource :class => false
    end

    # in Ability
    can :manage, :tool

Resources
---------
 * CanCan实作角色权限设计的最佳实践 `其1 <http://blog.xdite.net/posts/2012/07/30/cancan-rule-engine-authorization-based-library-1/>`_ `其2 <http://blog.xdite.net/posts/2012/07/30/cancan-rule-engine-authorization-based-library-2/>`_ `其3 <http://blog.xdite.net/posts/2012/07/30/cancan-rule-engine-authorization-based-library-3/>`_
 * `Abilities-in-Database <https://github.com/ryanb/cancan/wiki/Abilities-in-Database>`_
