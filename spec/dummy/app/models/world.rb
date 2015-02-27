require 'active_model'

class World
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :countries

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
