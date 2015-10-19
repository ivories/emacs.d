(require-package 'php-mode)
;; (require-package 'smarty-mode)

(require-package 'ac-php)
(add-hook 'php-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (require 'ac-php)
             (yas-global-mode 1)
             (setq ac-sources  '(
                                 ac-source-php
                                 ac-source-words-in-buffer
                                 ))
             ;;(ggtags-mode t)
             (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
             (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
             )
          )

(provide 'init-php)
