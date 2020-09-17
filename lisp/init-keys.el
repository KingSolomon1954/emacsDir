; init-keys.el
;
; Mapping my keys in one spot
;
; ------------------------------------------------------

; Possible good spare keys
; ESC o
; ESC c-o
; S-C-o

(global-set-key (kbd "C-,")           'ESC-prefix)
(global-set-key (kbd "C-x u")         'universal-argument)
(global-set-key (kbd "C-/")           'indent-rigidly)
(global-set-key (kbd "C-\\")          'undent-rigidly)
(global-set-key (kbd "C-z")           'undo)
(global-set-key (kbd "C-g")           'next-word)
(global-set-key (kbd "C-.")           'keyboard-escape-quit)
(global-set-key (kbd "C-o")           'set-mark-command)
(global-set-key (kbd "C-q")           'kill-ring-save)
(global-set-key (kbd "C-j")           'backward-char)
(global-set-key (kbd "C-l")           'kill-whitespace-or-word)
(global-set-key (kbd "C-h")           'backward-word)
(global-set-key (kbd "C-x f")         'query-replace)
(global-set-key (kbd "C-x x")         'execute-extended-command)
(global-set-key (kbd "C-x g")         'goto-line)
(global-set-key (kbd "C-x C-g")       'xref-find-definitions)
(global-set-key (kbd "C-x C-j")       'xref-pop-marker-stack)
(global-set-key (kbd "C-M-,")         'pop-tag-mark)
(global-set-key (kbd "C-x q")         'quoted-insert)
(global-set-key (kbd "C-x C-b")       'ibuffer)
(global-set-key (kbd "C-t")           'next-buffer)
(global-set-key (kbd "S-C-t")         'previous-buffer)
(global-set-key (kbd "C-b")           'other-frame)
(global-set-key (kbd "S-C-b")         '(lambda () (interactive) (other-frame -1)))
(global-set-key (kbd "C-+")           'text-scale-increase)
(global-set-key (kbd "C--")           'text-scale-decrease)
(global-set-key (kbd "M-y")           'clipboard-yank)
(global-set-key (kbd "S-C-y")         'yank-pop)
(global-set-key (kbd "S-C-v")         'end-of-defun)
(global-set-key (kbd "S-C-u")         'beginning-of-defun)
(global-set-key (kbd "C-M-u")         'scroll-other-window-down)
(global-set-key (kbd "C-;")           'goto-prev-mark)
(global-set-key (kbd "M-r")           'reread-buffer-no-confirm)
(global-set-key (kbd "C-a")           'back-to-indentation-or-beginning)
(global-set-key (kbd "C-<backspace>") 'my-kill-line-backwards)
(global-set-key (kbd "C-x r q")       'copy-rectangle-as-kill)
(global-set-key (kbd "C-x Z")         'repeat-complex-command)
(global-set-key (kbd "C-'")           'comment-dwim)

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

(progn
  (require 'dired )
  (define-key  dired-mode-map (kbd "C-t") 'next-buffer)
  (define-key  dired-mode-map (kbd "C-o") 'set-mark-command))

(progn
  (require 'wdired )
  (define-key wdired-mode-map (kbd "C-o") 'set-mark-command))

(progn
  (require 'ibuffer )
  (define-key ibuffer-mode-map (kbd "C-t") 'next-buffer))

(provide 'init-keys)
