;; (add-to-list 'load-path "/path/to/rust-mode/")
(require-package 'rust-mode)
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(provide 'init-rust)
