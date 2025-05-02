# Sync Zotero data from server

This simple bash script automates Zotero's backup and restore functionality. It pulls the data from a server (say, from a work computer) to your local machine. rsync is effective at pulling only modified files and makes the syncing easier.

The server details need to be set in the script:

```
username="username"
hostname="serverIP"
hostpath="/path/to/Zotero/"
```

Path to Zotero (hostpath) for various OSes can be found here: https://www.zotero.org/support/zotero_data#backing_up_your_zotero_library.


