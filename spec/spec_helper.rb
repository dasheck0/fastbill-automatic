$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require "fastbill-automatic"
require "rspec"
require "webmock/rspec"
require "pry"

RSpec.configure do |config|
end