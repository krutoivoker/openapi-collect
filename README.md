# openapi-collect
An idea was to store and collect openapi definitions aka swagger-files to be able to track changes between versions, automate an API testing and finally generate shell-client to use it with Docker.

# Contents:
api.sh - main script

convert.js - Required for building postman collection, uses npm package "swagger2-postman-generator".

idiff.sh - Colorized diff between two files.

Actually, npm-package "swagger-diff" is much better, but requires all errors to be fixed in swaggerfile (api.json) before processing it.

swagger-codegen-cli.jar - A tool which generates API-client, can be obtained here: https://github.com/swagger-api/swagger-codegen

config.json - swagger-codegen config for Dockerfile.
