require 'active_support/all'
require 'braintree'
require 'yaml'
require 'irb'


DEFAULT_CONFIG = YAML.load_file(File.expand_path('../braintree.yml', __FILE__)).symbolize_keys.freeze

class BraintreeDebug
  delegate :search, to: Braintree::Customer

  def initialize(config = {})
    @config = config.reverse_merge(DEFAULT_CONFIG)
    Braintree::Configuration.environment = :production
    Braintree::Configuration.merchant_id = @config[:merchant_id]
    Braintree::Configuration.public_key = @config[:public_key]
    Braintree::Configuration.private_key = @config[:private_key]
  end

  def get_customer_profile(profile_id)
    Braintree::Customer.find(profile_id)
  end

end

IRB.start
