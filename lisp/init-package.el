; init-package.el
;
; Setup for package management itself.
;
; ------------------------------------------------------

(require 'package)

(when (>= emacs-major-version 24)
    (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t))


;    (add-to-list 'package-archives '("marmalade"    . "http://marmalade-repo.org/packages/") t))

(setq package-enable-at-startup nil)
(package-initialize)

; Should set before loading `use-package'
; (setq use-package-always-ensure t)
(setq use-package-always-defer t)
(setq use-package-expand-minimally t)
(setq use-package-enable-imenu-support t)

; Bootstrap "use-package"
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
    (require 'use-package))

; Required by `use-package'
(use-package diminish)
(use-package bind-key)

(provide 'init-package)

; ------------------------------------------------------
;
; See docs on use-package here: https://github.com/jwiegley/use-package
; Usage from https://github.com/jwiegley/use-package
;
; ------------------------------------------------------
;
;   (use-package foo)
;
;   This loads in the package foo, but only if foo is available on your system. If not, a warning is logged to the *Messages* buffer.
;
;   Use the :init keyword to execute code before a package is loaded. It accepts one or more forms, up to the next keyword:
;
;   (use-package foo
;     :init
;     (setq foo-variable t))
;
;   Similarly, :config can be used to execute code after a package is loaded. In cases where loading is done lazily (see more about autoloading below), this execution is deferred until after the autoload occurs:
;
;   (use-package foo
;     :init
;     (setq foo-variable t)
;     :config
;     (foo-mode 1))
;
;   As you might expect, you can use :init and :config together:
;
;   (use-package color-moccur
;     :commands (isearch-moccur isearch-all)
;     :bind (("M-s O" . moccur)
;            :map isearch-mode-map
;            ("M-o" . isearch-moccur)
;            ("M-O" . isearch-moccur-all))
;     :init
;     (setq isearch-lazy-highlight t)
;     :config
;     (use-package moccur-edit))
;
;   In this case, I want to autoload the commands isearch-moccur
;   and isearch-all from color-moccur.el, and bind keys both at
;   the global level and within the isearch-mode-map (see next
;   section). When the package is actually loaded (by using one
;   of these commands), moccur-edit is also loaded, to allow
;   editing of the moccur buffer.
