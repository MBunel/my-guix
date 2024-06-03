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

## Packages avaliable

- [MicMac](https://github.com/micmacIGN/micmac.git) v1.1.1
- [CloudCompare](https://github.com/CloudCompare/CloudCompare) v2.13.1
- [entwine](https://github.com/connormanning/entwine) v3.0.0
- [geoflow](https://github.com/geoflow3d/geoflow-bundle) v2024.03.08
- [pdal](https://github.com/PDAL/PDAL) v2.6.1
- [pdal-wrench](https://github.com/PDAL/wrench) v1.1
- [tyler](https://github.com/3DGI/tyler) v0.3.10
- [untwine](https://github.com/hobuinc/untwine) v1.10
- [lg](https://github.com/MBunel/lg) v0.2.1
- Some libs:
  - [laslib](https://github.com/LAStools/LAStools) v2.0.2
  - [laszip](https://github.com/LASzip/LASzip) v3.4.4
  - [libe57format](https://github.com/asmaloney/libE57Format) v3.1.1
  - [proj](https://proj.org/en/9.4/#) v9.4.0
  - [cgal](https://www.cgal.org/) v5.5.4
- Some rust packages:
  - [rust-proj-sys](https://crates.io/crates/proj-sys/) v0.23.2
  - [rust-proj](https://crates.io/crates/proj) v0.27.0
  - [rust-morton-encoding](https://crates.io/crates/morton-encoding) v2.0.1
