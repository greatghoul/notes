Devise Notes
==============

配置
-------------------

自定义 layout
~~~~~~~~~~~~~~~~
在 `config/initializers/devise.rb` 中加入

.. code-block:: ruby

    Devise::SessionsController.layout "bar"
    Devise::RegistrationsController.layout "foo"
    Devise::ConfirmationsController.layout false
    Devise::UnlocksController.layout "bar"
    Devise::PasswordsController.layout "foo"

参考：

 * `Removing header rendering in specific rails .html.erb file <http://stackoverflow.com/a/10972585/260793>`_
 * `How To: Create custom layouts <https://github.com/plataformatec/devise/wiki/How-To:-Create-custom-layouts>`_
