==================
Flask 笔记
==================

Tips & Tricks
==============

仿止 Werkzeug 多次启动
------------------------

.. code-block:: python

    os.environ.setdefault('WERKZEUG_RUN_MAIN', 'true')

参考
======

.. include:: refs.rst
