Want to catch mongo-uri errors specifically? I doubt this is a very useful addition,
but why not. It feels like the right thing to do.

    module.exports = class MongoUriError extends Error
