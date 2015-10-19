(setq load-path (cons "~/.emacs.d/software/geben-0.26" load-path))

(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t)

;; Debug a simple PHP script.
;; Change the session key my-php-54 to any session key text you like
(defun my-php-debug ()
  "Run current PHP script for debugging with geben"
  (interactive)
;;  (call-interactively 'geben)
  (shell-command
   (concat "XDEBUG_CONFIG='idekey=MyDebug' /usr/local/webserver/php/bin/php "
           (buffer-file-name) " &"))
  )

(provide 'init-geben)
