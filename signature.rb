## Lampros Chaidas
## 01/01/2015
## Sample code to list instances from Atlantic.net using Ruby

# tested with Ruby 1.9.3
#require 'rest_client'
#require 'digest'
#require 'uuidtools'

def calculate_signature api_private_key, rndguid, current_time

  # concatenate the random GUID to the end of the timestamp - the result should look like this:
  string_to_sign = current_time + rndguid

  # Use the api private key to create a SHA256 hash and Base64 encode the whole thing
  signature = Digest::HMAC.base64digest(string_to_sign, api_private_key, Digest::SHA256)

end


