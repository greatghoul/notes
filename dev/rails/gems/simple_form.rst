simple_form 笔记
======================

手动设置下拉框默认值
--------------------

与文本域不同，下拉框设置默认值不能使用 ``:input_html => { :value => value }`` ，而是需要使用 ``:selected``

.. code-block:: erb

    <%= f.input :name, :collection => ['Yes', 'No'], :selected => 'YES' %> 

设置 input 外层元素标签类型
---------------------------

.. code-block:: ruby

    config.wrappers :search, tag: 'li'  do |b|
      b.use :label_text, wrap_with: { tag: 'label', class: 'sosbox_text inline' }
      b.use :input
    end

设置 form 下所有 input 的配置
------------------------------------

.. code-block:: erb

    <%= simple_form_for search_obj,
      defaults: { wrapper: :search, required: false, include_blank: '全部', input_html: { class: 'input-small' } },
      html: html_options do |f| %>
      ...
    <% end %>

上面的配置会设置该表单下所有 input 的 ``wrapper`` 为 ``search`` ，下拉框都插入名为 ``全部`` 的空选项，设置 input 元素
的 ``css`` 类为 ``input-small`` ，当然，你也可以使用其它 ``SimpleForm.setup`` 中 ``config`` 可以设置的选项。

