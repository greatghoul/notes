.. _gems_mina:

Mina 使用笔记
================

常见问题
---------

ERROR: another deployment is ongoing.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

如果一次部署过程中异常中断，会导致下次部署时出现如下错误： ::

    ERROR: another deployment is ongoing.
    The file 'deploy.lock' was found.
    If no other deployment is ongoing, delete the file to continue.

    Command failed.
    Failed with status 17

按照提示，删除掉服务器上的 `deploy.lock` 文件即可，可以通过 mina 在服务器上执行指令 ::

    mina "run[rm -f deploy.lock]"
