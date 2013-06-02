simple_form 笔记
======================

表单组件
-----------

collection select
~~~~~~~~~~~~~~~~~

手动设置下拉框默认值
^^^^^^^^^^^^^^^^^^^^

与文本域不同，下拉框设置默认值不能使用 ``:input_html => { :value => value }`` ，而是需要使用 ``:selected``

.. code-block:: erb

    <%= f.input :name, :collection => ['Yes', 'No'], :selected => 'YES' %> 




    


