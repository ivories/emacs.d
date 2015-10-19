(defun cf-chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (while (string-match "\\`\n+\\|^\\s-+\\|\\s-+$\\|\n+\\'"
                       str)
    (setq str (replace-match "" t t str)))
  str
)

(defun cf-regex (regex value pos)
  (string-match regex value)
  (match-string pos value)
)

(defun cf-find-buffer-file (filename)
  (car (remove-if-not (lambda (b) (equal (buffer-file-name b ) filename)) (buffer-list))))

(defun cf-close-buffer (name)
  (if (get-buffer name)(kill-buffer name))
  (if (cf-find-buffer-file name)(kill-buffer (cf-find-buffer-file name))))

(defun cf-close-files (filelist)
  (mapcar (lambda (f) (cf-close-buffer f)) filelist))

(defun cf-second-to-date (second)
  (format-time-string "%Y-%m-%d %H:%M:%S" (seconds-to-time second)))

(provide 'init-cf-tools)
