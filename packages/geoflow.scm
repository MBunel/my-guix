(define-module (packages geoflow)
  #:use-module (guix)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (packages laslib)
  #:use-module (gnu packages)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages image)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gl))

;; Define a CGAL package variant (only v5.2 is packaged)
(define-public cgal-55
  (package
    (inherit cgal)
    (version "5.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/CGAL/cgal/releases/download/v"
                           version "/CGAL-" version ".tar.xz"))
       (sha256
        (base32 "0qv9jj6wqvy665ss5ikwgx7lql023xhwjdq8k3b3hvnaab8p2lbs"))))))

;; Denine geoflow package
(define-public geoflow
  (package
    (name "geoflow")
    (version "2024.03.08")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/geoflow3d/geoflow-bundle")
             (commit "2024.03.08")
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0skwfvdcpkp2idb417pbfwr06zpzdnfz6rxb0053kkpiskggii9a"))))
    (inputs (list nlohmann-json
                  proj
                  glfw
                  libtiff
                  curl
                  gtk+-2
                  laslib
                  eigen
                  cgal-55
                  gmp
                  mpfr
                  boost
                  gdal
                  geos))
    (native-inputs (list pkg-config))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list
			   "-DGF_BUILD_GUI_FILE_DIALOGS=OFF"
			   "-DGF_BUILD_GUI=ON")
      #:build-type "Release"
      #:tests? #f))
    (home-page "https://github.com/geoflow3d/geoflow-bundle")
    (synopsis
     "A tool for reconstructing 3D building models from point clouds, fully automated, with high-detail. Free and open-source.")
    (description
     "A tool for reconstructing 3D building models from point clouds, fully automated, with high-detail. Free and open-source.")
    (license (list license:gpl3+ license:agpl3+ license:cc0))))
