SqlAlchemy 笔记
=====================

Tips & Tricks
--------------

Windows 使用 mysql-connector-pyhton 替代 mysql_python
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mysql_python 在 windows 下极品的难装，于是比较好的方案就是，使用 mysql-connector-python 替代。

mysql-connector-python 为 mysql 官方出品，应该也比较可靠吧。

.. code-block:: bash

    pip install mysql-connector-python

在 sqlalchemy 中使用 mysql-connector-python 连接，只需要将连接的 url 改为如下形式即可 ::

    mysql+mysqlconnector://<user>:<password>@<host>[:<port>]/<dbname>

使用 markdown2 转换 markdown 后存入数据库异常
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

在 sqlalchemy 中，如果某个字符串型的字段的值是通过 ``markdown2.markdown(content)`` 转换而来，则在存入数据库时会发生异常。

错误信息为 ::

    sqlalchemy.exc.ProgrammingError
    ProgrammingError: (ProgrammingError) Failed processing pyformat-parameters; 'MySQLConverter' object has no attribute '_unicodewithattrs_to_mysql'

这是因为 ``markdown2.markdown()`` 返回的对象为衍生的 ``unicode`` 对象 ``UnicodeWithAttrs`` ，为 ``unicode`` 的子类
它包含一些 markdown 特有的属性，比如 ``toc`` , 这样的对象虽然仍是 ``unicode``, 但是不能被 sqlalchemy 直接使用。

所有必须进行一转换将其显式的转换成 ``unicode`` , 例如：

.. code-block:: python

    article.content_html = unicode(markdown(content))

参考： https://github.com/trentm/python-markdown2/blob/master/lib/markdown2.py


监听 Model 字段变化
~~~~~~~~~~~~~~~~~~~~~
SqlAlchemy 为提供了一系列的 Event 接口来侦听数据及模型的各种动作，比如监听字段内容的变化

.. code-block:: python

    # import ...
    from sqlalchemy import event

    def article_content_changed(article, content, old_content, initiator):
        """ 如果文章的正文变更，重新通过markdown转换html """

        article.content_html = unicode(markdown(content))

    event.listen(Article.content, 'set', article_content_changed)

这样在用户更新 ``Article`` 模型的 ``content`` 字段时，就会自动调用绑定的 ``article_content_changed`` 方法。

**参考资料** 

* http://docs.sqlalchemy.org/en/rel_0_8/orm/events.html#attribute-events
* http://stackoverflow.com/a/8911260/260793
* http://www.sqlalchemy.org/trac/wiki/UsageRecipes/NamingConventions

