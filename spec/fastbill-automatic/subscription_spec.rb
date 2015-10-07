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
        :plan => {
            :article_number => '3',
            :quatity => '1',
            :title => 'Small plan',
            :description => 'A small description',
            :unit_price => 40.00,
            :vat_percent => 19.00
        },
        :plan_upcoming => {
            :article_number => '1',
            :quatity => '1',
            :title => 'Medium Plan',
            :description => 'A meidum description',
            :unit_price => 80.00,
            :vat_percent => 29.00
        },
        :subscription_ext_uid => 0,
        :invoice_title => 'Title',
        :last_event => Time.new(2015, 10, 6),
        :addons => [],
        :expiration_date => Time.new(2016, 10, 6),
        :invoice_id => 'invoice_id',
        :paypal_url => 'paypal_url',
        :usagedata_id => 'usage_id',
        :created => Time.new(2015, 10, 7),
        :usage_date => Time.new(2015, 10, 7),
        :currency_code => 'EUR',
        :description => 'description',
        :unit_price => 40.00,
        :article_id => 'id',
        :quantity => '1',
        :total => 1,
        :addons_url => 'addons_url',
        :cancel_url => 'cancel_url',
        :reactivate_url => 'reactivate_url'


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
      expect(subscription.plan_upcoming[:article_number]).to eq('1')
      expect(subscription.plan_upcoming[:quatity]).to eq('1')
      expect(subscription.plan_upcoming[:title]).to eq('Medium Plan')
      expect(subscription.plan_upcoming[:description]).to eq('A meidum description')
      expect(subscription.plan_upcoming[:unit_price]).to eq(80.00)
      expect(subscription.plan_upcoming[:vat_percent]).to eq(29.0)
      expect(subscription.subscription_ext_uid).to eq(0)
      expect(subscription.invoice_title).to eq('Title')
      expect(subscription.last_event).to be_within(0.5).of(Time.new(2015, 10, 6))
      expect(subscription.addons).to eq([])
      expect(subscription.expiration_date).to be_within(0.5).of(Time.new(2016, 10, 6))
      expect(subscription.hash).to eq('some salty hash')
      expect(subscription.x_attributes).to eq({})
      expect(subscription.expiration_date).to eq(Time.new(2016, 10, 6))
      expect(subscription.invoice_id).to eq('invoice_id')
      expect(subscription.paypal_url).to eq('paypal_url')
      expect(subscription.usagedata_id).to eq('usage_id')
      expect(subscription.created).to eq(Time.new(2015, 10, 7))
      expect(subscription.usage_date).to eq(Time.new(2015, 10, 7))
      expect(subscription.currency_code).to eq('EUR')
      expect(subscription.description).to eq('description')
      expect(subscription.unit_price).to eq(40.00)
      expect(subscription.article_id).to eq('id')
      expect(subscription.total).to eq(1)
      expect(subscription.addons_url).to eq('addons_url')
      expect(subscription.cancel_url).to eq('cancel_url')
      expect(subscription.reactivate_url).to eq('reactivate_url')
    end
  end

  describe 'attr_reader' do
    it 'some values should be read only' do
      expect { subscription.subscription_id = 10 }.to raise_error(NoMethodError)
      expect { subscription.customer_id = 10 }.to raise_error(NoMethodError)
      expect { subscription.invoice_id = 10 }.to raise_error(NoMethodError)
      expect { subscription.usagedata_id = 10 }.to raise_error(NoMethodError)
      expect { subscription.created = 10 }.to raise_error(NoMethodError)
    end
  end

  describe '.update' do
    it 'sends the request' do
      attrs = {
          :next_event => Time.new(2015, 10, 20),
          :subscription_ext_uid => 'some external uid',
          :status => 'inactive',
          :x_attributes => {
              :key => 'notice1',
              :value => 'Never paid'
          },
          :features => {
              :code => 'Some code',
              :quantity => 1,
              :value => 'value'
          }
      }

      expect(Fastbill::Automatic).to receive(:request).with('subscription.update', attrs).and_return('RESPONSE' => {'STATUS' => 'success'})
      Fastbill::Automatic::Subscription.update_attributes('123456', attrs)
    end
  end

  describe '.changearticle' do
    it 'sends the request' do
      attrs = {
          :subscription_id => '123456',
          :quantity => 1,
          :article_number => '3',
          :title => 'Addon title',
          :description => 'A small description',
          :unit_price => 49.99,
          :currency_code => 'EUR',
          :reset_addons => 1, # 0 = false, 1 = true
          :coupon => 'coupon',
          :addons => {
              :article_number => '3',
              :quantity => 1,
              :title => 'Addon title',
              :unit_price => 49.99,
              :description => 'A small description',
              :vat_percent => 19.00
          },
          :features => {
              :code => 'Some code',
              :quantity => 1,
              :value => 'value'
          },
          :suppress_mail => 1
      }

      expect(Fastbill::Automatic).to receive(:request).with('subscription.changearticle', attrs).and_return('RESPONSE' => {'STATUS' => 'success', 'SUBSCRIPTION_ID' => 1})
      Fastbill::Automatic::Subscription.changearticle(attrs)
    end
  end

  describe '.setaddon' do
    it 'sends the request' do
      attrs = {
          :subscription_id => '123456',
          :article_number => '3',
          :quantity => 1,
          :title => 'Addon title',
          :unit_price => 49.99,
          :description => 'A small description'
      }
      expect(Fastbill::Automatic).to receive(:request).with('subscription.setaddon', attrs).and_return('RESPONSE' => {'STATUS' => 'success'})
      Fastbill::Automatic::Subscription.setaddon(attrs)
    end
  end

  describe '.setusagedata' do
    it 'sends the request' do
      attrs = {
          :subscription_id => '123456',
          :article_number => '3',
          :quantity => 1,
          :unit_price => 49.99,
          :description => 'A small description',
          :usage_date => Time.new(2015, 10, 7),
          :currency_code => 'EUR'}

      expect(Fastbill::Automatic).to receive(:request).with('subscription.setusagedata', attrs).and_return('RESPONSE' => {'STATUS' => 'success', "USAGEDATA_ID" => 0})
      Fastbill::Automatic::Subscription.setusagedata(attrs)
    end
  end

  describe '.cancel' do
    it 'sends the request' do
      expect(Fastbill::Automatic).to receive(:request).with('subscription.cancel', {subscription_id: '123456'}).and_return('RESPONSE' => {'STATUS' => 'success'})
      Fastbill::Automatic::Subscription.cancel('123456')
    end
  end

  describe '.getupcompingamount' do

  end

  describe '.getusagedata' do
    it 'sends the request' do
      attrs = {
          :subscription_id => '123456',
          :start => Time.new(2015, 10, 7),
          :end => Time.new(2015, 12, 7)
      }

      expect(Fastbill::Automatic).to receive(:request).with('subscription.getusagedata', attrs).and_return('RESPONSE' => {'STATUS' => 'success'})
      allow(Fastbill::Automatic::Subscription).to receive(:new).with({ 'STATUS' => 'success'})
      Fastbill::Automatic::Subscription.getusagedata(attrs)
    end

    it 'should call the constructor properly' do
      allow(Fastbill::Automatic).to receive(:request).and_return('RESPONSE' => {})
      expect(Fastbill::Automatic::Subscription).to receive(:new).with({})
      Fastbill::Automatic::Subscription.getusagedata(:subscription_id => '123456')
    end

    it 'should return an instance of subscription' do
      allow(Fastbill::Automatic).to receive(:request).with('subscription.getusagedata', {subscription_id: '123456'}).and_return('RESPONSE' => {})
      result = Fastbill::Automatic::Subscription.getusagedata(:subscription_id => '123456')
      expect(result).to be_an_instance_of(Fastbill::Automatic::Subscription)
    end
  end

  describe '.renew' do
    it 'sends the request' do
      # expect(Fastbill::Automatic).to receive(:request).with('subscription.renew', {subscription_id: '123456'}).and_return('RESPONSE' => {'STATUS' => 'success'})
      # Fastbill::Automatic::Subscription.renew('123456')
    end
  end

  describe '.createsecurelink' do
    it 'sends the request' do
      expect(Fastbill::Automatic).to receive(:request).with('subscription.createsecurelink', {subscription_id: '123456'}).and_return('RESPONSE' => {'addons_url' => "addons_url", 'reactivate_url' => 'reactivate_url', 'cancel_url' => 'cancel_url'})
      Fastbill::Automatic::Subscription.createsecurelink('123456')
    end
  end

end