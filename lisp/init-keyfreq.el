(require-package 'keyfreq)

(defcustom keyfreq-file "~/.emacs.d/.emacs.keyfreq"
  "File `keyfreq-table' is saved to/loaded from by
`keyfreq-table-save' and `keyfreq-table-load' functions
by default."
  :group 'keyfreq
  :type 'file)

(defcustom keyfreq-file-lock "~/.emacs.d/.emacs.keyfreq.lock"
  "Lock file to update the `keyfreq-file'."
  :group 'keyfreq
  :type 'file)

(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(provide 'init-keyfreq)
