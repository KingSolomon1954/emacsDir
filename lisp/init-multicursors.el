; init-multicursors.el
;
; Multi-cursor and related packages
;
; ------------------------------------------------------

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

(provide 'init-multicursors)
