Views & Forms Notes
========================

select_tag 指定选项及默认值
---------------------------

.. code-block:: erb

    select_tag "whatever", "<option>VISA</option><option selected=\"selected\">MasterCard</option>"
    select_tag "whatever", options_for_select([ "VISA", "MasterCard" ], "MasterCard")
    select_tag "people", options_from_collection_for_select(@people, 'id', 'name', '1')

参考 http://stackoverflow.com/a/3396120/260793

