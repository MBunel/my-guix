(define-module (packages laszip)
  #:use-module (guix)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages time)
  #:use-module (gnu packages check)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages maths) 
  #:use-module (gnu packages curl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages simulation)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science))


(define-public laszip
  (package
    (name "laszip")
    (version "3.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/LASzip/LASzip")
             (commit "3.4.3")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09lcsgxwv0jq50fhsgfhx0npbf1zcwn3hbnq6q78fshqksbxmz7m"))))
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
