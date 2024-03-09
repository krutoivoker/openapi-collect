# openapi-collect
Was built to track changes in API's that was coming to testing. It was really the only way to get the info while working as Backend QA Test Engineer for Skywind Group Byelorussia in 2017-2019.

# Contents:
api.sh - Main script. Collects API's, displays colorized diff between versions of latest if no new version available.

convert.js - Required for building postman collection, uses npm package "swagger2-postman-generator".

idiff.sh - Colorized diff between two files.

swagger-codegen-cli.jar - A tool which generates API-client, can be obtained in [swagger-api/swagger-codegen](https://github.com/swagger-api/swagger-codegen)

config.json - swagger-codegen config for Dockerfile.
