class Comment < ActiveRecord::Base
 belongs_to :article, polymorphic: true
 belongs_to :user
 validates_presence_of :users
end
