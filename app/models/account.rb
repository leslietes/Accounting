class Account < ActiveRecord::Base

  validates :name, :length   => { :maximum => 100 },
                   :presence => true
  
  validates :type, :length   => { :maximum => 100 },
                   :presence => true
  
end
