# openapi-collect
An idea was something like "I need to be informed about chages in API to be able to test it properly. I'm Feeling nervous without that" :D

# Contents:
api.sh - main script

convert.js - Required for building postman collection, uses npm package "swagger2-postman-generator".

idiff.sh - Colorized diff between two files.

Actually, npm-package "swagger-diff" is much better, but requires all errors to be fixed in swaggerfile (api.json) before processing it. It was my dream to get errorless swaggerfiles :D

swagger-codegen-cli.jar - A tool which generates API-client, can be obtained here: https://github.com/swagger-api/swagger-codegen

config.json - swagger-codegen config for Dockerfile. 

Shitty code, but worked for me more than a year :D 
