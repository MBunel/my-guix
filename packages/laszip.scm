(define-module (packages laszip)
  #:use-module (guix)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))


(define-public laszip
  (package
    (name "laszip")
    (version "3.4.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/LASzip/LASzip")
             (commit "3.4.4")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1a0ass8wz1cd42mvdmmgp4lpaf0qpfn9blsilfskba3kmx9hpymz"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DLASZIP_BUILD_STATIC=NO")
      #:build-type "Release"
      ;; No tests writed
      #:tests? #f))
    (home-page "https://laszip.org/")
    (synopsis "Compression library for LAS files")
    (description
     "LASzip is a library for compress las files and uncompress laz files.")
    (license license:asl2.0)))
