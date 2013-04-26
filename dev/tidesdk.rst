TideSDK Notes
==================

`TideSDK <http://www.tidesdk.org/>`_ is the new standard for creating beautiful and unique desktop apps using your web development skills.

参考资料
-----------

windows 下打包为msi安装包需要 .Net Framework 2.0 环境, 可以选择是否打入运行环境，是否打入运行环境，会致使打包的安装包位置不同。

 * 打入运行环境 - ``ProjectRoot\packages\win32\bundle\*.msi``
 * 不打运行环境 - ``ProjectRoot\packages\win32\network\*.msi``

如果不打入运行环境，生成的包在安装时会从网络下载运行环境自动安装。

相关文章
-----------

 * `TideSDK Demo <http://my.oschina.net/fants/blog/97746>`_ - 铂金小鸟
 * `WIN7下的TideSDK安装与使用 <http://www.vipaq.com/Article/View/blog/343.html>`_ - 肇凯博客

