(require-package 'window-numbering)

(setq window-numbering-assign-func
            (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

(provide 'init-window-numbering)
