;; company-mode 如果太慢执行company-diag查看backend

;; (setq company-backends 'company-tabnine)

(require-package 'company)
(require-package 'company-tabnine)

(require 'company-tabnine)

(add-to-list 'company-backends 'company-dabbrev)
(add-to-list 'company-backends #'company-tabnine)

(make-local-variable 'company-backends)
;; remove
(setq company-backends (delete 'company-dabbrev company-backends))
(setq company-backends (delete 'company-bbdb company-backends))
(setq company-backends (delete 'company-eclim company-backends))
(setq company-backends (delete 'company-semantic company-backends))
(setq company-backends (delete 'company-clang company-backends))
(setq company-backends (delete 'company-xcode company-backends))
(setq company-backends (delete 'company-cmake company-backends))
(setq company-backends (delete 'company-capf company-backends))
(setq company-backends (delete 'company-dabbrev-code company-backends))
(setq company-backends (delete 'company-gtags company-backends))
(setq company-backends (delete 'company-etags company-backends))
(setq company-backends (delete 'company-keywords company-backends))
(setq company-backends (delete 'company-files company-backends))

(setq company-idle-delay 0.1)

(setq company-show-numbers t)

(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))

(provide 'init-tabnine)
