;;(require-package 'web-mode)

(require-package 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '( "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;; (require-package 'jshint-mode)
;; (require-package 'flymake-jshint)
;; (add-hook 'javascript-mode-hook
;;                (lambda () (flymake-mode t)))

(provide 'init-web-mode)
