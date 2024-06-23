(define-module (ibuki packages version-control)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages version-control)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils))

(define-public git-prompt-ibuki
    (package
      (name "git-prompt-ibuki")
      (version "d7805bc74351e61126e587a7470e3fbf843caf8a")
      (source (origin
                (method url-fetch)
                (uri (string-append
		       "https://raw.githubusercontent.com/git/git/"
		       version "/contrib/completion/git-prompt.sh"))
                (sha256
                 (base32
                  "1bkdllwxfbcbflfi6w4p2ls8hvqpv2hwvqf5fw3w4zh89p2vg5ra"))))
      (build-system copy-build-system)
      (arguments
	(list
	  #:tests? #f
	  #:phases #~(modify-phases %standard-phases
	    (add-after 'install 'rename-file
	      (lambda _
		(let ((gitcore (string-append #$output "/share/git-core")))
		  (mkdir-p gitcore)
		  (rename-file
		    (string-append #$output "/git-prompt.sh")
		    (string-append gitcore  "/git-prompt.sh"))))))))
      (home-page "https://git-scm.com/")
      (synopsis "bash/zsh git prompt")
      (description "This script allows you to see repository status in your
prompt.")
      (license license:gpl2)))

(define-public thaenz-git
  (package
  (inherit git)
  (name "thaenz-git")
  (synopsis "add missing git-prompt.sh from base git package")
  (arguments
    (substitute-keyword-arguments (package-arguments git)
      ((#:phases phases)
       #~(modify-phases #$phases
	   (add-after 'install 'install-git-prompt-script
	     (lambda* (#:key outputs #:allow-other-keys)
	       (let* ((out     (assoc-ref outputs "out"))
		      (gitcore (string-append out "/share/git-core")))
		 (mkdir-p gitcore)
	         (copy-file "contrib/completion/git-prompt.sh"
			    (string-append gitcore "/git-prompt.sh")))))))))))
