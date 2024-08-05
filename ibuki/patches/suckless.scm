(define-module (ibuki patches suckless)
  #:use-module (guix packages)
  #:use-module (guix download))

(define-public st-gruvbox-dark
  (let ((version "0.8.5"))
    (origin
      (method url-fetch)
      (uri (string-append "https://st.suckless.org/patches/gruvbox"
			  "/st-gruvbox-dark-" version ".diff"))
      (sha256
	(base32 "0jvn0i0fl0w3c8dcmwyh9w19g3hsi22cqmyqly5zjzjwjhc8qnjv")))))

(define-public dmenu-center
  (let ((version "5.2"))
    (origin
      (method url-fetch)
      (uri (string-append "https://tools.suckless.org/dmenu/patches"
			  "/center/dmenu-center-" version ".diff"))
      (sha256
	(base32 "1jck88ypx83b73i0ys7f6mqikswgd2ab5q0dfvs327gsz11jqyws"))
      (file-name "dmenu-center.diff")
      (modules '((guix build utils)))
      (snippet '(substitute* "dmenu-center.diff"
			     (("centered = 0") "centered = 1"))))))

(define-public dmenu-border
  (let ((version "20230512-0fe460d"))
    (origin
      (method url-fetch)
      (uri (string-append "https://tools.suckless.org/dmenu/patches"
			  "/border/dmenu-border-" version ".diff"))
      (sha256
	(base32 "12lahhbp9nwkzlbv4nbmvwb90sgnci93gspzq1cyspj21pd7azw5"))
      (file-name "dmenu-border.diff")
      (modules '((guix build utils)))
      (snippet '(substitute* "dmenu-border.diff"
			     (("border_width = 0") "border_width = 3"))))))
