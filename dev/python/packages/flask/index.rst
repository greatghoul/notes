==================
Flask 笔记
==================

Tips & Tricks
==============

防止 Werkzeug 多次启动
------------------------

.. code-block:: python

    os.environ.setdefault('WERKZEUG_RUN_MAIN', 'true')

通过 decorator 添加 jinja2 的 filter
--------------------------------------

Flask 添加模板 filter 函数：

.. code-block:: python

    @app.template_filter('fmt')
    def fmt(value):
        return value.replace(' ', '&nbsp;');

jinja2 模板中对应值使用 {{ post.text|fmt }} 过滤即可

参考： http://segmentfault.com/q/1010000000267698#a-1020000000267724

参考
======

.. include:: refs.rst
