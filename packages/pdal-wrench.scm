(define-module (packages pdal-wrench)
  #:use-module (guix)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages geo)
  #:use-module (packages pdal))


(define-public pdal-wrench
  (package
    (name "pdal-wrench")
    (version "1.1")
    (source
     (origin
      (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PDAL/wrench")
             (commit "v1.1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1h645ynn2w07yr26dywlsi04q5w46c5d1w1zqfrh0g1j0dg03gn4"))))
    (inputs (list pdal gdal))
    (build-system cmake-build-system)
    (arguments
     (list
      #:build-type "Release"
      #:tests? #f))
    (home-page "https://github.com/PDAL/wrench")
    (synopsis "Collection of tools for processing points clouds")
    (description "TODO")
    (license license:gpl3+)))

