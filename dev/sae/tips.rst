Tips
============

本地和SAE环境使用不同的数据库配置
---------------------------------
参考 `^1`_ 

.. code-block:: python

    debug = 'SERVER_SOFTWARE' not in os.environ
    print 'Debug %s' % debug
    # Switch database config through enviroment
    if debug:
        MYSQL_DB = 'app_remarks'
        MYSQL_USER = 'root'
        MYSQL_PASS = 'root'
        MYSQL_HOST_M = 'localhost'
        MYSQL_HOST_S = 'localhost'
        MYSQL_PORT = '3306'
    else:
        import sae.const
        MYSQL_DB = sae.const.MYSQL_DB
        MYSQL_USER = sae.const.MYSQL_USER
        MYSQL_PASS = sae.const.MYSQL_PASS
        MYSQL_HOST_M = sae.const.MYSQL_HOST
        MYSQL_HOST_S = sae.const.MYSQL_HOST_S
        MYSQL_PORT = sae.const.MYSQL_PORT



.. _^1: http://saepy.sinaapp.com/topic/21/%E8%BD%BB%E6%9D%BE%E6%90%AD%E5%BB%BAsae-python-%E6%9C%AC%E5%9C%B0%E8%BF%90%E8%A1%8C%E7%8E%AF%E5%A2%83
