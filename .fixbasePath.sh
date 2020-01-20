jq '.basePath="/v1/"' api.json > new.json
jq '.host="env1.local"' api.json > new.json
