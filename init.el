(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-scroll-bar-mode 'right)
(scroll-bar-mode -1)
(setq scroll-error-top-bottom t)
(setq scroll-step 1)

(setq-default major-mode 'text-mode)
(setq-default fill-column 72)
(setq-default truncate-lines 1)
(setq ring-bell-function 'ignore)

(add-to-list 'initial-frame-alist '(fullscreen . fullheight))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))
(add-to-list 'default-frame-alist '(foreground-color . "SpringGreen4"))
(add-to-list 'default-frame-alist '(background-color . "black"))
(set-face-attribute 'default nil :height 100)
(set-cursor-color "white")

; Enable highlighting of the cursor line 
(global-hl-line-mode 1)
(set-face-background 'hl-line "#161616")

; (defun new-frame-setup (&optional frame)
(defun new-frame-setup (&optional frame)
  (if (display-graphic-p frame)
      ; Enable highlighting of the cursor line
      ; (hl-line-mode 1)
      (set-face-background 'hl-line "#161616")
      ; (set-face-background 'hl-line "purple")
    ; except in a terminal window
    ; (hl-line-mode -1))) but this does nothing
    (set-face-background 'hl-line "white")))
    ; (global-hl-line-mode -1)))

; Run for already exisiting frames
(mapc 'new-frame-setup(frame-list))
; Run when a new frame is created
(add-hook 'after-make-frame-functions 'new-frame-setup)

(set-face-foreground 'mode-line "white")
(set-face-background 'mode-line "blue")

; disable backup
(setq backup-inhibited t)
; disable auto save
(setq auto-save-default nil)

; disable shift-selection
; If you hold down the shift key while typing a cursor
; motion command, this sets the mark before moving point.
(setq shift-select-mode nil)

(defun next-word (&optional n)
  "Move point forward n words and place cursor at the beginning."
  (interactive "p")
  (let (myword)
    (setq myword
      (if (and transient-mark-mode mark-active)
        (buffer-substring-no-properties (region-beginning) (region-end))
        (thing-at-point 'symbol)))
    (if (not (eq myword nil))
      (forward-word n))
    (forward-word n)
    (backward-word n)))

(defun kill-whitespace-or-word ()
  (interactive)
  (if (looking-at "[ \t\n]")
      (let ((p (point)))
        (re-search-forward "[^ \t\n]" nil :no-error)
        (backward-char)
        (kill-region p (point)))
    (kill-word 1)))

; No tabs please
(setq-default indent-tabs-mode nil)

; Type opening brace and closing brace appears too
; (electric-pair-mode t)

; Highlight matching parens when curson is behind one of them
(show-paren-mode 1)

(defun undent-rigidly (beg end)
  "Undents region to the left by 1"
  (interactive "r")
  (indent-rigidly beg end -1))

(defun reread-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))

(defun goto-prev-mark ()
  "Goto previous mark in local buffer."
  (interactive) (set-mark-command 0))

(defun back-to-indentation-or-beginning ()
  (interactive) 
  (if (bolp) (back-to-indentation) (beginning-of-line)))

(defun exit-isearch-backward-word ()
  (interactive)
  (isearch-exit)
  (backward-word))

(defun exit-isearch-backward-char ()
  (interactive)
  (isearch-exit)
  (backward-char))

; Possible good spare keys
; ESC o
; ESC c-o
; S-C-o

(global-set-key (kbd "C-,")     'ESC-prefix)
(global-set-key (kbd "C-x u")   'universal-argument)
(global-set-key (kbd "C-/")     'indent-rigidly)
(global-set-key (kbd "C-\\")    'undent-rigidly)
(global-set-key (kbd "C-z")     'undo)
(global-set-key (kbd "C-g")     'next-word)
(global-set-key (kbd "C-.")     'keyboard-escape-quit)
(global-set-key (kbd "C-o")     'set-mark-command)
(global-set-key (kbd "C-q")     'kill-ring-save)
(global-set-key (kbd "C-j")     'backward-char)
(global-set-key (kbd "C-l")     'kill-whitespace-or-word)
(global-set-key (kbd "C-h")     'backward-word)
(global-set-key (kbd "C-x f")   'query-replace)
(global-set-key (kbd "C-x x")   'execute-extended-command)
(global-set-key (kbd "C-x g")   'goto-line)
(global-set-key (kbd "C-x C-g") 'find-tag)
(global-set-key (kbd "C-M-,")   'pop-tag-mark)
(global-set-key (kbd "C-x q")   'quoted-insert)
(global-set-key (kbd "C-t")     'next-buffer)
(global-set-key (kbd "S-C-t")   'previous-buffer)
(global-set-key (kbd "C-b")     'other-frame)
(global-set-key (kbd "S-C-b")   '(lambda () (interactive) (other-frame -1)))
(global-set-key (kbd "C-+")     'text-scale-increase)
(global-set-key (kbd "C--")     'text-scale-decrease)
(global-set-key (kbd "S-C-y")   'yank-pop)
(global-set-key (kbd "S-C-v")   'end-of-defun)
(global-set-key (kbd "S-C-u")   'beginning-of-defun)
(global-set-key (kbd "C-M-u")   'scroll-other-window-down)
(global-set-key (kbd "C-;")     'goto-prev-mark)
(global-set-key (kbd "M-r")     'reread-buffer-no-confirm)
(global-set-key (kbd "C-a")     'back-to-indentation-or-beginning)

; Emacs version 24 and later have scroll-down-command
(if (fboundp 'scroll-down-command)
    (global-set-key (kbd "C-u") 'scroll-down-command)
  (global-set-key (kbd "C-u") 'scroll-down))

; Emacs version 24 and later have scroll-up-line
(if (fboundp 'scroll-up-line)
    (global-set-key (kbd "C-x C-p") 'scroll-up-line))
  
; Emacs version 24 and later have scroll-down-line
(if (fboundp 'scroll-down-line)
    (global-set-key (kbd "C-x C-n") 'scroll-down-line))

; (if (>= emacs-major-version 24)
;   (progn
;     (global-set-key (kbd "C-u") 'scroll-down-command)
;     (global-set-key (kbd "C-x C-p") 'scroll-up-line)
;     (global-set-key (kbd "C-x C-n") 'scroll-down-line))
;   (global-set-key (kbd "C-u") 'scroll-down))
  ;; modify isearch's keymap
  
;; Advance through minibuffer and isearch using C-p and C-n
(define-key minibuffer-local-map (kbd "C-p") 'previous-history-element)
(define-key minibuffer-local-map (kbd "C-n") 'next-history-element)
(define-key isearch-mode-map (kbd "C-p") 'isearch-ring-retreat)
(define-key isearch-mode-map (kbd "C-n") 'isearch-ring-advance)
(define-key isearch-mode-map (kbd "C-h") 'exit-isearch-backward-word)
(define-key isearch-mode-map (kbd "C-j") 'exit-isearch-backward-char)

; Make the _ not a word separator.
(add-hook 'c++-mode-hook
    (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c-mode-hook
    (lambda () (modify-syntax-entry ?_ "w")))

(setq c++-mode-hook
    '(lambda ()
       (gtags-mode 1)
))

; (when (require 'gtags-mode nil 't)
;     (setq c++-mode-hook
;         '(lambda ()
;            (gtags-mode 1)
;     ))
; )

(setq gtags-mode-hook
    '(lambda ()
        (define-key gtags-mode-map (kbd "C-x C-g") 'gtags-find-tag)
        (define-key gtags-mode-map (kbd "C-x C-o") 'gtags-find-rtag)
        (define-key gtags-mode-map (kbd "C-x C-v") 'gtags-find-file)
        (define-key gtags-mode-map (kbd "C-x C-t") 'gtags-find-pattern)
        (define-key gtags-mode-map (kbd "C-x C-;") 'gtags-pop-stack)
        (define-key gtags-select-mode-map (kbd "C-x C-;") 'gtags-pop-stack)
))

(setq c-default-style "bsd"
      c-basic-offset 4)
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
)

(when (equal system-type 'windows-nt)
    (custom-set-faces
    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(default ((t (:family "Lucida Console" :foundry "outline" :slant normal :weight normal :height 90 :width normal)))))
)

(when (eq system-type 'darwin)
    (set-face-attribute 'default t :font "lucidasanstypewriter-11" )
)

; Answer "y" instead "yes"
(fset 'yes-or-no-p 'y-or-n-p)

;; Setup packages
;; Peek at https://github.com/yehoodig/dot-files/blob/master/emacs/.emacs.d/init.el

(require 'package)

(when (>= emacs-major-version 24)
    (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
    (add-to-list 'package-archives '("marmalade"    . "http://marmalade-repo.org/packages/") t))

(setq package-enable-at-startup nil)
(package-initialize)

;; Bootstrap "use-package"
;; Docs on use-package here: https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
    (require 'use-package))
