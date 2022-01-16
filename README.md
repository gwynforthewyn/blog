Gwyn's Blog! This probably isn't super interesting to most people, but there are a few things to know.

First, the tooling is [Pelican](https://blog.getpelican.com) and docker. Pelican generates static HTML files for the blog from markdown 
files.



* To build, run build.sh. This will generate the html.
* The static html is uploaded to an s3 bucket, which serves the website on http://blog.playtechnique.io
