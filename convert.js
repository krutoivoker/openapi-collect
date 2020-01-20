var Swagger2Postman = require("swagger2-postman-generator");
Swagger2Postman
    .convertSwagger()
    .fromFile("api.json")
    .toPostmanCollectionFile("collection.json")
    {
      globalHeaders: [
          "usertype",
          "username",
          "path"
        ]
    }
