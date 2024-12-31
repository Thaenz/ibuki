(define-module (ibuki packages vim)
 #:use-module ((guix licenses) #:prefix license:)
 #:use-module (guix build-system vim)
 #:use-module (guix git-download)
 #:use-module (guix packages))

(define-public neovim-gruvbox-ibuki
  (let ((commit "61b0b3be2f0cfd521667403a0367298144d6c165")
	(revision "0"))
    (package
      (name "neovim-gruvbox-ibuki")
      (version (git-version "2.0.0" revision commit))
      (source (origin
		(method git-fetch)
		(uri (git-reference
		       (url "https://github.com/ellisonleao/gruvbox.nvim")
		       (commit commit)))
                (file-name (git-file-name name version))
		(sha256
		  (base32
		    "1dphrf8bq088d47macxhx2ql9bq5s9axs9cqwqbp6vkmr4zcx072"))))
      (build-system vim-build-system)
      (arguments
	(list #:plugin-name "gruvbox.nvim"))
      (home-page "https://github.com/ellisonleao/gruvbox.nvim")
      (synopsis "Lua port of the most famous vim colorscheme.")
      (description
	"A port of gruvbox community theme to lua with treesitter and semantic
highlights support!")
      (license license:expat))))
