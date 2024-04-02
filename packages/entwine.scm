(define-module (packages entwine)
  #:use-module (guix)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages geo)
  #:use-module (packages pdal))


(define-public entwine
  (package
    (name "entwine")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/connormanning/entwine")
             (commit "3.0.0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19l18nyc23ch7j8m72dq6hn8c9jk2d8fmq4spq7yq66cndcacsqa"))))
    (inputs (list pdal curl openssl zstd))
    (build-system cmake-build-system)
    (arguments
     (list
      #:build-type "Release"
      #:tests? #f))
    (home-page "https://entwine.io")
    (synopsis "TODO")
    (description
     "Entwine is a data organization library for massive point clouds, designed
to conquer datasets of trillions of points as well as desktop-scale point clouds.
Entwine can index anything that is PDAL-readable, and can read/write to a 
variety of sources like S3 or Dropbox. Builds are completely lossless, so no
points, metadata, or precision will be discarded even for terabyte-scale
datasets.")
    (license license:gpl3+)))

