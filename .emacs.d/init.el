;; nano-emacs -- NOTES
;; github: https://github.com/rougier/nano-emacs.git
;; first run the ~/.emacs.d/fonts/install-fonts.sh script (for linux only)
;; then add the following lines to add the nano packages
(add-to-list 'load-path "~/.emacs.d/nano-emacs/")
;; required for nano-emacs
(require 'nano-faces)
;; optional (can comment out to toggle on and off as you see fit)
(require 'nano-layout) ;; default layout
(require 'nano-defaults) ;; Nano session saving (optional)
(require 'nano-session) ;; Nano session saving (optional)
(require 'nano-modeline) ;; Nano header & mode lines (optional)
;;(require 'nano-bindings) ;; Nano key bindings modification (optional)
;;(require 'nano-compact) ;; the compact layout version of nano (must come after nano-modeline)
;; optional themes (se
(require 'nano-theme)
(require 'nano-theme-dark)
(require 'nano-theme-light)
;; optional nano welcome message
(let ((inhibit-message t))
  (message "Welcome to GNU Emacs / N Λ N O edition")
  (message (format "Initialization time: %s" (emacs-init-time))))

;; set the theme
(nano-theme-set-dark)
(call-interactively 'nano-refresh-theme)
;;(load-theme 'tsdh-dark t) ;; this is a more default theme but the nano one is kinda cool

;; some other customizations
(setq inhibit-startup-screen t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(add-hook 'prog-mode-hook (lambda () (display-fill-column-indicator-mode)))
(setq-default fill-column 88) ;; add vertical line
;;(pixel-scroll-precision-mode)

;; for more packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; packages we want to require
(require 'tramp) ;; for ssh connections
(require 'auctex) ;; for latex
(require 'ein) ;; emacs ipython notebooks
(require 'pandoc) ;; for markdown support

;; for LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; for tramp
(setq tramp-default-method "ssh")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ein pandoc ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired tramp toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-descbinds helm-comint helm-ag google-translate golden-ratio flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-demos elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile all-the-icons aggressive-indent ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
