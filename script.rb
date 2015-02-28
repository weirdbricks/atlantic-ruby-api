## Lampros Chaidas
## 01/01/2015
## Sample code to list instances from Atlantic.net using Ruby

# tested with Ruby 1.9.3
require 'rest_client'
require 'digest'
require 'uuidtools'
require 'json'
require './signature.rb'
require './list-instances.rb'
require './terminate-instance.rb'

# replace with your access key
$ACSAccessKeyId = "ATLf2b2c120cc905f9263db75bac02a02b2"

# replace with your private key
$api_private_key = "331035a833546ca187726599eb53e926ee7418f1"

# get the current time in unix epoch i.e. 1420184854
$current_time = Time.now.to_i.to_s

# get a GUID
$rndguid = UUIDTools::UUID.random_create.to_s

# array with the possible API methods
possible_actions = Array["list-instances","terminate-instance"]

# get the action you want to use as an argument
action = ARGV[0]

# check if an action was given
if action.nil? then abort "You need to use one of the options: #{possible_actions}" end

# check if the action given is included in the possible_actions array
if !possible_actions.include?(action) then abort "Incorrect option -  You need to use one of the options: #{possible_actions}" end

# got the URI from http://kb.atlantic.net/api-methods-php-example/
$uri = "https://cloudapi.atlantic.net/api.php"

case action
  when "list-instances"
    list_instances
  when "terminate-instance"
    terminate_instance
end
