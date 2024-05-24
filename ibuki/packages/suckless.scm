(define-module (ibuki packages suckless)
  #:use-module (gnu packages suckless)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix gexp)

  #:export (thaenz-st)
  #:export (thaenz-dwm))

(define-public thaenz-st
  (package
    (inherit st)
    (name "thaenz-st")
    (version "0.9.2")
    (source
      (origin
	(method url-fetch)
	(uri (string-append "https://dl.suckless.org/st/st-"
			    version ".tar.gz"))
       (sha256
        (base32 "0js9z5kn8hmpxzfmb2g6zsy28zkpg88j3wih5wixc89b8x7ms8bb"))
       (patches (list (local-file "patches/st-gruvbox-dark-0.8.5.diff")))))))

(define-public thaenz-dwm
  (package
    (inherit dwm)
    (name "thaenz-dwm")
    (version "6.5")
    (source (origin
	      (method url-fetch)
	      (uri (string-append "https://dl.suckless.org/dwm/dwm-"
				  version ".tar.gz"))
	      (sha256
		(base32 "0acpl05rg6rg6nrg3rv4kp388iqzp1n6dhin30a97yzjm6zrxmr1"))))))
