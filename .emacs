;; Albert Collins' .emacs

(global-set-key "\C-x\C-p" 'goto-line)
(setq c-default-style '( (c-mode . "linux") (other . "k&r") ) )
(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 8)

;; custom elisp
(require 'cc-mode)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(autoload 'd-mode "d-mode" () t)
(add-to-list 'auto-mode-alist '("\\.d\\'" . d-mode))
(add-hook 'd-mode-hook 'font-lock-mode)

;; highlight of selected region
(setq transient-mark-mode t)

;; autosave to a designated dir
(setq backup-directory-alist '(("." . "~/.saves")))

;; X - not working
(setq x-select-enable-clipboard t)

;; enable mouse scrolling - not working
(mwheel-install)

;; enable line/column number display in modeline
(line-number-mode +1)
(column-number-mode +1)

;; display time & date in modeline
;;(setq display-time-24hr-format t)
;;(setq display-time-day-and-date t)
;;(display-time)

;;
(fset 'yes-or-no-p 'y-or-n-p)

;; font lock , thanks
(setq-default font-lock-multiline t)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode +1)

;; disable menu/tool/scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; tell ediff to not spawn new frames 
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; make % key jump to the matching {}[]()
(global-set-key "%" 'match-paren)

;; map [C-h] to backspace to make life easier
(global-set-key "\C-h" [backspace])

;; enable line truncation (word wraps) in partial (emacs) window
(setq-default truncate-partial-width-windows nil)

;; assist buffer switching
(iswitchb-mode t)

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))


;; load git
;;(add-to-list 'load-path "/opt/local/share/doc/git-core/contrib/emacs")
;;(require 'git)
;;(require 'git-blame)

;; -- Mac OS X specific confs --

;; use visual bell only
(setq visible-bell t)

;; set default frame size
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 162))

;; set font
(add-to-list
 'default-frame-alist
 '(font . "-apple-fixed-medium-r-normal--15-150-72-72-m-150-iso10646-1"))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "green")))))

;; set fallback font for unicode
(set-fontset-font "fontset-default" 'unicode "STHeiti")
