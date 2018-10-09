
HOW TO SETUP SPILL CHAT APP:

1. Upload 'web_spill_chat_app' folder to server with PHP functionality.

2. Ensure that 'APC' PHP module is installed and enabled on server.
	- For PHP 5.0+ the module was changed to APCu. May not be relevant, but that detail tripped me up when installing on WAMP for testing.
	- For a linux ubuntu server the following commands to should do the trick:

		$ sudo apt-get install php-apc
		$ sudo service apache2 restart

3. For testing in the Unity Editor, alter 'Spill_Chat_App\Scripts\CHAT_CONFIG.cs' to point to the uploaded 'web_spill_chat_app' folder on the server.

4. For deployment, just upload the deploy folder into the uploaded 'web_spill_chat_app' folder and then navigate to it with your web browser.