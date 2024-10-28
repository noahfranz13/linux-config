;; load the nord theme from the submodule
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/nord-theme/"))
(load-theme 'nord t)

;; increase font size
;; cause I'm going blind
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "RobotoMono-14"))

;; Fontify current frame
(fontify-frame nil)
;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions) 

;; turn off the toolbar because it's old and ugly
;; plus no one who uses emacs ever really uses it...
(tool-bar-mode -1)
(menu-bar-mode -1) 

;; disable the startup screen
(setq inhibit-startup-screen t)

;; some other customizations

;; set the backup directory
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

;; make sure some default packages are installed
(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))

(use-package tramp
   :ensure t)
(use-package auctex
   :ensure t)
(use-package ein
   :ensure t)
(use-package pandoc
   :ensure t)

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
