(define-module (ibuki packages version-control)
  #:use-module (gnu packages version-control)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix gexp)

  #:export (thaenz-git))

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
