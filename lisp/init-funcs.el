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

(defun my-kill-line-backwards ()
  (interactive)
  (if (looking-back "\n" 1)
      (join-line)
    (kill-line 0)))

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

;; Takes a multi-line paragraph and makes it into a single line of text
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun lookup-word (word)
  (interactive (list (thing-at-point 'word)))
  (browse-url (format "http://www.freethesaurus.com/%s" word)))

; This opens URL in browser/tab
;  (browse-url (format "http://www.thesaurus.com/browse/%s" word)))
;  (browse-url (format "http://en.wiktionary.org/wiki/%s" word)))

; This opens a new buffer containing contents of URL
; Borrowed from package "crux"
(defun crux-view-url ()
  "Open a new buffer containing the contents of URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    (goto-char (point-min))
    (re-search-forward "^$")
    (delete-region (point-min) (point))
    (delete-blank-lines)
    (set-auto-mode)))

(provide 'init-funcs)
