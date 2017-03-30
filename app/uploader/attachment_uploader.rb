class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Where should files be stored?
  def store_dir
    # "attachment/#{model.id}"
    'app/assets/images/products'
  end

  # Returns true if the file is an image
  def image?(_new_file)
    file.content_type.include? 'image'
  end

  # Returns true if the file is not an image
  def not_image?(_new_file)
    !file.content_type.include? 'image'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  version :resized do
   # returns an image with a maximum width of 100px
   # while maintaining the aspect ratio
   # 10000 is used to tell CW that the height is free
   # and so that it will hit the 100 px width first
   process :resize_to_fit => [100, 10000]
  end
  
  # Create different versions of your uploaded files:
  version :thumb, if: :image? do
    process resize_and_pad: [200, 200]
  end
end
