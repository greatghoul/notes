===================
tabs
===================

常用操作
============

获取当前标签页
-----------------

由于之前的 ``chrome.tabs.getSelected`` 已经失效， Google 推荐使用新的 API 获取当前标签页，这个 API 更加强大并且通用。

.. code-block:: javascript

    chrome.tabs.query({ currentWindow: true, active: true }, function(tabs) {
        // do something with tabs
        app.showModeIcon(tabs[0].id, mode);
    }); 

表示获取当前窗口激活的标签页，这个方法返回的是一个标签列表，具体使用细节可以查阅 `chrome.tabs.query`_ 方法。

.. _chrome.tabs.query: http://developer.chrome.com/extensions/tabs.html#method-query

