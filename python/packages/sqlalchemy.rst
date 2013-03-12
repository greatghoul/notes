SqlAlchemy 笔记
=====================

Tips
----------

Windows 使用 mysql-connector-pyhton 替代 mysql_python
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mysql_python 在 windows 下极品的难装，于是比较好的方案就是，使用 mysql-connector-python 替代。

mysql-connector-python 为 mysql 官方出品，应该也比较可靠吧。

.. code-block:: bash

    pip install mysql-connector-python

在 sqlalchemy 中使用 mysql-connector-python 连接，只需要将连接的 url 改为如下形式即可 ::

    mysql+mysqlconnector://<user>:<password>@<host>[:<port>]/<dbname>

