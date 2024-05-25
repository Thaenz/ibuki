(define-module (ibuki patches suckless)
  #:use-module (guix packages)
  #:use-module (guix download))

(define-public st-gruvbox-dark
  (let ((version "0.8.5"))
    (origin
      (method url-fetch)
      (uri (string-append "http://st.suckless.org/patches/gruvbox"
			  "/st-gruvbox-dark-" version ".diff"))
      (sha256
	(base32 "0jvn0i0fl0w3c8dcmwyh9w19g3hsi22cqmyqly5zjzjwjhc8qnjv")))))
