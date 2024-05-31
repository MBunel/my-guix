(define-module (packages geo)
  #:use-module (guix)
  #:use-module (gnu packages geo))


;; Define a proj package variant (only v9.3 is packaged)
(define-public proj-9.4
  (package
    (inherit proj)
    (version "9.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://download.osgeo.org/proj/proj-"
                           version ".tar.gz"))
       (sha256
        (base32 "05nj7f1sh6gvwfs77w9r9fc1flczjqivdg8k64p6pzi22sdv2hrn"))))))