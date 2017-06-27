require 'rails_helper'
require_relative '../app/helpers/charges_helper.rb'

include ChargesHelper
include ActionView::Helpers::NumberHelper

describe ChargesHelper do
  amount_in_cents = 1000

  it 'returns the correct dollar amount' do
    expect(pretty_amount(amount_in_cents)).to eq("$10.00")
  end
end
