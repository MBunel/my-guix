(define-module (packages libe57format)
  #:use-module (guix)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages check)
  #:use-module (gnu packages xml))

(define-public libe57format
  (package
    (name "libe57format")
    (version "3.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/asmaloney/libE57Format")
             (commit "v3.1.1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bwaqy5va3f4hkm8lgkp9bzridf8nssl6wy81nvfkhyqivvcs8qa"))))
    (inputs (list xerces-c))
    (native-inputs (list googletest))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DE57_BUILD_TEST=NO")
      #:build-type "Release"
      #:tests? #f))
    (home-page "https://github.com/asmaloney/libE57Format")
    (synopsis "Libray for read and write E57 file format")
    (description "Todo")
    (license (list license:boost1.0 license:expat))))
