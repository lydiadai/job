class Resume < ApplicationRecord
  validates :content,presence: true
  belongs_to :user
  belongs_to :job
  scope :recent,->{order("created_at DESC")}
  mount_uploader :attachment, AttachmentUploader
end
