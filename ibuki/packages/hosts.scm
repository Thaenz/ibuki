(define-module (ibuki packages hosts)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)

  #:export (thaenz-hosts))

(define-public thaenz-hosts
  (package
    (name "thaenz-hosts")
    (version "26-05-2024")
    (source (origin
      (method url-fetch)
      (uri (string-append
	"https://github.com/Thaenz/hosts/releases/download/v" version
	"/hosts.gz"))
      (sha256
	(base32 "1yz62q1z23xprbyj3jbj8ygbjq5na9qfzhdvs37ix7xvl21bqg4r"))))
    (build-system copy-build-system)
    (home-page "https://github.com/Thaenz/hosts")
    (synopsis "My massive hosts list")
    (description "It's massive m'kay?")
    (license #f)))
