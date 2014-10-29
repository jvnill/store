class Order < ActiveRecord::Base
  STATUSES = %w[draft pending paid]

  has_many :order_items

  belongs_to :user, inverse_of: :orders

  validates :user, presence: true
  validates :status, inclusion: { in: STATUSES }

  before_create :mark_as_draft

  scope :draft,   -> { where(status: 'draft') }
  scope :pending, -> { where(status: 'pending') }
  scope :paid,    -> { where(status: 'paid') }

  def total
    if status == 'draft'
      order_items.joins(:product).sum('products.price * order_items.quantity')
    else
      order_items.sum('price * quantity')
    end
  end

  private

  def mark_as_draft
    self.status = 'draft'
  end
end
