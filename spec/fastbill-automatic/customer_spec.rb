require "spec_helper"

describe Fastbill::Automatic::Customer do

  let(:valid_attributes) do
    { customer_number: "5", country_code: "de", customer_ext_uid: "123456", days_for_payment: "14", payment_type: "1", show_payment_notice: "1",
      customer_type: "consumer", organization: "Server Hosting GmbH", salutation: "mr", first_name: "Klaus", account_receivable: "123456",
      last_name: "Testname", address: "Test Street 12", address_2: "Test Street 12", zipcode: "26123", city: "Oldenburg", phone: "049 123 456 789",
      phone_2: "049 123 456 789", fax: "049 123 456 987", mobile: "049 123 456 987", email: "support@fastbill.com", paymill_token: "123456", comment: "some comment",
      newsletter_optin: "1", language_code: "de", changedata_url: "https://automatic.fastbill.com/accountdata/123456/123456", currency_code: "EUR", vat_id: "123456",
      position: "test position", bank_name: "Test name", bank_code: "123456", bank_account_number: "123456", bank_account_owner: "Some Name",
      dashboard_url: "https://automatic.fastbill.com/dashboard/123456/123456"
    }
  end

  let (:customer) do
    Fastbill::Automatic::Customer.new(valid_attributes)
  end

  describe "#initialize" do
    it "initializes all attributes correctly" do
      expect(customer.customer_number).to eql("5")
      expect(customer.customer_ext_uid).to eql("123456")
      expect(customer.days_for_payment).to eql("14")
      expect(customer.payment_type).to eql("1")
      expect(customer.show_payment_notice).to eql("1")
      expect(customer.customer_type).to eql("consumer")
      expect(customer.organization).to eql("Server Hosting GmbH")
      expect(customer.salutation).to eql("mr")
      expect(customer.first_name).to eql("Klaus")
      expect(customer.last_name).to eql("Testname")
      expect(customer.address).to eql("Test Street 12")
      expect(customer.address_2).to eql("Test Street 12")
      expect(customer.zipcode).to eql("26123")
      expect(customer.city).to eql("Oldenburg")
      expect(customer.phone).to eql("049 123 456 789")
      expect(customer.phone_2).to eql("049 123 456 789")
      expect(customer.fax).to eql("049 123 456 987")
      expect(customer.mobile).to eql("049 123 456 987")
      expect(customer.email).to eql("support@fastbill.com")
      expect(customer.paymill_token).to eql("123456")
      expect(customer.comment).to eql("some comment")
      expect(customer.newsletter_optin).to eql("1")
      expect(customer.language_code).to eql("de")
      expect(customer.country_code).to eql("de")
      expect(customer.changedata_url).to eql("https://automatic.fastbill.com/accountdata/123456/123456")
      expect(customer.dashboard_url).to eql("https://automatic.fastbill.com/dashboard/123456/123456")
      expect(customer.position).to eql("test position")
      expect(customer.account_receivable).to eql("123456")
      expect(customer.vat_id).to eql("123456")
      expect(customer.currency_code).to eql("EUR")
      expect(customer.bank_name).to eql("Test name")
      expect(customer.bank_code).to eql("123456")
      expect(customer.bank_account_number).to eql("123456")
      expect(customer.bank_account_owner).to eql("Some Name")
    end
  end

  describe ".get" do
    it "gets a specific customer" do
      expect(Fastbill::Automatic).to receive(:request).with("customer.get", {customer_id: "123456"}).and_return("RESPONSE" => { "CUSTOMERS" => {}})
      Fastbill::Automatic::Customer.get(customer_id: "123456")
    end
  end

  describe ".delete" do
    it "deletes a customer" do
      expect(Fastbill::Automatic).to receive(:request).with("customer.delete", {customer_id: "123456"}).and_return("RESPONSE" => { "STATUS" => "success"})
      Fastbill::Automatic::Customer.delete("123456")
    end
  end

  describe ".create" do
    it "creates a customer" do
      expect(Fastbill::Automatic).to receive(:request).with("customer.create", valid_attributes).and_return("RESPONSE" => { "STATUS" => "success", "CUSTOMER_ID" => "123456"})
      Fastbill::Automatic::Customer.create(valid_attributes)
    end
  end

  describe "#update_attributes" do
    it "update customer" do
      tmp_customer = Fastbill::Automatic::Customer.new(customer_id: "123456")
      expect(Fastbill::Automatic).to receive(:request).with("customer.update", {:email => "some_name@exmaple.com", customer_id: "123456"}).and_return("RESPONSE" => { "STATUS" => "success"})
      
      tmp_customer.update_attributes({:email => "some_name@exmaple.com"})
    end
  end
end