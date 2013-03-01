MongoUri = require "#{LIB_ROOT}/mongo-uri"
MongoUriError = require "#{LIB_ROOT}/mongo-uri-error"

describe "parse", ->
  it "should throw type error when missing uri portion", ->
    fn = ->
      MongoUri.parse()
    expect(fn).to.throw TypeError, /must be a string/
