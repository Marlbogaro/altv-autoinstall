# altv-install
alt:V Multiplayer, A free alternative multiplayer client for GTA:V. Our client provides perfect synchronization on custom dedicated servers. Play with your friends and make your own gamemodes with JS, C# and much more. 

# How to use this

```
wget https://raw.githubusercontent.com/Marlbogaro/altv-install/main/altv.sh
chmod +x altv.sh
./altv.sh
```

# Starting a server
Now you have all server files that you need. Let's try to start server with start.sh
```
./altv-server
```

# Running alt:V server as a systemd.service
It is possible to run the alt:V server as a systemd.service. This gives you the following advantages:

- You can make the server automatically restart when it crashes
- You can easily start/stop it with simple commands, without navigating to the server directory
- You can add the alt:V server to the autostart
- Adding the service

Create the file ```/lib/systemd/system/altv.service``` with any editor of your choice. In this example we're using nano.

```sudo nano /lib/systemd/system/altv.service```

Paste the following snippet inside this file and modify it to your needs. Make sure to change the paths and user/group, otherwise it won't work.

```[Unit]
Description=alt:V Server
After=network.target
[Service]
WorkingDirectory=/path/to/your/server/
User=altv
Group=altv
Type=simple
ExecStart=/path/to/your/server/altv-server
ExecStop=kill -15 $MAINPID
PIDFile=/path/to/your/server/altv.pid
RestartSec=15
Restart=always
[Install]
WantedBy=multi-user.target```

Now save the file and enable the service with

```systemctl enable altv.service```

 Congratz! The service has been successfully added. alt:V will now automatically boot with your server and restarts, if it crashes. You also now have access to the following commands:

```service altv start # start the server
service altv stop # stop the server
service altv status # get the current status of your server with console output
service altv restart # restart the server```

# WIKI ALT:V
https://wiki.altv.mp/wiki/Main_Page
