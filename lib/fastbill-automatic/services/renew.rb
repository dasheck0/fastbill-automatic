module Fastbill
  module Automatic
    module Services
      module Renew
        module ClassMethods

          def renew(id)
            id_attribute = "#{self.name.split('::').last.downcase}_id".to_sym
            attributes = {}
            attributes[id_attribute] = id
            response = Fastbill::Automatic.request("#{self.name.split('::').last.downcase}.renew", attributes)
            self.new(response["RESPONSE"])
          end
        end

        def self.included(base)
          base.extend(ClassMethods)
        end
      end
    end
  end
end