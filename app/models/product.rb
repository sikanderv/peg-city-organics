class Product < ApplicationRecord
  # Mount the Carrierwave uploader
  mount_uploader :image, AttachmentUploader

  has_many :attachments, as: :parent, dependent: :destroy, autosave: true
  belongs_to :category

  has_many :order_items

  default_scope { where(active: true) }

  validates :name, presence: true
  # validates :permalink, presence: true, uniqueness: true, permalink: true
  validates :sku, presence: true
  validates :weight, numericality: true
  validates :price, numericality: true
  validates :cost_price, numericality: true, allow_blank: true

  # Return attachment for the default_image role
  #
  # @return [String]
  def default_image
    attachments.for('default_image')
  end

  # Set attachment for the default_image role
  def default_image_file=(file)
    attachments.build(file: file, role: 'default_image')
  end

  # def attachments=(attrs)
  #   if attrs['default_image']['file'].present? then attachments.build(attrs['default_image']) end
  #   if attrs['data_sheet']['file'].present? then attachments.build(attrs['data_sheet']) end
  #   if attrs['extra']['file'].present?
  #     attrs['extra']['file'].each do |attr|
  #       attachments.build(file: attr,
  #                         parent_id: attrs['extra']['parent_id'],
  #                         parent_type: attrs['extra']['parent_type'])
  #     end
  #   end
  # end

  # All active products
  scope :active_products, (-> { where(active: true) })

  # All featured products
  scope :featured_products, (-> { where(featured: true) })

  # All products on sale
  scope :on_sale_products, (-> { where('on_sale', true) })

  # All products listedd between 2 dates
  # scope :new_products, -> started_at, ended_at {
  # where("started_at = ? AND ended_at = ?", started_at, ended_at) }
end
