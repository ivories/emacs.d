(setq auto-save-default nil)

(global-linum-mode t) ;;开启行号
(setq linum-format "%4d \u2502") ;;设置行号的边界

(if (get-buffer "*scratch*")
  (kill-buffer "*scratch*"))
(if (get-buffer "*Compile-Log*")
  (kill-buffer "*Compile-Log*"))

;; (setq auto-save-visited-file-name t)
;; (setq set-auto-buffer-save t)
(set-input-method "chinese-py") ;; Set chinese

(provide 'init-after)
