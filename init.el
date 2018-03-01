;;; This file bootstraps the configuration, which is divided into


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require-package 'wgrep)
;; (require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)

;;----------------------------------------------------------------------------
;; System package
;;----------------------------------------------------------------------------
(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-osx-keys)
(require 'init-gui-frames)
;; (require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)

(require 'init-recentf)
(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)

(require 'init-editing-utils)
(require 'init-compile) ;;system compile message

;;----------------------------------------------------------------------------
;; before package
;;----------------------------------------------------------------------------
(require 'init-before)
(require 'init-cf-tools)
(require 'init-custom-keys)

;;----------------------------------------------------------------------------
;; Svn package
;;----------------------------------------------------------------------------
(require 'init-version)
;; (require 'init-vc) ;;diff for svn,git,vc
;; (require 'init-darcs)
;;(require 'init-git)
;; (require 'init-github)

;;----------------------------------------------------------------------------
;; Tools package
;;----------------------------------------------------------------------------
(require 'init-yasnippet)
(require 'init-org)
(require 'init-translate)
(require 'init-ggtags)
(require 'init-markdown)
;; (require 'init-docker)
;; (require 'init-file)
;; (require 'init-keyfreq) ;; 键盘按键收集
;; (require 'init-keysnail)
;; (require 'init-w3m)
;; (require 'init-proxies)
;; (require 'init-window-numbering)
;; (require 'init-paredit)
;; (require 'init-csv)
;; (require 'init-crontab)

;;----------------------------------------------------------------------------
;; php package
;;----------------------------------------------------------------------------
(require 'init-php)
(require 'init-geben)
;; (require 'init-sql)

;;----------------------------------------------------------------------------
;; c++ package
;;----------------------------------------------------------------------------
(require 'init-cc-mode)

;;----------------------------------------------------------------------------
;; Html package
;;----------------------------------------------------------------------------
(require 'init-html)
(require 'init-css)
(require-package 'htmlize)
(require 'init-web-mode)

;; (require 'init-nxml)
;; (require 'init-textile)
;; (require 'init-haml)
;; (require 'init-javascript)

;;----------------------------------------------------------------------------
;; Lisp package
;;----------------------------------------------------------------------------
;; (require 'init-lisp)
;; (require 'init-slime) ;;LISP
;; (require 'init-marmalade) ;;ELISP

;;----------------------------------------------------------------------------
;; CONFIG
;;----------------------------------------------------------------------------
(require 'init-misc) ;; MISC CONFIG
;; (require 'init-ledger)

;;--------------------- ignore
;; (require 'init-flycheck)
;; (require 'init-clojure)
;; (when (>= emacs-major-version 24)
;;  (require 'init-clojure-cider))
;; (require 'init-common-lisp)

;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))
;; (require 'init-dash)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))
;;--------------------- end ignore

;; Extra packages which don't require any configuration

;; (require-package 'gnuplot) ;;math graph
;; (require-package 'lua-mode) ;;lua language
(require-package 'dsvn)
(when *is-a-mac*
  (require-package 'osx-location))
(require-package 'regex-tool)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" user-emacs-directory))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

(add-hook 'after-init-hook
          (lambda ()
            (message "init completed in %.2fms"
                     (sanityinc/time-subtract-millis after-init-time before-init-time))))

(require 'init-after)

;; test package
;;(require-package 'highlight-indentation-mode)
(require-package 'yaml-mode)
(require-package 'smart-shift)
;; end test package


;; (setq ac-php-debug-flag t)
;; (setq debug-on-error t)

;; new test at here,must check cpu time
(require 'init-mouse)

(require 'init-new)
;; (require 'init-theme)

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
