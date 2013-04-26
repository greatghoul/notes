Python技巧
==============

dict转对象
-------------

.. code-block:: python
    
    >>> a = type('new', (object,), dict(name='18da'))
    >>> a.name
    '18da'

    >>> from UserDict import UserDict
    >>> obj = UserDict()
    >>> obj.__dict__.update(dict(name='18da'))
    >>> obj.name
    '18da'

