; init-ui.el
;
; Setting that affect the UI
;
; ------------------------------------------------------

(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-scroll-bar-mode 'right)
(scroll-bar-mode -1)
(setq scroll-error-top-bottom t)
(setq scroll-step 1)

(setq-default major-mode 'text-mode)
(setq-default fill-column 72)
(setq-default truncate-lines 1)
(setq ring-bell-function 'ignore)

(if (eq system-type 'darwin)
    (set-face-attribute 'default nil :height 110))

(if (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil :height 100))

(if (eq system-type 'windows-nt)
    (set-face-attribute 'default nil :height 90))

; (add-to-list 'default-frame-alist '(width  . 80))
(add-to-list 'initial-frame-alist '(fullscreen . fullheight))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))
(add-to-list 'default-frame-alist '(foreground-color . "SpringGreen4"))
(add-to-list 'default-frame-alist '(background-color . "black"))

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

(provide 'init-ui)
