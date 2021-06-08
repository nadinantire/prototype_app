class OrderForm
  include ActiveModel::Model

  concerning :OrderBuilder do
	def initialize(params = {})
	  super(params)
	end

	def order
	  @order ||= Order.new
	end
  end

  attr_accessor :quantity, :remarks, :delivery, :acceptance_on

  concerning :AccessoryBuilder do
	attr_reader :accessories_attributes

	def accessories
	  @accessories_attributes ||= Accessory.new
	end

	def accessories_attributes=(attributes)
	  @accessories_attributes = Accessory.new(attributes)
	end
  end

  attr_accessor :equipment, :name, :numeral, :identification

  def save
	# return false if invalid?

	order.assign_attributes(order_params)
	build_associations

	order.save ? true : false
  end

  private

  def order_params
	{ quantity: quantity, remarks: remarks, delivery: delivery, acceptance_on: acceptance_on }
  end

  def build_associations
	order.accessories << accessories if accessories[:name].present?
  end
end

# attribute :quantity, Integer
# attribute :remarks, Text
# attribute :delivery, String
# attribute :acceptance_on, Date
# attribute :equipment, String
# attribute :name, String
# attribute :numeral, String
# attribute :identification, String

# def save!
#   order = Order.new(quantity: quantity, remarks: remarks, delivery: delivery, acceptance_on: acceptance_on).save!
#   order.accessories.build(equipment: equipment, name: name, numeral: numeral, identification: identification).save!
#   return order
# end
# end