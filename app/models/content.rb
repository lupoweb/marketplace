class Content < ActiveRecord::Base
  belongs_to :user
  has_attached_file :cover
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/,
  message: "You can upload only Images" 

  has_attached_file :attachment 
  validates_attachment_content_type :attachment, :content_type => [ /^image\/(png|gif|jpeg)/,'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','audio/mpeg', 'audio/mp3' ],
  message: "Not Supported"

  validates :title, :description, :price, presence: true
  validates :price, numericality: { greather_than: 0 }
  validates :cover, attachment_presence: true
  validates :attachment, attachment_presence: true
end 