.. _rails_modes:

Models 开发笔记
====================

Assosications
--------------

使用非主键的字段作为外键关联
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 * Location => location_id, location_code, location_name
 * Driver => driver_id, driver_name, location_code

在这样的关系中，Driver 和 Location 之间使用 location_code 进行关联，而不是 location_id 因此下面的配置无法映射出两者的关系

.. code-block:: ruby

    class Location < ActiveRecord::Base
        has_many :drivers, foreign_key: location_code
    end

    class Driver < ActiveRecord::Base
        belongs_to :location, foreign_key: location_code
    end

因为在查询关联时，rails 在作连接时会使用 ``location_code`` 与 ``location_id`` 进行关联作为连接条件，这样是无法查询出记录的，
需要手动指定对应的 ``primary_key: location_code``

.. code-block:: ruby

    class Location < ActiveRecord::Base
        has_many :drivers, foreign_key: location_code, primary_key: location_code
    end

    class Driver < ActiveRecord::Base
        belongs_to :location, foreign_key: location_code, primary_key: location_code
    end

参考资料： `ActiveRecord::Associations.belongs_to <http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-belongs_to-label-Options>`
