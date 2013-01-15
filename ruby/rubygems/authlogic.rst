Authlogic Notes
===================

UserSession.find返回nil的问题
-------------------------------
创建 `session` 后 `UserSession.find` 一直返回 `nil` 

需要 ::

    class UserSession < Authlogic::Session::Base
        before_destroy :reset_persistence_token
        before_create  :reset_persistence_token

        def reset_persistence_token
            record.reset_persistence_token
        end 
    end

参考 http://stackoverflow.com/questions/2279248/authlogic-and-multiple-sessions-for-the-same-user
