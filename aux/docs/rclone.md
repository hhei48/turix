### Config on new machine
Setup rclone and follow your common sense.
```
rclone config
```

### Usage
Push a folder to Google Drive
```
rclone sync /path/to/dir remote:path/to/dir
```
Pull to local directory
```
rclone sync remote:path/to/dir /path/to/dir
```
