(define-module (packages laslib)
  #:use-module (guix)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages image)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gl))

;; Define a laslib package
(define-public laslib
  (package
    (name "laslib")
    (version "v2.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/LAStools/LAStools")
             (commit "v2.0.2")
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1my08asfpc539qchp2mifkc75kfh13z40d10rz4xq65lhy9bighw"))))
    (inputs (list eigen))
    ;; (native-inputs (list pkg-config))
    (build-system cmake-build-system)
    (arguments
     (list
      #:build-type "Release"
      #:tests? #f))
    (home-page "https://github.com/LAStools/LAStools")
    (synopsis "Free part of lastools")
    (description "Free part of lastools")
    (license (list license:lgpl2.1))))
