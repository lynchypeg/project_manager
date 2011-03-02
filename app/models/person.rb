class Person < ActiveRecord::Base
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  before_save :cleanup
  
  scope :all_lazy, select('*').order("first_name ASC")
  scope :find_lazy, lambda {|id| where (primary_key=> id)}
  
  def name
    "#{first_name} #{last_name}"
    
  end
  
  
  private
  def cleanup
    self[:first_name] = self[:first_name].capitalize
  end
  
end
