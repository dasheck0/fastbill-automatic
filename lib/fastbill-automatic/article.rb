module Fastbill
  module Automatic
    class Article < Base

      attr_reader :article_number, :title, :description, :tags, :unit_price, :setup_fee, :allow_multiple, :is_addon,
                  :translations, :currency_code, :vat_percent, :subscription_interval, :subscription_number_events,
                  :subscription_trial, :subscription_duration, :subscription_duration_follow, :subscription_cancellation,
                  :return_url_success, :return_url_cancel, :checkout_url,

      def self.create(attributes)
        raise FastbillError.new('Create method not implemented.')
      end
    end
  end
end