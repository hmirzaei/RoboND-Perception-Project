(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(ispell-program-name "/usr/bin/aspell")
 '(large-file-warning-threshold nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(antlr-keyword ((((class color) (background light)) (:foreground "white" :weight bold))))
 '(ido-first-match ((t (:foreground "#ccff66"))))
 '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
 '(ido-indicator ((t (:foreground "#ffffff"))))
 '(ido-only-match ((t (:foreground "#ffcc33"))))
 '(ido-subdir ((t (:foreground "#66ff00")))))
;; Ido face for indicating incomplete regexps. (don't use this either)

;; flyspell
(setq-default ispell-program-name "/usr/local/bin/aspell")
(global-visual-line-mode)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq TeX-PDF-mode t)
(require 'reftex)

(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(global-set-key (kbd "C-h C-c") 'compile)


;; Modelica mode
(setq load-path (cons "~/.emacs.d/lisp" load-path))
(autoload 'modelica-mode "modelica-mode" "Modelica Editing Mode" t)
(setq auto-mode-alist (cons '("\.mo$" . modelica-mode) auto-mode-alist))

;; Enable Modelica browsing
(autoload 'mdc-browse "mdc-browse" "Modelica Class Browsing" t)
(autoload 'br-mdc "br-mdc" "Modelica Class Browsing" t)

(defvar br-env-lang-avector
  '[
    ("C++/C"   . "c++-")
    ("Eiffel"  . "eif-")
    ("Info"    . "info-")
    ("Java"    . "java-")
    ("Lisp"    . "clos-")
    ("Modelica" . "mdc-")
    ("Obj-C"   . "objc-")
    ("Python"  . "python-")
    ]
  "Association vector of elements of OO-Browser languages.")

;; Autostart OO-Browser (the installation is assumed under ~/oo-browser)
(setq load-path (append
		 '("~/oo-browser/"
		   "~/oo-browser/hypb/")
		 load-path))

(global-set-key "\C-c\C-o" 'oo-browser)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))




(setq compilation-scroll-output 'first-error)

(defun my-bibtex-mode-setup ()
  (local-set-key (kbd "TAB") 'indent-for-tab-command))
(add-hook 'bibtex-mode-hook 'my-bibtex-mode-setup)

(setq compilation-skip-threshold 2)


(defun make-trans ()  (interactive) (set-frame-parameter (selected-frame) 'alpha '(50 50)))
(global-set-key (kbd "C-h C-s") 'make-trans)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;;(set-face-foreground 'mode-line "black")
;;(set-face-background 'mode-line "#505050")
;; (set-face-background 'mode-line-inactive "#202020")
;; (set-face-foreground 'menu "#505050")
;; (set-face-background 'menu "black")
