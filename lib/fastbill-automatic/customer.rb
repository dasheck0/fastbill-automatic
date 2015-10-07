module Fastbill
  module Automatic
    class Customer < Base
      include Fastbill::Automatic::Services::Update
      include Fastbill::Automatic::Services::Delete

      attr_accessor :customer_number, :country_code, :city, :term, :comment, :changedata_url, :paymill_token,
                    :customer_ext_uid, :customer_type, :organization, :position, :salutation, :first_name, :last_name,
                    :address, :address_2, :zipcode, :phone, :phone_2, :fax, :mobile, :email, :account_receivable,
                    :currency_code, :vat_id, :days_for_payment, :payment_type, :show_payment_notice, :bank_name,
                    :bank_code, :bank_account_number, :bank_account_owner, :bank_iban, :bank_bic,
                    :bank_account_owner_address, :bank_account_owner_city, :bank_account_owner_zipcode,
                    :bank_account_owner_email, :bank_account_mandate_reference, :bank_account_mandate_reference_date,
                    :newsletter_optin, :language_code, :affiliate, :invoice_delivery_method, :hash, :x_attributes,
                    :title_academic, :secondary_address, :state, :email_cc, :birthday, :payment_mail_address, :tags,
                    :tax_id, :card_type, :expire_month, :expire_year, :card_number

      attr_reader :customer_id, :dashboard_url, :changedata_url, :status, :created, :last_update, :credit_balance
    end
  end
end