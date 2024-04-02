(define-module (packages rust-geo)
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



(define-public proj-sys-0.23
  (package
    (name "proj-sys")
    (version "0.23.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri name version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v4gcf9wa4icdifsysrchbqrr5k5bknpngrhdnjy3z8p3vxg86v0"))))
    (inputs (list proj clang))
    (native-inputs (list pkg-config))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-bindgen" ,rust-bindgen-0.66)
	("cmake" ,rust-cmake-0.1)
	("tar" ,rust-tar-0.4))))
    (home-page "https://github.com/geoflow3d/geoflow-bundle")
    (synopsis
     "Todo")
    (description
     "todo")
    (license (list license:gpl3+ license:agpl3+ license:cc0))))
