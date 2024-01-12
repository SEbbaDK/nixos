function nexusimg
curl --silent -X GET -u (lpass show --username nexus):(lpass show --password nexus) "https://docker.subaio.com/v2/subaio/$argv[1]/tags/list" | jq --raw-output '.tags[]'
end
