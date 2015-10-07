require 'spec_helper'

describe Fastbill::Automatic::Article do

  let(:valid_attributes) do
    {
        :article_number => "0",
        :title => 'Small plan',
        :description => 'This is a small plan',
        :unit_price => 49.99,
        :allow_multiple => false,
        :is_addon => false,
        :currency_code => 'EUR',
        :vat_percent => 19.00,
        :setup_fee => 49.00,
        :subscription_interval => '1 Month',
        :subscription_number_events => 0,
        :subscription_trial => '30 Day',
        :subscription_duration => '12 Month',
        :subscription_cancellation => '30 Day',
        :return_url_success => 'success',
        :return_url_cancel => 'cancel',
        :checkout_url => 'checkout',
        :tags => ['first', 'second'],
        :translations => {},
        :subscription_duration_follow => '6 Month',
        :features => { :some => 'feature'},
        :transition => 'transition'
    }
  end

  let(:article) do
    Fastbill::Automatic::Article.new(valid_attributes)
  end

  describe '#initialize' do
    it 'initializes all attributes correctly' do
      expect(article.article_number).to eq("0")
      expect(article.title).to eq('Small plan')
      expect(article.description).to eq('This is a small plan')
      expect(article.unit_price).to eq(49.99)
      expect(article.allow_multiple).to eq(false)
      expect(article.is_addon).to eq(false)
      expect(article.currency_code).to eq('EUR')
      expect(article.vat_percent).to eq(19.00)
      expect(article.setup_fee).to eq(49.00)
      expect(article.subscription_interval).to eq('1 Month')
      expect(article.subscription_number_events).to eq(0)
      expect(article.subscription_trial).to eq('30 Day')
      expect(article.subscription_duration).to eq('12 Month')
      expect(article.subscription_cancellation).to eq('30 Day')
      expect(article.return_url_success).to eq('success')
      expect(article.return_url_cancel).to eq('cancel')
      expect(article.checkout_url).to eq('checkout')
      expect(article.tags).to eq(['first', 'second'])
      expect(article.translations).to eq({})
      expect(article.subscription_duration_follow).to eq('6 Month')
      expect(article.features).to eq({ :some => 'feature' })
      expect(article.transition).to eq('transition')
    end
  end

  describe '.get' do
    it 'gets a specific article' do
      expect(Fastbill::Automatic).to receive(:request).with('article.get', {:article_id => '123456'}).and_return("RESPONSE" => {"ARTICLES" => {}})
      Fastbill::Automatic::Article.get(:article_id => '123456')
    end
  end
end