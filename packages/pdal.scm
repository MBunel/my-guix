(define-module (packages pdal)
  #:use-module (guix)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages time)
  #:use-module (gnu packages check)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages maths) 
  #:use-module (gnu packages curl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages simulation)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science))

(define-public pdal
  (package
    (name "pdal")
    (version "2.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PDAL/PDAL")
             (commit "2.6.1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04zdz0kka7n0yf2fbgqkrsa0jh0zql3a1x1cpsj3h5jv16ygkyla"))))
    ;; (native-inputs (list cmake))
    (inputs (list gdal
                  libgeotiff
                  zlib
                  `(,zstd "lib")
                  `(,zstd "static")
                  libxml2
                  openssl
                  curl
                  xerces-c
                  hdf5
                  ))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list
                           ;; Plugins
                           "-DBUILD_PLUGIN_CPD=OFF"
                           ;; No guix package for DRACO
                           "-DBUILD_PLUGIN_DRACO=OFF"
                           "-DBUILD_PLUGIN_E57=ON"
                           "-DBUILD_PLUGIN_FBX=OFF"
                           "-DBUILD_PLUGIN_HDF=ON"
                           "-DBUILD_PLUGIN_I3S=OFF"
                           "-DBUILD_PLUGIN_ICEBRIDGE=OFF"
                           "-DBUILD_PLUGIN_MATLAB=OFF"
                           "-DBUILD_PLUGIN_MBIO=OFF"
                           "-DBUILD_PLUGIN_NITF=OFF"
                           "-DBUILD_PLUGIN_OPENSCENEGRAPH=OFF"
                           "-DBUILD_PLUGIN_PGPOINTCLOUD=OFF"
                           "-DBUILD_PLUGIN_RDBLIB=OFF"
                           "-DBUILD_PLUGIN_RIVLIB=OFF"
                           "-DBUILD_PLUGIN_TEASER=OFF"
                           "-DBUILD_PLUGIN_TILEDB=OFF"
                           "-DBUILD_PLUGIN_TRAJECTORY=OFF"
                           ;; Tools
                           "-DBUILD_TOOLS_NITFWRAP=OFF"
                           ;; Tests
                           "-DBUILD_I3S_TESTS=OFF"
                           "-DBUILD_PGPOINTCLOUD_TESTS=OFF"
                           "-DBUILD_PIPELINE_TESTS=OFF"
                           ;;
                           "-DWITH_ABSEIL=OFF"
                           "-DWITH_COMPLETION=OFF"
                           "-DWITH_LZMA=ON"
                           "-DWITH_TESTS=ON"
                           "-DWITH_ZLIB=ON"
                           "-DWITH_ZSTD=ON")
      #:build-type "Release"
      #:tests? #f))
    ;; Disable tests with data dowload
    (home-page "https://pdal.io")
    (synopsis "Point Data Abstraction Library")
    (description "PDAL provides")
    (license license:gpl3+)))

(define-public pdal-2.4.0
  (package/inherit pdal
    (name "pdal")
    (version "2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PDAL/PDAL")
                    (commit "2.4.0")))
              (file-name (git-file-name name version))
              (sha256 (base32
                       "1k4k2yrn5cssv91h84zzmxk095d44pl3757kfsqxcfbsxbh6xlf3"))))))
