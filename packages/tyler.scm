(define-module (packages tyler)
  #:use-module (guix)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages gl))


;; Denine tyler package
(define-public tyler
  (package
    (name "tyler")
    (version "0.3.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/3DGI/tyler")
             (commit "v0.3.10")
             (recursive? #f)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0x69ah00fk94bgrc0va9x35dzbyr9kdlqfxwfwd1f42n9qj19506"))))
    ;;(inputs (list proj-sys-0.23))
    (native-inputs (list pkg-config))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("proj-sys" ,proj-sys-0.23))

       #:cargo-test-flags
       (list "--release" "--"
             "--skip=test_apparent_size")
       #:install-source? #f))
    (home-page "https://github.com/geoflow3d/geoflow-bundle")
    (synopsis
     "A tool for reconstructing 3D building models from point clouds, fully automated, with high-detail. Free and open-source.")
    (description
     "A tool for reconstructing 3D building models from point clouds, fully automated, with high-detail. Free and open-source.")
    (license (list license:gpl3+ license:agpl3+ license:cc0))))
