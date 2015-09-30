class Pin < ActiveRecord::Base
     attr_accessor :title, :content
     belongs_to :user
     has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }
     validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

     validates :image, presence: true
     validates :description, presence: true

# It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
  
end