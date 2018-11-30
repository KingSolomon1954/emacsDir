; init-funcs.el
;
; Functions to supplement editing and movement operations
;
; ------------------------------------------------------

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

; Dos2Unix/Unix2Dos
(defun dos2unix ()
  "Convert the current buffer to UNIX file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))

(defun unix2dos ()
  "Convert the current buffer to DOS file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos nil))

(provide 'init-funcs)

; Increase selected region by semantic units
; (use-package expand-region
;   :bind ("C-=" . er/expand-region))

; Multiple cursors
; (use-package multiple-cursors
;   :bind (("C-S-c C-S-c"   . mc/edit-lines)
;          ("C->"           . mc/mark-next-like-this)
;          ("C-<"           . mc/mark-previous-like-this)
;          ("C-c C-<"       . mc/mark-all-like-this)
;          ("C-M->"         . mc/skip-to-next-like-this)
;          ("C-M-<"         . mc/skip-to-previous-like-this)
;          ("s-<mouse-1>"   . mc/add-cursor-on-click)
;          ("C-S-<mouse-1>" . mc/add-cursor-on-click)
;          :map mc/keymap
; ("C-|" . mc/vertical-align-with-space)))

