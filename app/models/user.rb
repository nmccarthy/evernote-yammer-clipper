class User < ActiveRecord::Base
  attr_accessible :email, :evernote_token, :name, :yammer_token
end
