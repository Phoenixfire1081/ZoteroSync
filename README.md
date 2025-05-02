# Sync Zotero data to/from server

This simple bash script automates Zotero's backup and restore functionality. It pulls or pushes the data from a server (say, from a work computer) to your local machine and vice versa. rsync is effective at pulling or pushing only modified files and makes the syncing easier.

The server details need to be set in the script:

```
username="username"
hostname="serverIP"
hostpath="/path/to/Zotero/"
hostpathpush="/path/to/" # Similar to hostpath without Zotero
```

Path to Zotero (hostpath) for various OSes can be found [here](https://www.zotero.org/support/zotero_data#backing_up_your_zotero_library).

The bash script needs to be kept at the Zotero data directory on your local machine.

In case of data corruption on the server-side, the backup from Zotero-old on your local machine can be used.

## Testing

Tested on a Mac (Sequoia 15.3.1) pulling data from Linux (Ubuntu 24.04.1)
Tested on a Mac (Sequoia 15.3.1) pushing data to Linux (Ubuntu 24.04.1)
