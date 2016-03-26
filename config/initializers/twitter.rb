require 'twitter'

$client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'HbvLwWt9H9JCefzfzXvSgOuPE'
  config.consumer_secret = 'TUCpUIm2H9uwkXHhpmayJFUrVrNKy9BFsfFRmrUNBTIq5ICELZ'
  config.access_token = '702320682592559106-vRkTIFLeYoCzYKTLfNeaxpTRVF35v15'
  config.access_token_secret = 'rNlDXlQp1LwHswgzeyKG9QL8CJ0Gc6GJtZ9sTOBFHLunt'
end