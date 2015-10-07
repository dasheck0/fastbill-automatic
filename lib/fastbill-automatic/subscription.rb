module Fastbill
  module Automatic
    class Subscription < Base
      include Fastbill::Automatic::Services::Update
      include Fastbill::Automatic::Services::Changearticle
      include Fastbill::Automatic::Services::Setaddon
      include Fastbill::Automatic::Services::Setusagedata
      include Fastbill::Automatic::Services::Cancel
      include Fastbill::Automatic::Services::Getupcomingamount

      attr_accessor :subscription_id, :customer_id, :subscription_title, :status, :subscription_ext_uid, :article_number, :customer_id,
                    :coupon, :title, :unit_price, :currency_code, :next_event, :quantity, :description, :plan,
                    :usage_date, :invoice_title, :addons, :start, :cancellation_date, :last_event, :expiration_date,
                    :hash, :x_attributes, :plan_upcoming
    end
  end
end