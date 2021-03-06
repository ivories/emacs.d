;;; Code custom key

(global-set-key (kbd "C-l") 'goto-line) ;;跳转指定行快捷键
(global-set-key (kbd "C-s") 'save-buffer)         ;;保存文件
;; (global-set-key (kbd "C-u") 'undo-tree-visualize) ;;undo tree
;; (global-set-key (kbd "C-f") 'forward-word) ;;替换 M-f
;; (global-set-key (kbd "C-b") 'backward-word) ;;替换 M-b
;; (global-set-key (kbd "M-f") 'forward-char) ;;替换 C-f
;; (global-set-key (kbd "M-b") 'backward-char) ;;替换 C-b
(global-set-key (kbd "C-r") 'isearch-forward) ;;替换 C-s
(global-set-key (kbd "C-t") 'ggtags-grep) ;;全局搜索 grep-find
;;(global-set-key (kbd "C-o") 'fiplr-find-file)   ;;打开文件
(global-set-key (kbd "C-o") 'ido-find-file) ;;打开文件

(global-set-key (kbd "C-j") 'switch-window)
;; (global-set-key (kbd "<f2>") 'imenu)  ;;imenu
;; 在macos切换到输入法时的快捷键需要调整的

(global-set-key (kbd "C-h") 'shortcut-ibuffer) ;;buffer区
(global-set-key (kbd "C-M-a") 'qiang-comment-dwim-line)

(global-set-key (kbd "C-k") 'er/expand-region)
(global-set-key (kbd "C-M-k") 'er/expand-region)

(defvar custom-keys-mode-map (make-keymap) "custom-keys-mode keymap.")
(define-minor-mode custom-keys-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'custom-keys-mode-map)
(custom-keys-mode 1)

(defun my-minibuffer-setup-hook ()
  (custom-keys-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'custom-keys-mode))
      (let ((mykeys (assq 'custom-keys-mode minor-mode-map-alist)))
        (assq-delete-all 'custom-keys-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)
(define-key custom-keys-mode-map (kbd "C-k") 'er/expand-region)

;;make the ENTER key indent next line properly
;;(local-set-key "\C-m" 'er/expand-region)

(global-set-key (kbd "M--") 'undo-tree-redo)

(global-set-key (kbd "M-1") 'previous-buffer)
(global-set-key (kbd "M-2") 'next-buffer)

;;(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-l") 'switch-window) ;;减化 操作C-x o
(global-set-key (kbd "M-o") 'sanityinc/toggle-delete-other-windows) ;;删除其它windows
(global-set-key (kbd "M-s") 'cua-scroll-down) ;;上移
(global-set-key (kbd "M-,") 'beginning-of-buffer)
(global-set-key (kbd "M-.") 'end-of-buffer)
(global-set-key (kbd "M-\237") 'smex)
(global-set-key (kbd "M-º") 'whole-line-or-region-kill-ring-save)
(global-set-key "\M-/" 'qiang-comment-dwim-line) ;;注释功能

;; (global-set-key (kbd "S-[backspace]") 'delete-backward-char)

;;(global-set-key (kbd "<f1>") 'youdao-dictionary-search-at-point+)
(global-set-key (kbd "<f1>") 'describe-mode)
(global-set-key (kbd "<f2>") 'shortcut-find-definition)
(global-set-key (kbd "<f3>") 'shortcut-find-definition)
(global-set-key (kbd "<f5>") 'shortcut-run-program)
(global-set-key (kbd "<f9>") 'cf-ediff-prev-version)
(global-set-key (kbd "<f8>") 'find-iname-grep-dired)
(global-set-key (kbd "<f11>") 'cf-version-update)
;; (global-set-key (kbd "<f12>") 'cf-version-commit)
(global-set-key (kbd "<f12>") 'magit-status)

(defun shortcut-find-definition (&optional arg)
  "find definition"
  (interactive)

  (pcase (file-name-extension buffer-file-name)
    ("php" (ac-php-find-symbol-at-point) )
    ("c"   (ggtags-find-tag-dwim (thing-at-point 'word)) )
    ("cpp" (ggtags-find-tag-dwim (thing-at-point 'word)) )
    ("h"   (ggtags-find-tag-dwim (thing-at-point 'word)) )
  )
)

;;(require 'thingatpt)

(defun qiang-comment-dwim-line (&optional arg)
    "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
    (interactive "*P")
    (comment-normalize-vars)
    (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
        (comment-or-uncomment-region (line-beginning-position) (line-end-position))
      (comment-dwim arg))
)
;;(global-set-key (kbd "C-/") 'qiang-comment-dwim-line)

(defun get-buffer-line-function-name (value)
  (string-match "//" value)
  (message (concat (match-string 0)))
  (concat (match-string 0))
)


(defun variable-ssh-coreos (value)
  (concat "ssh -t -o StrictHostKeyChecking=no core@192.168.56.101 'docker exec -i " value "'")
)

(defun variable-ssh-master (value)
  (concat "ssh -t -o StrictHostKeyChecking=no Administrator@192.168.56.1 '" value "'")
)

(defun test-test ()
  "this is test function"
  (interactive)

  (message "test function")
)

(defun run ()
  "Run"
  (shortcut-run-program)
)

(defun shortcut-run-program ()
  "Run program"
  (interactive)

  ;; (setq m-current-word (buffer-substring-no-properties (mark) (point)))

  (cond
   (mark-active
    "todo:此处可以更改成，如果在注释里面，并存在startuml,和enduml就执行此代码"
    (setq m-tmp-plantuml "/tmp/plant-uml-buffer")
    (write-region (mark) (point) m-tmp-plantuml t)
    (delete-file m-tmp-plantuml)
    (write-region (mark) (point) m-tmp-plantuml t)
    (shell-command (concat "/usr/local/bin/plant " m-tmp-plantuml  " && open " m-tmp-plantuml ".png" ))
   )
   ('t
    (pcase (file-name-extension buffer-file-name)
      ("rs" (shell-command (concat "cd .. && cargo run --release &")) )
      ("php" (shell-command (concat "XDEBUG_CONFIG='idekey=MyDebug' /usr/local/webserver/php/bin/php " (buffer-file-name) " &") ) )
      ("js" (shell-command (concat "/usr/bin/ws " (buffer-file-name) " " (get-buffer-line-function-name (thing-at-point 'line)) " &") ) )
      ("uml" (shell-command (concat "/usr/local/bin/plant " (buffer-file-name) " && open " (replace-regexp-in-string ".uml" ".png" buffer-file-name) )) )
      ("cpp" (shell-command (variable-ssh-master (concat "cd /cygdrive/d" (file-name-directory buffer-file-name) "; cscript build.vbs")) ) )
      ("py" (shell-command (variable-ssh-coreos (concat "tensorflow python " (buffer-file-name)) )) )
    )
   )
  )
)

;; (defun file-format-dos2unix ()
;;   "这里的替换还是有问题，会把其它二进制文件也进行替换。DFind-name (dir): \n"
;;   (interactive)
;;   (shell-command "find ./ -not -path '*/\.*' -type f -print0 | xargs -0 sed -i 's/^M$//'")
;; )

(defun git-config-ignore-ctrl-m ()
  "修改git-config忽略^M"
  (interactive)
  (shell-command "echo \"[core]\n\twhitespace = cr-at-eol\n\tautocrlf = input\n\tsafecrlf = true\" > ~/.gitconfig")
)

(defun shortcut-ibuffer ()
  "todo: 把*message*移动至default,或者删除*message*"
  (interactive)
  (cf-close-buffer "*ediff-diff*")
  (cf-close-buffer "*ediff-errors*")
  (cf-close-buffer "*Ediff Registry*")
  (cf-close-buffer "*ediff-fine-diff*")
  (cf-close-buffer "*subversion_prev_file*")

  (cf-close-buffer "*vc*")
  (cf-close-buffer "*Help*")
  (cf-close-buffer "*grep*")
  (cf-close-buffer "*Alerts*")
  (cf-close-buffer "*Backtrace*")
  (cf-close-buffer "*Completions*")
  (cf-close-buffer "*frequencies*")
  (cf-close-buffer "*ggtags-global*")
  (cf-close-buffer "*Ido Completions*")
  (cf-close-buffer "*Disabled Command*")
  (cf-close-buffer "*Quail Completions*")
  (cf-close-buffer "*Shell Command Output*")

  (cf-close-buffer "/tmp/subversion_prev_file")

  (ibuffer)
)

(defun find-iname-grep-dired (dir regexp)
  (interactive "DFind-name (directory): \nsFind-grep (grep regexp): ")
  (find-dired dir (concat "-not -iwholename '*.svn*' \\) \\( -not -iwholename '*.tags*' \\) \\( -not -iwholename '*.git*' \\) \\( -type f -exec " grep-program " " find-grep-options " -e "
    (shell-quote-argument regexp) " "
    (shell-quote-argument "{}") " "
    (shell-quote-argument ";"))
  )
)

(provide 'init-custom-keys)
