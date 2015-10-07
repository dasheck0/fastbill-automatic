module Fastbill
  module Automatic
    module Services
      module Getusagedata
        module ClassMethods

          def getusagedata(attributes)
            response = Fastbill::Automatic.request("#{self.name.split("::").last.downcase}.getusagedata", attributes)
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