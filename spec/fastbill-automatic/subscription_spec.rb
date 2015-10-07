require 'spec_helper'

describe Fastbill::Automatic::Subscription do

  let(:valid_attributes) do
    {
        :subscription_id => '0',
        :customer_id => "0",
        :subscription_title => '',
        :start => Time.new(2015, 10, 6),
        :next_event => Time.new(2015, 11, 6),
        :cancellation_date => Time.new(2016, 10, 6),
        :status => 'active',
        :hash => 'some salty hash',
        :x_attributes => {},
        :article_number => '3',
        :quantity => '1',
        :plan => {
            :article_number => '3',
            :quatity => '1',
            :title => 'Small plan',
            :description => 'A small description',
            :unit_price => 40.00,
            :vat_percent => 19.00
        },
        :subscription_ext_uid => 0,
        :invoice_title => 'Title',
        :last_event => Time.new(2015, 10, 6),
        :addons => [],
        :expiration_date => Time.new(2016, 10, 6)
    }
  end

  let(:subscription) do
    Fastbill::Automatic::Subscription.new(valid_attributes)
  end

  describe '#initialize' do
    it 'initializes all attributes correctly' do
      expect(subscription.subscription_id).to eq('0')
      expect(subscription.customer_id).to eq("0")
      expect(subscription.subscription_title).to eq('')
      expect(subscription.start).to be_within(0.5).of(Time.new(2015, 10, 6))
      expect(subscription.next_event).to be_within(0.5).of(Time.new(2015, 11, 6))
      expect(subscription.cancellation_date).to be_within(0.5).of(Time.new(2016, 10, 6))
      expect(subscription.status).to eq('active')
      expect(subscription.article_number).to eq('3')
      expect(subscription.quantity).to eq('1')
      expect(subscription.plan[:article_number]).to eq('3')
      expect(subscription.plan[:quatity]).to eq('1')
      expect(subscription.plan[:title]).to eq('Small plan')
      expect(subscription.plan[:description]).to eq('A small description')
      expect(subscription.plan[:unit_price]).to eq(40.00)
      expect(subscription.plan[:vat_percent]).to eq(19.0)
      expect(subscription.subscription_ext_uid).to eq(0)
      expect(subscription.invoice_title).to eq('Title')
      expect(subscription.last_event).to be_within(0.5).of(Time.new(2015, 10, 6))
      expect(subscription.addons).to eq([])
      expect(subscription.expiration_date).to be_within(0.5).of(Time.new(2016, 10, 6))
      expect(subscription.hash).to eq('some salty hash')
      expect(subscription.x_attributes).to eq({})
    end
  end

end