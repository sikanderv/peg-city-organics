class Attachment < ApplicationRecord
  # Mount the Carrierwave uploader
  mount_uploader :file, AttachmentUploader

  # Relationships
  belongs_to :parent, polymorphic: true

  # All attachments should have a token assigned to this
  before_validation { self.token = SecureRandom.uuid if token.blank? }

  # Set the appropriate values in the model
  before_validation do
    if file
      self.file_name = file.filename if file_name.blank?
      self.file_type = file.content_type if file_type.blank?
      self.file_size = file.size if file_size.blank?
    end
  end

  # Return the attachment for a given role
  def self.for(role)
    # where(role: role).first
    find_by(role: role)
  end

  # Return the path to the attachment
  def path
    file.url
  end

  # Is the attachment an image?
  def image?
    # file_type.match(/\Aimage\//).present?
    %r{/Aimage//}.present?
  end
end
