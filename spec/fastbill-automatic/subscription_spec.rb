require 'spec_helper'

describe Fastbill::Automatic::Subscription do

  let(:valid_attributes) do
    {
        :subscription_id => '0',
        :customer_id => "0",
        :subscription_title => '',
        :start => Time.now,
        :next_event => Time.now,
        :cancellation_date => Time.now,
        :status => 'active',
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
        :last_event => Time.now,
        :addons => [],
        :expiration_date => Time.now
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
      #expect(subscription.start).to eq(Time.now)
      #expect(subscription.next_event).to eq(Time.now)
      #expect(subscription.cancellation_date).to eq(Time.now)
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
      #expect(subscription.last_event).to eq(Time.now)
      expect(subscription.addons).to eq([])
      #expect(subscription.expiration_date).to eq(Time.now)
    end
  end

end