(define-module (ibuki services bittorrent)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages bittorrent)
  #:use-module (guix gexp)

  #:export (transmission-shepherd-service))

(define transmission-shepherd-service
  (shepherd-service
    (provision (list 'transmission))
    (documentation "run `transmission-daemon'")
    (start #~(make-forkexec-constructor (list
      #$(file-append transmission "/bin/transmission-daemon")
      "--foreground")))
    (stop #~(make-kill-destructor))))
