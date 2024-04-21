# My-guix

Collection of guix packages

Use this repo as a [channel](https://guix.gnu.org/manual/en/html_node/Channels.html) add the following lines in the `~/.config/guix/channels.scm` file :

``` scheme
(append (list (channel
                (name 'mbunel-guix-packages)
                (url "https://github.com/MBunel/my-guix.git")
		(branch "main")))
        %default-channels)
```

## Packages

### MicMac

### CloudCompare

### Geoflow

### Laslib

### Laszip

### Pdal

### Entwine

### Untwine

### Pdal-wrench

