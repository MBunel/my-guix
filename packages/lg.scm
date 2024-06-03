(define-module (packages lg)
  #:use-module (guix)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module (gnu packages crates-io)
  #:use-module (packages crates-io)
  #:use-module ((guix licenses) #:prefix license:))


(define-public lg
  (package
    (name "lg")
    (version "0.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MBunel/lg")
             (commit "v0.2.1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0gl75q72i3j8gq9hrk24kq8sa70xsyxqdjq0v26c0jx98577gisb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-las" ,rust-las-0.8)
                       ("rust-geo" ,rust-geo-0.28)
                       ("rust-geo-types" ,rust-geo-types-0.7)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-semver" ,rust-semver-1)
                       ("rust-wkt" ,rust-wkt-0.10)
                       ("rust-regex" ,rust-regex-1)
                       ("rust-walkdir" ,rust-walkdir-2)
                       ("rust-uuid" ,rust-uuid-1.8)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-simple-logger" ,rust-simple-logger-4)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-env-logger" ,rust-env-logger-0.11))))
    (home-page "https://github.com/MBunel/lg")
    (synopsis "A las file filter")
    (description
     "lg is a command line tool to filter asprs's las and laz files using thier header")
    (license license:gpl2)))
