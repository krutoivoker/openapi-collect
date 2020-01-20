# openapi-collect
An idea was something like "I need to be informed about chages in API to be able to test it properly. I'm Feeling nervous without that" :D

Contents:

convert.js - Required for building postman collection, uses npm package "swagger2-postman-generator".
idiff.sh - Colorized diff between two files.
Actually, swagger-diff npm package is much better, but requires swaggerfile (api.json) to be semantically valid. Unfortunately it was not possible to achieve without punishment :D
swagger-codegen-cli.jar - A tool which generates API-client, can be obtained here: https://github.com/swagger-api/swagger-codegen
config.json - swagger-codegen config for Dockerfile. 
