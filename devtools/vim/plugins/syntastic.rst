Syntastic 笔记
==============

忽略指定类型文件的语法检查
--------------------------

我在编辑 Sphinx 的 rst 文件时，经常会 `Unknown directive type "toctree"` 的错误，因为没有合适的 checker 所以干脆忽略
掉 rst 格式文件的语法检查，但很可惜，google 出来的大部分结果都已经过时了。

网上给的解决方法都是设置 ``syntastic_disabled_filetypes`` 变量，但根本不起作用，这个变量可能已经过时了，它在很早之前
的版本中出现过

    | 1.1.0 [codenamed: tpimp]
    |     ...
    |     - Add an option to specifiy syntax checkers that should be disabled by
    |       default. See :help ``syntastic_disabled_filetypes``.
    |     ...

仔细阅读文档后，找到了新的解决方法

.. code-block:: vim

    let g:syntastic_mode_map = { 'passive_filetypes': ['rst'] }

关于 ``syntastic_mode_map`` 在文档中有很详尽的解释 ::

    The option should be set to something like: >

        let g:syntastic_mode_map = { 'mode': 'active',
                                   \ 'active_filetypes': ['ruby', 'php'],
                                   \ 'passive_filetypes': ['puppet'] }
    <

    "mode" can be mapped to one of two values - "active" or "passive". When set to
    active, syntastic does automatic checking whenever a buffer is saved or
    initially opened.  When set to "passive" syntastic only checks when the user
    calls :SyntasticCheck.

    The exceptions to these rules are defined with "active_filetypes" and
    "passive_filetypes". In passive mode, automatic checks are still done
    for all filetypes in the "active_filetypes" array. In active mode,
    automatic checks are not done for any filetypes in the
    "passive_filetypes" array.

也就是说， ``passive_filetypes`` 中包含的文件类型并不会主动的执行语法检察，除非你手动执行 ``:SyntasticCheck``
既不会给出烦人的提示，在需要时，随时还可以使用，真是方便。
