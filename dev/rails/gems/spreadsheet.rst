spreadsheet 笔记
===================

* 项目地址： https://github.com/zdavatz/spreadsheet
* 文档地址： http://spreadsheet.rubyforge.org/files/GUIDE_txt.html

设置单元格尺寸
---------------

**设置列宽** ::

    sheet.column(0).width = 50

这样会设置第 1 列宽度为 50

**设置行高** ::

    sheet.row(0).height = 60

这样会设置第 1 行行高为 60

*不可能单独为某个单元格设置行高或者列宽*

设置单元格颜色
---------------

更新单元格颜色，需要创建一个继承自 ``Spreadsheet::Format`` 的类

.. code-block:: ruby

  #设置cell 背景色
  class ColorFormat < Spreadsheet::Format
    def initialize(gb_color, font_color)
      super :pattern => 1, :pattern_fg_color => gb_color,:color => font_color, :text_wrap => 1
    end
  end

然后可以在单元格中这样设置颜色 ::

    sheet.row(0).set_format(0, ColorFormat.new(:green, :white)

这样会在第一行第一列设置单元为绿底白字

设置自动换行
-------------

与 **设置单元格颜色** 类似，需要在 ``Spreadsheet::Format`` 中设置 ``:text_wrap`` 属性值为 ``1``

.. code-block:: ruby

  class ColorFormat < Spreadsheet::Format
    def initialize(gb_color, font_color)
      super :pattern => 1, :pattern_fg_color => gb_color,:color => font_color, :text_wrap => 1
    end
  end

