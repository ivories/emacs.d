(require-package 'yasnippet)	
;;========================================================
;; Yasnippet and Auto-complete settings
;;========================================================

(yas-global-mode 1)
;;使用增强列表
(require-package 'pos-tip)
;; (setq ac-quick-help-prefer-pos-tip)
;;启用默认ac设置
(ac-config-default)
(auto-complete-mode 1)
;;添加backspac触发列表
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
;;使用帮助模式
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
;;开启ac-dwin
(setq ac-dwim t)
;;设置ac数据文件位置
;;(setq ac-comphist-file (expand-file-name "ac-comphist/ac-comphist.dat" prelude-savefile-dir))
;;(check-temp-dir (expand-file-name "ac-comphist/" prelude-savefile-dir))

;;yasnippet补全源的界面显示设置，这里颜色是红色的，用来与ac本身的补全相区分
(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white")))
  "Face for the yasnippet selected candidate.")

(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face))
  "Source for Yasnippet.")

;; (setq
;;    next-line-add-newlines nil             ;; don't add newlines autom'ly when
;;      require-final-newline t)               ;; end files with 

;; (defun toggle-final-newline
;;       (interactive)
;;           (setq require-final-newline (not require-final-newline)))
;; (global-set-key (kbd "C-c f") 'toggle-final-newline)

(provide 'init-yasnippet)
