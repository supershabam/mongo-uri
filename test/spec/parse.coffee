MongoUri = require "#{LIB_ROOT}/mongo-uri"

describe "parse", ->
  it "should throw type error when missing uri portion", ->
    fn = ->
      MongoUri.parse()
    expect(fn).to.throw TypeError, /must be a string/

  it "should throw type error when not mongodb: scheme", ->
    fn = ->
      MongoUri.parse("http://test.com")
    expect(fn).to.throw TypeError, /must be mongodb scheme/

  it "should parse a simple username and password", ->
    uri = MongoUri.parse "mongodb://user:password@localhost/test"
    expect(uri.username).to.equal "user"
    expect(uri.password).to.equal "password"

  it "should parse uri encoded username and password", ->
    uri = MongoUri.parse "mongodb://%40u%2Fs%3Fe%3Ar:p%40a%2Fs%3Fs%3A@localhost"
    expect(uri.username).to.equal "@u/s?e:r"
    expect(uri.password).to.equal "p@a/s?s:"