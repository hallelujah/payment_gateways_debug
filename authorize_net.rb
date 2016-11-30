require 'authorizenet'
require 'yaml'
require 'irb'

class AuthorizeNetDebug
  include AuthorizeNet::API

  DEFAULT_CONFIG = YAML.load_file(File.expand_path('../authorizenet.yml', __FILE__)).symbolize_keys.freeze

  def initialize(config = {})
    @config = config.reverse_merge(DEFAULT_CONFIG)
    @transaction = Transaction.new(@config[:api_login_id], @config[:api_transaction_key], gateway: :production)
  end

  def get_customer_profile(profile_id)
    request = GetCustomerProfileRequest.new
    request.customerProfileId = profile_id
    @transaction.get_customer_profile(request)
  end
end

IRB.start
