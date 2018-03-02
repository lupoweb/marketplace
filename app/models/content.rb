class Content < ActiveRecord::Base
  belongs_to :user
  has_attached_file :cover, styles: { medium: "300x>", thumb: "100x>" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/,
  message: "You can upload only Images" 

  has_attached_file :attachment 
  validates_attachment_content_type :attachment, :content_type => [ /^image\/(png|gif|jpeg)/,'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','audio/mpeg', 'audio/mp3' ],
  message: "Not Supported"
end 