(define-module (packages lg)
  #:use-module (guix)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))


(define-public lg
  (package
    (name "lg")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MBunel/lg")
             (commit "v0.1.0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ms3j4nsv805ynyy8afqbcg07fgzpmasn7sn46zvdfjhkdjyxg9m"))))
   ;;(inputs (list rust-clap))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-las" ,rust-las)
		       ("rust-geo" ,rust-geo)
		       ("rust-geo-types" ,rust-geo-types)
		       ("rust-clap" ,rust-clap)
		       ("rust-semver" ,rust-semver)
		       ("rust-wkt" ,rust-wkt)
		       ("rust-regexp" ,rust-regexp)
		       ("rust-walkdir" ,rust-walkdir)
		       ("rust-uuid" ,rust-uuid)
                       ("rust-chrono" ,rust-chrono-0.1))))
    (home-page "https://github.com/MBunel/lg")
    (synopsis "A las file filter")
    (description "TODO")
    (license license:gpl2)))
