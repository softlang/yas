# Start and stop Apache through Settings -> Sharing -> WebSharing.
# Consider firewall through Settings -> Security ...
# Consider blocking external access ditto.
# Add the following to /etc/apache2/httpd.conf (without "#")
# ProxyPass        / http://localhost:4242/
# ProxyPassReverse / http://localhost:4242/
# One may need to restart Apache to take effect.

web = /Library/WebServer/Documents
swipl = swipl -q -t editor_main
server = ${swipl} -f server.pro
log = ../../logs/editor.log

# Show status
status:
	ps -ef | grep "pl" | grep ${log}

# Use when server was terminated irregularly
reset:
	@rm -f startup shutdown

# Restart server
restart:
	make shutdown
	make startup

# Start up server
startup:
	@touch startup # to prevent multiple servers
	@${server} -- ${log} &
	@echo Server started. Use \"make shutdown\" to shut it down.

# Shut down server
shutdown:
	@touch shutdown	
	@echo Stopping server.
	@sleep 3
	@make reset
	@echo Server stopped. Use \"make startup\" to start it up.
