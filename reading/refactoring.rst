.. _refactor_notes:

Refactoring: Improving The Design of Existing Code
==================================================

豆瓣地址： http://book.douban.com/subject/4262627/

.. image:: http://img3.douban.com/mpic/s4157180.jpg

Chaptor 1. Refactoring, a First Example
---------------------------------------

**A poorly designed system is hard to change. Hard because it is hard to figure out where the changes are needed. 
If it is hard to figure out what to change, there is a strong chance that the programmer will make a mistake 
and introduce bugs.**

设计糟糕的系统很难做出改变，主要是很难找出哪里需要改变。如果一个系统很难改变，那很可能意味着程序将会犯错并且制造 Bug。

------

**When you find you have to add a feature to a program, and the program's code is not structured in a convenient way to 
add the feature, first refactor the program to make it easy to add the feature, then add the feature.**

当因为代码结构的问题导致不能方便的给程序添加新特性时，那首先你得先重构代码结构，然后再添加新特性。

