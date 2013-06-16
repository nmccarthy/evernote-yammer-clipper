class User < ActiveRecord::Base
  attr_accessible :email, :evernote_token, :name, :yammer_token, :yammer_uid, :evernote_uid, :evernote_shard_id

  def self.create_with_omniauth(auth)
    create! do |user|
      user.yammer_uid = auth["uid"]
      user.yammer_token = auth["credentials"]["token"]
      user.name = auth["info"]["full_name"]
      user.email = auth["info"]["email"]
    end
  end

  def self.find_and_update(auth)
    user = User.find_by_yammer_uid(auth["uid"])
    user.yammer_token = auth["credentials"]["token"]
    user.name = auth["info"]["full_name"]
    user.email = auth["info"]["email"]
    user.save!
    return user
  end

  def update_evernote_data(auth)
    self.evernote_token = auth["credentials"]["token"]
    self.evernote_uid = auth["uid"]

    token_info = OAuth::AccessToken.new(auth["extra"]["access_token"])
    self.evernote_shard_id = token_info.consumer.params["edam_shard"]

    self.save!
  end
end