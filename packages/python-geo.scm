(define-module (packages python-geo)
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

(define-public python-pdal
  (package
    (name "python-pdal")
    (version "3.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pdal" version))
       (sha256
        "01rqav80hhwrd62wk9fsnafk8y340awfsjnmklimpx2d7w8wphhb")))
    (build-system python-build-system)
    (native-inputs (list python-scikit-build pybind11))
    (propagated-inputs (list pdal
                             python-numpy
                             python-pandas
                             python-meshio
                             python-dateutils
                             python-pytz))
    (arguments
     (list
      #:tests? #f))
    (home-page "https://pdal.io")
    (synopsis "Python bidings for PDAL")
    (description "Todo")
    (license license:gpl3+)))

(define-public python-pdal-plugins
  (package
    (name "python-pdal-plugins")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pdal-plugins" version))
       (sha256
        "0jk41mq9sf9yhkyl0yiz3h5g0w0p0qc5xf6rd458pv50cvkxqigs")))
    (build-system python-build-system)
    (native-inputs (list python-scikit-build))
    (propagated-inputs (list python-pdal))
    (arguments
     (list
      #:tests? #f))
    (home-page "https://laspy.readthedocs.io/en/latest/")
    (synopsis "Point cloud processing made easy!")
    (description "TODO")
    (license license:bsd-2)))
