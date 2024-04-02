(define-module (packages untwine)
  #:use-module (guix)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages geo)
  #:use-module (packages pdal))

(define-public untwine
  (package
    (name "untwine")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hobuinc/untwine")
             (commit "1.1.0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "04mp49ixr7k1yq9ssa46gxlwp650kfafng0id29zrpv5h2491kj2"))))
    (inputs (list pdal))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DHELLO_WHO=Guix")
      #:build-type "Release"
      #:tests? #f))
    (home-page "https://github.com/hobuinc/untwine")
    (synopsis "Creation of COPC and Entwine files")
    (description
     "Untwine is software for creating Entwine Point Tile (EPT) or
Cloud Optimized Point Cloud (COPC) web services from PDAL-readable point cloud
data sources. It provides an alternative processing approach than the Entwine
software, but the output is expected to be compatible EPT/COPC.")
    (license license:gpl3+)))

