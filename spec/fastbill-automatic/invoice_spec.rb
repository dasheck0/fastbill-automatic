require 'spec_helper'

describe Fastbill::Automatic::Invoice do

  let(:valid_attributes) do
    {
        :invoice_id => '123456',
        :status => 'paid',
        :type => "outgoing",
        :customer_id => '6789',
        :customer_number => '12',
        :customer_costcenter_id => '1',
        :organization => 'Company',
        :salutation => 'mr',
        :first_name => 'Hans',
        :last_name => 'Peter',
        :address => 'Hans-Peter-Strasse 22',
        :address_2 => '',
        :zipcode => '12346',
        :city => 'Duesseldorf',
        :comment => 'No comment',
        :payment_type => 1,
        :days_for_payment => 14,
        :bank_name => 'New Bank',
        :bank_account_number => '123456788',
        :bank_code => 'DE 34567',
        :bank_account_owner => 'Hans Peter',
        :bank_iban => 'DE 12345678 435678',
        :bank_bic => 'WELADEDXXX',
        :affiliate => 0,
        :country_code => 'DE',
        :vat_id => '',
        :currency_code => 'EUR',
        :template_id => '1',
        :subscription_id => '123456',
        :subscription_invoice_counter => 2,
        :invoice_number => 1,
        :invoice_title => 'Ttitle',
        :introtext => 'Welcome ',
        :outstanding_amount => 49.00,
        :paid_date => Time.new(2015, 10, 6),
        :is_canceled => false,
        :invoice_date => Time.new(2015, 10, 6),
        :due_date => Time.new(2015, 10, 20),
        :delivery_date => Time.new(2015, 10, 6),
        :cash_discount_percent => 0,
        :cash_discount_days => 2,
        :sub_total => 49.00,
        :vat_total => 19.00,
        :vat_items => 1,
        :items => 1,
        :total => 58.18,
        :payment_info => 'nothing',
        :document_url => 'https://document.url',
        :paypal_url => 'https://paypal.url'
    }
  end

  let(:invoice) do
    Fastbill::Automatic::Invoice.new(valid_attributes)
  end

  describe '#initialize' do
    it 'initializes all attributes correctly' do
      expect(invoice.invoice_id).to eq('123456')
      expect(invoice.status).to eq('paid')
      expect(invoice.type).to eq("outgoing")
      expect(invoice.customer_id).to eq('6789')
      expect(invoice.customer_number).to eq('12')
      expect(invoice.customer_costcenter_id).to eq('1')
      expect(invoice.organization).to eq('Company')
      expect(invoice.salutation).to eq('mr')
      expect(invoice.first_name).to eq('Hans')
      expect(invoice.last_name).to eq('Peter')
      expect(invoice.address).to eq('Hans-Peter-Strasse 22')
      expect(invoice.address_2).to eq('')
      expect(invoice.zipcode).to eq('12346')
      expect(invoice.city).to eq('Duesseldorf')
      expect(invoice.comment).to eq('No comment')
      expect(invoice.payment_type).to eq(1)
      expect(invoice.days_for_payment).to eq(14)
      expect(invoice.bank_name).to eq('New Bank')
      expect(invoice.bank_account_number).to eq('123456788')
      expect(invoice.bank_code).to eq('DE 34567')
      expect(invoice.bank_account_owner).to eq('Hans Peter')
      expect(invoice.bank_iban).to eq('DE 12345678 435678')
      expect(invoice.bank_bic).to eq('WELADEDXXX')
      expect(invoice.affiliate).to eq(0)
      expect(invoice.country_code).to eq('DE')
      expect(invoice.vat_id).to eq('')
      expect(invoice.currency_code).to eq('EUR')
      expect(invoice.template_id).to eq('1')
      expect(invoice.subscription_id).to eq('123456')
      expect(invoice.subscription_invoice_counter).to eq(2)
      expect(invoice.invoice_number).to eq(1)
      expect(invoice.invoice_title).to eq('Ttitle')
      expect(invoice.introtext).to eq('Welcome ')
      expect(invoice.outstanding_amount).to eq(49.00)
      expect(invoice.paid_date).to eq(Time.new(2015, 10, 6))
      expect(invoice.is_canceled).to eq(false)
      expect(invoice.invoice_date).to eq(Time.new(2015, 10, 6))
      expect(invoice.due_date).to eq(Time.new(2015, 10, 20))
      expect(invoice.delivery_date).to eq(Time.new(2015, 10, 6))
      expect(invoice.cash_discount_percent).to eq(0)
      expect(invoice.cash_discount_days).to eq(2)
      expect(invoice.sub_total).to eq(49.00)
      expect(invoice.vat_total).to eq(19.00)
      expect(invoice.vat_items).to eq(1)
      expect(invoice.items).to eq(1)
      expect(invoice.total).to eq(58.18)
      expect(invoice.payment_info).to eq('nothing')
      expect(invoice.document_url).to eq('https://document.url')
      expect(invoice.paypal_url).to eq('https://paypal.url')
    end
  end

end