(define-module (packages micmac)
  #:use-module (guix)
  #:use-module (guix utils)
  #:use-module (guix build utils)
  #:use-module (guix build gnu-build-system)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages image)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages xorg))


;; Note: le paquet compile bien, mais ne s'installe pas comme il faut
;; Piste: Essayer d'identifier quelle est la phase qui pose problème en les désactivant
;; une à une
(define-public micmac
  (package
    (name "micmac")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/micmacIGN/micmac.git")
             (commit "v1.1.1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1s0q460y87wb6p9ns4r0ymns8jm7lj0rw3vw13vcr4snigi22bvh"))))
    (native-inputs (list cmake libx11))
    (inputs (list gnu-make imagemagick exiv2 proj.4 perl-image-exiftool))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DHELLO_WHO=G")
      #:build-type "Release"
      #:tests? #f
      #:phases #~(modify-phases %standard-phases
                   (add-after 'install 'pnl
                     (lambda* (#:key outputs srcdir #:allow-other-keys #:rest
                               args)
                       ;; Le Makefile du paquet ne fournit pas de règle « install »
                       ;; alors on le fait nous-mêmes.
                       (let* ((out (assoc-ref outputs "out"))
                              (bin (string-append out "/bin"))
                              (data (string-append out "/data"))
                              (inc (string-append out "/include")))
                         (mkdir-p bin)
                         (mkdir-p inc)
                         (mkdir-p data)
                         ;; Copy include files
                         (copy-recursively "../source/include" inc)
                         ;; Copy data files
                         (copy-recursively "../source/data" data)
                         ;; Copy binary files
                         (for-each (lambda (binary)
                                     (install-file binary bin))
                                   (find-files "../source/bin"
                                               (lambda (file stat)
                                                 (executable-file? file))))))))))
    (home-page "https://micmac.ensg.eu/index.php/Accueil")
    (synopsis "MicMac a FOSS photogrammetry software")
    (description "Todo")
    (license license:cecill-b)))

;; La V2 du packet n'est pas dans une branche a part, mais dans un dossier séparé
(define-public micmac-v2
  (package
    (name "micmac-2")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/micmacIGN/micmac.git")
             (commit "v1.1.1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1s0q460y87wb6p9ns4r0ymns8jm7lj0rw3vw13vcr4snigi22bvh"))))
    (native-inputs (list cmake libx11))
    (inputs (list gnu-make imagemagick exiv2 proj.4 perl-image-exiftool))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DHELLO_WHO=G")
      #:build-type "Release"
      #:tests? #f
      #:phases #~(modify-phases %standard-phases
                   (add-after 'build 'build-mmv2
                     (lambda* _
                       (with-directory-excursion "../source/MMVII/bin"
                         (invoke "make ./"))
                       ))
                   (add-after 'install 'pnl
                     (lambda* (#:key outputs srcdir #:allow-other-keys #:rest
                               args)
                       ;; Le Makefile du paquet ne fournit pas de règle « install »
                       ;; alors on le fait nous-mêmes.
                       (let* ((out (assoc-ref outputs "out"))
                              (bin (string-append out "/bin"))
                              (data (string-append out "/data"))
                              (inc (string-append out "/include")))
                         (mkdir-p bin)
                         (mkdir-p inc)
                         (mkdir-p data)
                         ;; Copy include files
                         (copy-recursively "../source/include" inc)
                         ;; Copy data files
                         (copy-recursively "../source/data" data)
                         ;; Copy binary files
                         (for-each (lambda (binary)
                                     (install-file binary bin))
                                   (find-files "../source/bin"
                                               (lambda (file stat)
                                                 (executable-file? file))))))))))
    (home-page "https://micmac.ensg.eu/index.php/Accueil")
    (synopsis "MicMac a FOSS photogrammetry software")
    (description "Todo")
    (license license:cecill-b)))
