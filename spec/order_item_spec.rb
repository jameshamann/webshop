require 'rails_helper'
require_relative '../app/models/order_item.rb'


describe OrderItem do


  subject { described_class.new }

  it {should belong_to(:item)}
  it {should belong_to(:order)}
end
