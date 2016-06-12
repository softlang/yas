See here for material on this structure editor:

http://softlang.uni-koblenz.de/splash13/

This is how the server can be tested:

* Make sure slepro works on your system; run "make test" at the top.
* Run a Apache server on your system so that you can use localhost.
* Set up remote proxy so that Apache redirects to Prolog; see below.
* Start the server in services/editor with "make startup".
* Try out http://localhost/metamodels etc.
* Shut down the server in services/editor with "make shutdown".

Remote proxy configuration:

<pre>
more /etc/apache2/httpd.conf
...
ProxyPass        / http://localhost:4242/
ProxyPassReverse / http://localhost:4242/
</pre>
