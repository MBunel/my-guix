(define-module (packages crates-io)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages llvm)
  #:use-module (packages geo)
  #:use-module ((guix licenses)
                #:prefix license:))

(define-public rust-proj-sys-0.23
  (package
    (name "rust-proj-sys")
    (version "0.23.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proj-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1v4gcf9wa4icdifsysrchbqrr5k5bknpngrhdnjy3z8p3vxg86v0"))))
    (build-system cargo-build-system)
    (inputs (list clang))
    (propagated-inputs (list proj-9.4))
    (native-inputs (list cmake pkg-config))
    (arguments
     `(#:cargo-inputs (("rust-bindgen" ,rust-bindgen-0.66)
                       ("rust-cmake" ,rust-cmake-0.1)
                       ("rust-flate2" ,rust-flate2-1)
                       ("rust-pkg-config" ,rust-pkg-config-0.3)
                       ("rust-tar" ,rust-tar-0.4))))
    (home-page "https://github.com/georust/proj")
    (synopsis "Rust bindings for PROJ v9.2.x")
    (description "Rust bindings for PROJ v9.2.x")
    (license (list license:expat license:asl2.0))))

(define-public rust-morton-encoding-2
  (package
    (name "rust-morton-encoding")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "morton-encoding" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1j1ng4idqjds3nspx4b58qhhslkknkij302rljccsy55j8yrav7n"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num" ,rust-num-0.2)
                       ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/DoubleHyphen/morton-encoding")
    (synopsis "A crate for encoding and decoding Morton (\"Z-order\") keys.")
    (description
     "This package provides a crate for encoding and decoding Morton (\"Z-order\") keys.")
    (license (list license:expat license:asl2.0))))