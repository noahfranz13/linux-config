;; persistent line numbers
(global-display-line-numbers-mode)

;; turn off the toolbar because it's old and ugly
;; plus no one who uses emacs ever really uses it...
(tool-bar-mode -1)
(menu-bar-mode -1) 

;; disable the startup screen
(setq inhibit-startup-screen t)

;; increase font size
;; cause I'm going blind
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "RobotoMono-14"))

;; Fontify current frame
(fontify-frame nil)
;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions) 

;; load the theme we want to use
;; and modify as necessary
(require-theme 'modus-themes)

(setq modus-vivendi-tritanopia-palette-overrides
      '((bg-main "#333333")
        ))

(load-theme 'modus-vivendi-tritanopia :no-confirm)
(enable-theme 'modus-vivendi-tritanopia)

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

;; Declare packages
(setq my-packages
      '(company
	company-anaconda
	company-auctex
	tramp
	auctex
	ein
	pandoc
	markdown-mode
	magit))

;; Iterate on packages and install missing ones
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; for company-mode autocomplete backend to always be enabled
(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load "company"
 (add-to-list 'company-backends 'company-anaconda)
 (add-to-list 'company-backends 'company-auctex)
 (add-hook 'python-mode-hook 'anaconda-mode))

;; for LaTeX
(use-package org
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  )

;; for ein figures
(setq ein:output-area-inlined-images t)

;; for ein delete cell
;; From: https://github.com/millejoh/emacs-ipython-notebook/issues/174
(use-package ein-notebook
  :bind (:map ein:notebook-mode-map
	      ("C-c C-d" . ein:worksheet-delete-cell)))

;; for tramp
(setq tramp-default-method "ssh")

;; for org mode
(add-hook 'org-mode-hook 'variable-pitch-mode)

;; move the custom-set-variables to a different file and import it
;; to clean this file up
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
