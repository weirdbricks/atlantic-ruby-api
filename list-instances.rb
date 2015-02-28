## Lampros Chaidas
## 01/01/2015
## Sample code to list instances from Atlantic.net using Ruby

def list_instances
  puts "OK, Listing instances.."

  response = RestClient.post( 
           $uri,
           'Version' => '2010-12-30',
           'ACSAccessKeyId' => $ACSAccessKeyId,
           'Format' => 'json',
           'Timestamp' => $current_time,
           'Rndguid' => $rndguid,
           'Signature' => calculate_signature($api_private_key, $rndguid, $current_time),
           'Action' => "list-instances")

  puts response
  puts response.code
end
