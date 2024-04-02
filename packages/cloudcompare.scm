(define-module (packages cloudcompare)
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
  #:use-module (packages pdal)
  #:use-module (packages libe57format)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages simulation)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science))


(define-public cloudcompare
  (package
    (name "cloudcompare")
    (version "2.12.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/CloudCompare/CloudCompare")
             (commit "v2.12.4")
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0js0pzdhcqi56iyll76iv476rqvrabrih55y0j31bjfz5yypy3xd"))))
    (inputs (list qtbase-5
                  qtsvg-5
                  qtlocation
                  qttools-5
                  gdal
                  pdal
                  xerces-c
                  libe57format
                  zlib))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list
                           ;; Options
                           "-DOPTION_BUILD_CCVIEWER=NO"
                           "-DBUILD_TESTING=ON"
                           "-DOPTION_USE_SHAPE_LIB=YES"
                           "-DOPTION_USE_DXF_LIB=YES"
                           "-DOPTION_USE_GDAL=YES"
                           ;; Shaders
                           ;; At least a shader is needed
                           "-DPLUGIN_GL_QEDL=YES"
                           "-DPLUGIN_GL_QSSAO=YES"
                           ;; IO
                           "-DPLUGIN_IO_QCORE=YES"
                           "-DPLUGIN_IO_QADDITIONAL=NO"
                           "-DPLUGIN_IO_QCSV_MATRIX=NO"
                           ;; No guix package for DRACO
                           "-DPLUGIN_IO_QDRACO=NO"
                           "-DPLUGIN_IO_QE57=YES"
                           ;; No guix package for FBX
                           "-DPLUGIN_IO_QFBX=NO"
                           ;; laszip will replace PDAL in CloudCompare 2.13
                           ;; "-DPLUGIN_IO_QLAS=NO"
                           "-DPLUGIN_IO_QPDAL=YES"
                           "-DPLUGIN_IO_QPHOTOSCAN=YES"
                           ;; No guix package for Riegl RDBlib
                           "-DPLUGIN_IO_QRDB=NO"
                           "-DPLUGIN_IO_QSTEP=NO"
                           ;; Plugins
                           "-DPLUGIN_STANDARD_QANIMATION=YES"
                           "-DQANIMATION_WITH_FFMPEG_SUPPORT=NO"
                           "-DPLUGIN_STANDARD_QBROOM=YES"
                           ;; Compilation error
                           "-DPLUGIN_STANDARD_QCANUPO=YES"
                           "-DPLUGIN_STANDARD_QCLOUDLAYERS=YES"
                           "-DPLUGIN_STANDARD_QCOLORIMETRIC_SEGMENTER=YES"
                           "-DPLUGIN_STANDARD_QCOMPASS=YES"
                           ;; Only for Windows at the moment
                           "-DPLUGIN_STANDARD_QCORK=NO"
                           "-DPLUGIN_STANDARD_QCSF=YES"
                           "-DPLUGIN_STANDARD_QFACETS=YES"
                           ;; Error with eigen
                           "-DPLUGIN_STANDARD_QHOUGH_NORMALS=NO"
                           "-DPLUGIN_STANDARD_QHPR=YES"
                           ;; Need qtWebSocket engine
                           "-DPLUGIN_STANDARD_QJSONRPC=NO"
                           "-DPLUGIN_STANDARD_QM3C2=YES"
                           ;; Need PCL lib
                           "-DPLUGIN_STANDARD_MASONRY_QAUTO_SEG=NO"
                           "-DPLUGIN_STANDARD_MASONRY_QMANUAL_SEG=NO"
                           "-DPLUGIN_STANDARD_QPCL=NO"
                           ;; Need CGAL
                           "-DPLUGIN_STANDARD_QMESH_BOOLEAN=NO"
                           "-DPLUGIN_STANDARD_QMPLANE=YES"
                           "-DPLUGIN_STANDARD_QPCV=NO"
                           "-DPLUGIN_STANDARD_QPOISSON_RECON=YES"
                           "-DPLUGIN_STANDARD_QRANSAC_SD=YES"
                           "-DPLUGIN_STANDARD_QSRA=YES")
      #:build-type "Release"
      #:tests? #f))
    (home-page "https://cloudcompare.org/")
    (synopsis "A viewer of 3D points clouds")
    (description "TODO")
    (license license:gpl2)))
