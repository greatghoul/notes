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

页面刷新前弹出确认对话框
~~~~~~~~~~~~~~~~~~~~~~~~

在 `onbeforeunload` 的事件中，不能够调用 `alert` 等对话框，只能返回一个字符串，该字符串会显示在确定对话框中。

.. code-block:: javascript

    window.onbeforeunload = function(event) {
        return '确认要退出吗？';
    };
