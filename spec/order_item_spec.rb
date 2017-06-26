require 'rails_helper'
require_relative '../app/helpers/charges_helper.rb'

include ChargesHelper

RSpec.describe OrderItem, :type => :model do
  subject { described_class.new }

  it {should belong_to(:item)}
  it {should belong_to(:order)}

end
