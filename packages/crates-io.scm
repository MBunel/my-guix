(define-module (packages crates-io)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages crates-web)
  #:use-module (gnu packages crates-crypto)
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

(define-public rust-proj-0.27
  (package
    (name "rust-proj")
    (version "0.27.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "proj" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1aw5236mbv2x6ggyzhzmpq9dhyzhb0248y3fqwiblvlnv0587lbs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-geo-types" ,rust-geo-types-0.7)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-proj-sys" ,rust-proj-sys-0.23)
                       ("rust-reqwest" ,rust-reqwest-0.11)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/georust/proj")
    (synopsis "High-level Rust bindings for the latest stable version of PROJ")
    (description
     "High-level Rust bindings for the latest stable version of PROJ")
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

(define-public rust-laz-0.9
  (package
    (name "rust-laz")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "laz" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qyjmjbcvgllx03kjkk0hdj8iffj2jadmza3q4a35vyylblxmrnd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-rayon" ,rust-rayon-1))))
    (home-page "https://github.com/tmontaigu/laz-rs")
    (synopsis "Rust port of Laszip compression. of the LAS format")
    (description "Rust port of Laszip compression.  of the LAS format")
    (license license:asl2.0)))

(define-public rust-las-0.8
  (package
    (name "rust-las")
    (version "0.8.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "las" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1msa0iaz5pb09vxwi2x9qyjhfmafciw6py7yxd26853nkk96j4mw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-byteorder" ,rust-byteorder-1)
                       ("rust-chrono" ,rust-chrono-0.4)
                       ("rust-laz" ,rust-laz-0.9)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-uuid" ,rust-uuid-1))
       #:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.5))))
    (home-page "https://github.com/gadomski/las-rs")
    (synopsis
     "Read and write point clouds stored in the ASPRS las file format.")
    (description
     "Read and write point clouds stored in the ASPRS las file format.")
    (license license:expat)))

(define-public rust-wkt-0.10
  (package
    (name "rust-wkt")
    (version "0.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "wkt" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hcg3jxnnhk2d1gq5cd2iswa4nd7cp4nfsmsx1s7k4pqh4kjbhn3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-geo-types" ,rust-geo-types-0.7)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/georust/wkt")
    (synopsis "Rust read/write support for well-known text (WKT)")
    (description "Rust read/write support for well-known text (WKT)")
    (license (list license:expat license:asl2.0))))

(define-public rust-spade-2
  (package
    (name "rust-spade")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "spade" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h68d205s3cida0r1iba9shfxqhlbzy9gaa1gr4l5r4s2q4sh82v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-hashbrown" ,rust-hashbrown-0.14)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-robust" ,rust-robust-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/Stoeoef/spade")
    (synopsis "Delaunay triangulations for the rust ecosystem")
    (description "Delaunay triangulations for the rust ecosystem")
    (license (list license:expat license:asl2.0))))

(define-public rust-robust-1
  (package
    (name "rust-robust")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "robust" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0c5fhzk7dc1ci9dyjy0xrv6nlrkbmprlj1lqkvrqhs3dbymadx6b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ieee754" ,rust-ieee754-0.2))))
    (home-page "https://github.com/georust/robust")
    (synopsis
     "Robust adaptive floating-point predicates for computational geometry")
    (description
     "Robust adaptive floating-point predicates for computational geometry")
    (license (list license:expat license:asl2.0))))

(define-public rust-libm-0.2
  (package
    (name "rust-libm")
    (version "0.2.8")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "libm" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n4hk1rs8pzw8hdfmwn96c4568s93kfxqgcqswr7sajd2diaihjf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-rand" ,rust-rand-0.6))))
    (home-page "https://github.com/rust-lang/libm")
    (synopsis "libm in pure Rust")
    (description "libm in pure Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-accurate-0.3
  (package
    (name "rust-accurate")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "accurate" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gn07dnxp3vcnccx001rdzxwpcqhzvcw0vmm1psnrvhqq85ry82g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-ieee754" ,rust-ieee754-0.2)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-rayon" ,rust-rayon-1))))
    (home-page "https://github.com/bsteinb/accurate")
    (synopsis "(more or less) accurate floating point algorithms")
    (description "(more or less) accurate floating point algorithms")
    (license (list license:expat license:asl2.0))))

(define-public rust-geographiclib-rs-0.2
  (package
    (name "rust-geographiclib-rs")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "geographiclib-rs" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0q0rg3wm4q06qqvhvp1dc5qkcwywnvnhm3ha9cip1708z22fvrg6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-accurate" ,rust-accurate-0.3)
                       ("rust-libm" ,rust-libm-0.2))))
    (home-page "https://github.com/georust/geographiclib-rs")
    (synopsis "A port of geographiclib in Rust.")
    (description "This package provides a port of geographiclib in Rust.")
    (license license:expat)))

(define-public rust-rstar-0.10
  (package
    (name "rust-rstar")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rstar" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "16imy7lrm3y3kpgh4xi9amfzqfwmyh3y1nf6g6pdiqx1amb4cf8z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heapless" ,rust-heapless-0.7)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/georust/rstar")
    (synopsis "An R*-tree spatial index")
    (description "An R*-tree spatial index")
    (license (list license:expat license:asl2.0))))

(define-public rust-hash32-0.3
  (package
    (name "rust-hash32")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "hash32" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01h68z8qi5gl9lnr17nz10lay8wjiidyjdyd60kqx8ibj090pmj7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-byteorder" ,rust-byteorder-1))))
    (home-page "https://github.com/japaric/hash32")
    (synopsis "32-bit hashing algorithms")
    (description "32-bit hashing algorithms")
    (license (list license:expat license:asl2.0))))

(define-public rust-heapless-0.8
  (package
    (name "rust-heapless")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "heapless" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1b9zpdjv4qkl2511s2c80fz16fx9in4m9qkhbaa8j73032v9xyqb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-defmt" ,rust-defmt-0.3)
                       ("rust-hash32" ,rust-hash32-0.3)
                       ("rust-portable-atomic" ,rust-portable-atomic-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1)
                       ("rust-ufmt-write" ,rust-ufmt-write-0.1))))
    (home-page "https://github.com/japaric/heapless")
    (synopsis
     "`static` friendly data structures that don't require dynamic memory allocation")
    (description
     "`static` friendly data structures that don't require dynamic memory allocation")
    (license (list license:expat license:asl2.0))))

(define-public rust-rstar-0.12
  (package
    (name "rust-rstar")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rstar" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "023hzj571pk9i7qzya6h5wvn60l51mqmlzh9rg8ficf7jkmiacqk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heapless" ,rust-heapless-0.8)
                       ("rust-mint" ,rust-mint-0.5)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/georust/rstar")
    (synopsis "An R*-tree spatial index")
    (description "An R*-tree spatial index")
    (license (list license:expat license:asl2.0))))

(define-public rust-rstar-0.11
  (package
    (name "rust-rstar")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rstar" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mlqq0mdcs8zxinsn5zhh3hxw7dm6pzh0v7h5798f8ksxc9164bk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-heapless" ,rust-heapless-0.7)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-smallvec" ,rust-smallvec-1))))
    (home-page "https://github.com/georust/rstar")
    (synopsis "An R*-tree spatial index")
    (description "An R*-tree spatial index")
    (license (list license:expat license:asl2.0))))

(define-public rust-geo-types-0.7
  (package
    (name "rust-geo-types")
    (version "0.7.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "geo-types" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0qbd7csq20krd51fbdvhzn2wwyplw1d0l87dpipkf3vjwmjn1wcz"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-approx" ,rust-approx-0.4)
                       ("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-rstar" ,rust-rstar-0.11)
                       ("rust-rstar" ,rust-rstar-0.12)
                       ("rust-rstar" ,rust-rstar-0.10)
                       ("rust-rstar" ,rust-rstar-0.9)
                       ("rust-rstar" ,rust-rstar-0.8)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/georust/geo")
    (synopsis "Geospatial primitive data types")
    (description "Geospatial primitive data types")
    (license (list license:expat license:asl2.0))))

(define-public rust-float-next-after-1
  (package
    (name "rust-float-next-after")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "float_next_after" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1s7ikn69b394frihag05b0qcw9i9y04qanlhp5c8sjrw70bcrxwb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://gitlab.com/bronsonbdevost/next_afterf")
    (synopsis "A trait for native rust f64/f32 nextafter")
    (description
     "This package provides a trait for native rust f64/f32 nextafter")
    (license license:expat)))

(define-public rust-earcutr-0.4
  (package
    (name "rust-earcutr")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "earcutr" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00dddrgzsrkbv8ifsmakcxwxrdzzgia7i6cy81y6imw5kbapw4kr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-itertools" ,rust-itertools-0.11)
                       ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/frewsxcv/earcutr/")
    (synopsis "port of MapBox's earcut triangulation code to Rust language")
    (description
     "port of @code{MapBox's} earcut triangulation code to Rust language")
    (license license:isc)))

(define-public rust-geo-0.28
  (package
    (name "rust-geo")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "geo" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "00a5113izs2276ra1n52km958wnv0nhd5p10lsgj8s9aj5izc4gq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-earcutr" ,rust-earcutr-0.4)
                       ("rust-float-next-after" ,rust-float-next-after-1)
                       ("rust-geo-types" ,rust-geo-types-0.7)
                       ("rust-geographiclib-rs" ,rust-geographiclib-rs-0.2)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-num-traits" ,rust-num-traits-0.2)
                       ("rust-proj" ,rust-proj-0.27)
                       ("rust-robust" ,rust-robust-1)
                       ("rust-rstar" ,rust-rstar-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-spade" ,rust-spade-2))
       #:cargo-development-inputs (("rust-approx" ,rust-approx-0.4)
                                   ("rust-criterion" ,rust-criterion-0.4)
                                   ("rust-pretty-env-logger" ,rust-pretty-env-logger-0.4)
                                   ("rust-rand" ,rust-rand-0.8)
                                   ("rust-rand-distr" ,rust-rand-distr-0.4)
                                   ("rust-wkt" ,rust-wkt-0.10))))
    (home-page "https://github.com/georust/geo")
    (synopsis "Geospatial primitives and algorithms")
    (description "Geospatial primitives and algorithms")
    (license (list license:expat license:asl2.0))))

(define-public rust-uuid-1.8
  (package
    (name "rust-uuid")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "uuid" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1h7wks153j08xmdk06wnza3is8pn6j37hihd3kfv95xsxrzwz0x1"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-atomic" ,rust-atomic-0.5)
                       ("rust-borsh" ,rust-borsh-1)
                       ("rust-borsh-derive" ,rust-borsh-derive-1)
                       ("rust-bytemuck" ,rust-bytemuck-1)
                       ("rust-getrandom" ,rust-getrandom-0.2)
                       ("rust-md-5" ,rust-md-5-0.10)
                       ("rust-rand" ,rust-rand-0.8)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-sha1-smol" ,rust-sha1-smol-1)
                       ("rust-slog" ,rust-slog-2)
                       ("rust-uuid-macro-internal" ,rust-uuid-macro-internal-1)
                       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                       ("rust-zerocopy" ,rust-zerocopy-0.6))
       #:cargo-development-inputs (("rust-bincode" ,rust-bincode-1)
                                   ("rust-rustversion" ,rust-rustversion-1)
                                   ("rust-serde-derive" ,rust-serde-derive-1)
                                   ("rust-serde-json" ,rust-serde-json-1)
                                   ("rust-serde-test" ,rust-serde-test-1)
                                   ("rust-trybuild" ,rust-trybuild-1)
                                   ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
                                   ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis "A library to generate and parse UUIDs.")
    (description
     "This package provides a library to generate and parse UUIDs.")
    (license (list license:asl2.0 license:expat))))

