mongo-uri
=========

I parse mongo URIs; especially the tricky repl set ones.  
[![Build Status](https://travis-ci.org/supershabam/mongo-uri.png?branch=master)](https://travis-ci.org/supershabam/mongo-uri)

Dear NodeJS MongoDB Drivers
---------------------------

I want to use the [mongodb connection string](http://docs.mongodb.org/manual/reference/connection-string/)...
and I need more than just `mongodb://localhost`. As it turns out, as soon as you 
start working with real web-scale badassrockstar deployments, you need to 
connect to replication sets. 

Luckily, the defined connection string format accomodates such configurations!

Sadly, node's drivers do not understand these connection strings, or have unacceptable bugs with
parsing (e.g. uris should be uri encoded).

So, I made a uri parser for you. I don't do anything else.

Please find bugs in my code, and help me make it the best mongo connection string
parser in history.

AND THEN USE IT!

Heads up
--------

I refuse to make assumptions about defaults as part of the parser. So, if a port
goes unspecified, I will say that the port is null (because it is), and it is
your job to realize that the default port is 27017.

Usage
-----

```javascript
var MongoURI = require('mongo-uri')
  , uriString
  , uri
  ;

// let's deal with a complicated (yet real-life) uri
uriString = "mongodb://%40u%2Fs%3Fe%3Ar:p%40a%2Fs%3Fs%3A@example1.com,example2.com,example3.com:27018/?readPreference=secondary&w=2&wtimeoutMS=2000&readPreferenceTags=dc:ny,rack:1&readPreferenceTags=dc:ny&readPreferenceTags=";

try {
  uri = MongoURI.parse(uriString);
} catch (err) {
  // handle this correctly, kthxbye
}

console.log(uri);
/*
 * username: "@u/s?e:r" // yay! it got decoded like it was supposed to!
 * password: "p@a/s?s:"
 * hosts: ["example1.com", "example2.com", "example3.com"] // wow, multiple hosts!
 * ports: [null, null, 27018] // remember, I don't assume
 * database: null // what did I just say?
 * options: {
 *   readPreference: "secondary",
 *   w: "2",
 *   timeoutMS: "2000",
 *   readPreferenceTags: ["dc:ny,rack:1", "dc:ny", ""] // yeah, this is correct
 * }
 */
```

Source
------

Ok, so I made a Tweet (which is as good as a promise) that my next npm module would
be in [literate coffeescript](http://ashkenas.com/literate-coffeescript/). 

It was a nice experiment. I wish GitHub would properly highlight the source. Literate
CoffeeScript is a good choice for when the code is highly dependent on implementing a
spec correctly, as the code references and displays the spec in-line and stays versioned
along with the code.

I didn't want to make users of this module transpile .litcoffee files. So, I created a 
grunt task to do my publishing that ensures I publish the resulting .js files to npm, and
not the .litcoffee files.

So, don't hate me for using .litcoffee. You're getting raw javascript goodness
when you npm install me.

License
-------

MIT
