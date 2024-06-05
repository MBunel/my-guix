(define-module (packages tyler)
  #:use-module (guix)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  ;; Guix packages
  #:use-module (gnu packages)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages python)
  ;; My-packages
  #:use-module (packages geoflow)
  #:use-module (packages geo)
  #:use-module (packages crates-io))

;; Define tyler package
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
       (patches (search-patches "packages/patches/tyler-config.patch"))
       (sha256
        (base32 "0x69ah00fk94bgrc0va9x35dzbyr9kdlqfxwfwd1f42n9qj19506"))))
    (inputs (list sqlite proj-9.4 clang python))
    (propagated-inputs (list geoflow))
    (native-inputs (list pkg-config cmake))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bitvec" ,rust-bitvec-1)
                       ("rust-bincode" ,rust-bincode-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-env-logger" ,rust-env-logger-0.10)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-morton-encoding" ,rust-morton-encoding-2)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-proj-sys" ,rust-proj-sys-0.23)
                       ("rust-rayon" ,rust-rayon-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-serde-repr" ,rust-serde-repr-0.1)
                       ("rust-subprocess" ,rust-subprocess-0.2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-walkdir" ,rust-walkdir-2))
       #:tests? #f
       #:phases (modify-phases %standard-phases
                  ;; Remove uses of "CARGO_MANIFEST_DIR" env var
                  (add-after 'unpack 'patch-resources-folder
                    (lambda* (#:key inputs #:allow-other-keys)
                      (substitute* '("src/main.rs" "src/formats.rs"
                                     "src/parser.rs")
                        (("CARGO_MANIFEST_DIR")
                         "out"))))
                  ;; Copy resources in ./resources folder
                  (add-after 'install 'copy-resources
                    (lambda* (#:key inputs outputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (resources (string-append out "/resources")))
                        (mkdir-p resources)
                        (copy-recursively "resources" resources)))))))
    (home-page "https://github.com/3DGI/tyler")
    (synopsis "Create tiles from 3D city objects encoded as CityJSONFeatures")
    (description
     "Create tiles from 3D city objects encoded as @code{CityJSONFeatures}")
    (license (list license:asl2.0))))
