(define-module (ibuki packages hosts)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)

  #:export (thaenz-hosts))

(define-public thaenz-hosts
  (package
    (name "thaenz-hosts")
    (version "05-05-2024")
    (source (origin
      (method url-fetch)
      (uri (string-append
	"https://github.com/Thaenz/hosts/releases/download/v" version
	"/hosts.gz"))
      (sha256
	(base32 "1q44k5vydk908ll3j0bg5x5lsksgndyygn9la7fk24ird3agnynx"))))
    (build-system copy-build-system)
    (home-page "https://github.com/Thaenz/hosts")
    (synopsis "My massive hosts list")
    (description "It's massive m'kay?")
    (license #f)))
