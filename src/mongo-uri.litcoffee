The mongodb connection string URI is a little different than a typical URI but
does actually conform to the URI scheme. Because of it's a-typical nature, 
namely, being able to specify multiple hosts, it's rare to see in NodeJS land
a driver that correctly parses a mongo uri :(

Resources:
* http://docs.mongodb.org/manual/reference/connection-string/
* http://en.wikipedia.org/wiki/URI_scheme
* http://tools.ietf.org/html/std66

## URI Connection Scheme
`mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]`

Here we define some regular expressions to use in parsing. They are defined here
so that we only have to create them once.

    ReEnsureMongoScheme = /$mongodb:/i

    exports = module.exports = class MongoUri
      constructor: ->
        @username = null
        @password = null
        @hosts = null
        @database = null
        @options = null

# parsing
This is where the magic happens!

*throws*
* TypeError - if uri isn't a string
* MongoUriError - if the uri is malformed

    exports.parse = (uri)->
      throw new TypeError("Parameter 'uri' must be a string, not #{typeof uri}") unless typeof uri is "string"
      throw new MongoUriError("uri must be a 'mongodb' scheme") unless ReEnsureMongoScheme.match(uri)

