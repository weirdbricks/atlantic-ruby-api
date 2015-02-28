## Lampros Chaidas
## 01/01/2015
## Sample code to list instances from Atlantic.net using Ruby

def terminate_instance
  puts "OK, select the instance to terminate:"

  response = RestClient.post( 
           $uri,
           'Version' => '2010-12-30',
           'ACSAccessKeyId' => $ACSAccessKeyId,
           'Format' => 'json',
           'Timestamp' => $current_time,
           'Rndguid' => $rndguid,
           'Signature' => calculate_signature($api_private_key, $rndguid, $current_time),
           'Action' => "list-instances")

  response = JSON.parse(response)

  response["list-instancesresponse"]["instancesSet"].each do |item|

    puts item[1]["InstanceId"]
    puts item[1]["vm_description"]
  end
end
