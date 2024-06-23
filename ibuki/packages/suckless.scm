(define-module (ibuki packages suckless)
  #:use-module (gnu packages suckless)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix gexp)

  #:use-module (ibuki patches suckless))

(define-public st-ibuki
  (package
    (inherit st)
    (name "st-ibuki")
    (version "0.9.2")
    (source
      (origin
	(method url-fetch)
	(uri (string-append "https://dl.suckless.org/st/st-"
			    version ".tar.gz"))
       (sha256
        (base32 "0js9z5kn8hmpxzfmb2g6zsy28zkpg88j3wih5wixc89b8x7ms8bb"))
       (patches (list st-gruvbox-dark))))))

(define-public dwm-ibuki
  (package
    (inherit dwm)
    (name "dwm-ibuki")
    (version "6.5")
    (source (origin
	      (method url-fetch)
	      (uri (string-append "https://dl.suckless.org/dwm/dwm-"
				  version ".tar.gz"))
	      (sha256
		(base32 "0acpl05rg6rg6nrg3rv4kp388iqzp1n6dhin30a97yzjm6zrxmr1"))))))
