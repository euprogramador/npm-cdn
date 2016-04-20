# npm-cdn

A webservice that dishes out files from npm packages.

## Running

docker run -v /cdn-cache-folder:/cdn -p 8080:8080 euprogramador/npm-cdn

case run a server as sinopia npm server you can specify which server will connect via environment variable, NPM_HOST by default is used http://registry.npmjs.org/. example:

docker run -v /cdn-cache-folder:/cdn -p 8080:8080 -e NPM_HOST=http://sinopia.myserver.local/ euprogramador/npm-cdn

NOTE: You have the "/" end in url.


## Usage

To access a file inside a published npm package, use the following pattern:

```
http://myserver.com:8080/{packageName}@{packageVersion}/{filePath}
```

Examples:

- [/dat@6.8.6/img/dat-website.png](http://myserver.com:8080/dat@6.8.6/img/dat-website.png)
- [/express@4.10.4/package.json](http://myserver.com:8080/express@4.10.4/package.json)
- [/zeke.sikelianos.com@1.0.0/assets/images/hands.png](http://myserver.com:8080/zeke.sikelianos.com@1.0.0/assets/images/hands.png)

## Indexes

When a package is downloaded, index files are generated in HTML and JSON format.

- [/browserify@8.1.1](http://myserver.com:8080/browserify@8.1.1) renders an HTML
page with links to all the files in the package.
- [/browserify@8.1.1/?json](http://myserver.com:8080/browserify@8.1.1/?json) returns
a JSON array of all the files in the package. You can also set an `application/json`
Accept header in the request instead of using the `json` query param.

## Redirects

If you request a package without specifying a version, you'll be redirected to the
index for the latest version of the package:

- [/lodash](http://myserver.com:8080/lodash) redirects to [/lodash@2.4.1](http://myserver.com:8080/lodash@2.4.1)


