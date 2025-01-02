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

(define-public neovim-surround-ibuki
  (let ((commit "9f0cb495f25bff32c936062d85046fbda0c43517")
	(revision "0"))
    (package
      (name "neovim-surround-ibuki")
      (version (git-version "2.3.1" revision commit))
      (source (origin
		(method git-fetch)
                (uri (git-reference
		       (url "https://github.com/kylechui/nvim-surround")
		       (commit commit)))
                (file-name (git-file-name name version))
                (sha256
		  (base32
		    "1c78320liqhza52gq2xylykd9m6rl50cn44flldg43a4l7rrabxh"))))
      (build-system vim-build-system)
      (arguments
	(list #:plugin-name "nvim-surround"
	      #:mode "opt"))
      (home-page "https://github.com/kylechui/nvim-surround")
      (synopsis "Lua rewrite of tpope/vim-surround vim plugin.")
      (description "Neovim plugin to Add/change/delete surrounding
delimiter pairs with ease.")
      (license license:expat))))

(define-public neovim-lualine-ibuki
  (let ((commit "2a5bae925481f999263d6f5ed8361baef8df4f83")
	(revision "0"))
    (package
      (name "neovim-lualine-ibuki")
      (version (git-version "0.0.0" revision commit))
      (source (origin
		(method git-fetch)
                (uri (git-reference
		       (url "https://github.com/nvim-lualine/lualine.nvim")
		       (commit commit)))
                (file-name (git-file-name name version))
                (sha256
		  (base32
		    "0hp8gycbwm6ibq4rpa18j3g9xacgghklz4c8jlr4gif6g37r1pi0"))))
      (build-system vim-build-system)
      (arguments
	(list #:plugin-name "lualine.nvim"
	      #:mode "opt"))
      (home-page "https://github.com/nvim-lualine/lualine.nvim")
      (synopsis "Neovim plugin for improved statusline.")
      (description
	"A blazing fast and easy to configure neovim statusline plugin written
in pure lua.")
      (license license:expat))))
