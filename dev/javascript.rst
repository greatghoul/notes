======================
JavaScript 笔记
======================

Tips & Tricks
-------------------

获取当前选中内容的元素节点
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: javascript

    function getSelectedNode()
    {
        if (document.selection)
            return document.selection.createRange().parentElement();
        else
        {
            var selection = window.getSelection();
            if (selection.rangeCount > 0)
                return selection.getRangeAt(0).startContainer.parentNode;
        }
    }

参考： http://stackoverflow.com/a/1335347/260793
