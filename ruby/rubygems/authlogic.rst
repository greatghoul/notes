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

参考 http://stackoverflow.com/questions/2279248/authlogic-and-multiple-sessions-for-the-same-UserSession


UserSession 超期问题
-----------------------------
Authlogic can do this for you. Just use in your models:
http://stackoverflow.com/a/2259858/260793

On User model: ::

    acts_as_authentic do |c|
      c.logged_in_timeout(5.minutes)
    end

... and on UserSession model: ::

    self.logout_on_timeout = true

And simply work! =D
