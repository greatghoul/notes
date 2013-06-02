Oracle 笔记
==================

常用的函数及聚合函数
--------------------

字段内容叠加函数
~~~~~~~~~~~~~~~~~~~~

要将一个字段中的值连接成一个字符串，Oralce 提供了一些便利的方法。

在 Oracle 11G Release 2 中，可以使用 ``LISTAGG``

.. code-block:: sql

    COLUMN employees FORMAT A50

    SELECT deptno, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename) AS employees
    FROM   emp
    GROUP BY deptno;

对于之前的数据库版本，可以使用 ``WM_CONCAT``

.. code-block:: sql

    COLUMN employees FORMAT A50

    SELECT deptno, wm_concat(ename) AS employees
    FROM   emp
    GROUP BY deptno;

输出的结果 ::

        DEPTNO EMPLOYEES
    ---------- --------------------------------------------------
            10 CLARK,KING,MILLER
            20 SMITH,FORD,ADAMS,SCOTT,JONES
            30 ALLEN,BLAKE,MARTIN,TURNER,JAMES,WARD

    3 rows selected.

.. note:: ``WM_CONCAT`` 是一个内置的方法，需要谨慎使用，并且 ``WM_CONCAT`` 只支持用 ``,`` 连接字符串
