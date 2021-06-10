# class OrderForm
#   include ActiveModel::Model

#   concerning :OrderBuilder do
# 	def initialize(params = {})
# 	  super(params)
# 	end

# 	def order
# 	  @order ||= Order.new
# 	end
#   end

#   attr_accessor :quantity, :remarks, :delivery, :acceptance_on
#   validates :quantity, presence: true
#   validates :delivery, presence: true
#   validates :acceptance_on, presence: true

#   concerning :AccessoryBuilder do
# 	attr_reader :accessories_attributes

# 	def accessories
# 	  @accessories_attributes ||= Accessory.new
# 	end

# 	def accessories_attributes=(attributes)
# 	  @accessories_attributes = Accessory.new(attributes)
# 	end
#   end

#   attr_accessor :equipment, :parts, :numeral, :identification
#   validates :equipment, presence: true
#   validates :parts, presence: true

#   concerning :OrderOverviewsBuilder do
# 	attr_reader :order_overviews_attributes

# 	def order_overviews
# 	  @order_overviews_attributes ||= OrderOverview.new
# 	end

# 	def order_overviews_attributes=(attributes)
# 	  @order_overviews_attributes = OrderOverview.new(attributes)
# 	end
#   end

#   attr_accessor :company, :department, :position, :name
#   validates :company, presence: true
#   validates :department, presence: true
#   validates :name, presence: true

#   def save
# 	return false if invalid?

# 	order.assign_attributes(order_params)
# 	build_associations

# 	order.save ? true : false
#   end

#   private

#   def order_params
# 	{ quantity: quantity, remarks: remarks, delivery: delivery, acceptance_on: acceptance_on }
#   end

#   def build_associations
# 	order.accessories.build(equipment: equipment, parts: parts, numeral: numeral, identification: identification).save
# 	order.order_overviews.build(company: company, department: department, position: position, name: name).save
#   end
# end

