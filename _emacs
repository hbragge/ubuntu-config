
;(defun increment-selective-display ()
;  (interactive)
;  (let ((column (if selective-display
;                    (+ selective-display 2) 2)))
;    (if (> column 16)
;        (set-selective-display nil)
;      (set-selective-display column))))

;(global-set-key [f1] 'increment-selective-display)

;; Documentation/CodingStyle
;(defun c-lineup-arglist-tabs-only (ignored)
;  "Line up argument lists by tabs, not spaces"
;  (let* ((anchor (c-langelem-pos c-syntactic-element))
;         (column (c-langelem-2nd-pos c-syntactic-element))
;         (offset (- (1+ column) anchor))
;         (steps (floor offset c-basic-offset)))
;    (* (max steps 1)
;       c-basic-offset)))

;; disable auto indent
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;;(add-hook 'c-mode-common-hook
;;          (lambda ()
;;            ;; Add kernel style
;;            (c-add-style
;;             "linux-tabs-only"
;;             '("linux" (c-offsets-alist
;;                        (arglist-cont-nonempty
;;                         c-lineup-gcc-asm-reg
;;                         c-lineup-arglist-tabs-only))))))

;;(add-hook 'c-mode-hook
;;          (lambda()
;;            (c-set-style "linux-tabs-only")))

(set-foreground-color "grey")
;(set-background-color "black")
(set-background-color "#202020")
(set-face-attribute 'region nil :background "#666")
(set-default-font "Monospace 12")
(global-font-lock-mode 1)
;; this disables most syntax coloring in c++ mode?
;(setq font-lock-maximum-decoration
;      '((c-mode . 1) (c++-mode . 1)))

;; no auto-save
(auto-save-mode -1)
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq-default auto-save-interval -1)

(setq-default truncate-lines t)
(setq-default show-trailing-whitespace t)

;; visible bell
(setq visible-bell t)

;; do not indent braces
(c-set-offset 'substatement-open 0)

;; disable scroll bar in XEmacs
;(scroll-bar-mode -1)
;; disable tool bara in XEmacs
;(tool-bar-mode -1)

;; Disable the menu bar
;(menu-bar-mode -1)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Set tab width to 4
(setq tab-width 4)
(setq c-basic-offset 4)

(setq js-indent-level 4)

;; Disable the splash screen
(setq inhibit-splash-screen t)

;(require 'auto-complete-config)
;(ac-config-default)
;(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(setq myKeywords
 '(("#.*" . font-lock-comment-face)
   ("@.*" . font-lock-preprocessor-face)
   ("[a-zA-Z_0-9]+:" . font-lock-variable-name-face)
   ("^[\t ]*[a-zA-Z_0-9]+[ \\\n]" . font-lock-function-name-face)
   ("\\(/[a-zA-Z_0-9]+\\)+" . font-lock-type-face)
;   ("\\([a-zA-Z_0-9]+\\|\\([<= ]+\\w+>\\)\\)" . font-lock-constant-face)
  )
)

(define-derived-mode rtext-lang-mode fundamental-mode
  (setq font-lock-defaults '(myKeywords))
  (setq mode-name "rtext")
)

(add-to-list 'auto-mode-alist '("\\.atm\\|\\.meta\\'" . rtext-lang-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js-mode))

(require 'tabbar)
(tabbar-mode t)

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    ))) 

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(global-set-key (kbd "C-<tab>") 'dabbrev-expand)

(setq line-number-mode t)
(setq column-number-mode t)

(defun my-indent-setup ()
  (c-set-offset 'arglist-intro '+))
(add-hook 'c++-mode-hook 'my-indent-setup)
(defun my-indent-setup ()
  (c-set-offset 'arglist-intro '+))
(add-hook 'c-mode-hook 'my-indent-setup)

(require 'auto-complete)
(global-auto-complete-mode t)

(setq large-file-warning-threshold nil)
