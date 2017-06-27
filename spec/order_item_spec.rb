require 'rails_helper'


RSpec.describe OrderItem, :type => :model do
  subject { described_class.new }

  it {should belong_to(:item)}
  it {should belong_to(:order)}

end
