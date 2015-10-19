(require-package 'magit)

;;todo 每次UPDATE都会写UPDATE时间
(defun cf-version-update ()
  "svn update"
  (interactive)
  (let ((data (shell-command-to-string (concat "cd \"" (cf-version-root-path) "\" && svn cleanup && svn up"))))
    (message data)
    data
  )
)


;;todo 改成列表之后,此处记录的是提交成功的时间的比对
;; 执行提交之前,要运行UPDATE,查看有没有在提交之前有人更新过
(defun cf-version-commit ()
  "svn commit"
  (interactive)(block fun
  (let ( (data (cf-version-update)) )
    (if (> (string-width data) 32)
      (progn (message data) (return-from fun))
    )
  )
  (let ((data (shell-command-to-string (concat "cd \"" (cf-version-root-path) "\" && svn add --force " (buffer-file-name) " > /dev/null && svn commit -me"))))
    (if (string-match "Committed revision" data)
      (cf-version-write-working-revision)
      (message "")
    )
    (message data)
  )
))

(defun cf-version-file-revision ()
  (concat (cf-version-root-path) "/.svn/revision"))

;; 写时间之前,先读取上一次的时间和现在的时间距离有没有超过一天,如果没有,就不写最新的时间进入REVISION
(defun cf-version-write-working-revision ()
  (cf-version-read-working-revision)
  (if (> (+ (cf-version-read-real-revision) 86400) (float-time))
    (message "")
    (shell-command (concat "echo '" (number-to-string (float-time)) "' > " (cf-version-file-revision)))
  )
)

(defun cf-version-read-real-revision()
  (string-to-number (cf-chomp (shell-command-to-string (concat "cat " (cf-version-file-revision))))))

(defun cf-version-read-working-revision ()
  (if (boundp 'last-revision-time)
    (+ last-revision-time 0)
    (setq last-revision-time (cf-version-read-real-revision))
  )
)

;; (defun cf-version-revision ()
;;   (cf-regex "Revision: \\(.*\\)" (shell-command-to-string (concat "svn info")) 1))

(defun cf-version-root-path ()
  (cf-regex "Working Copy Root Path: \\(.*\\)" (shell-command-to-string (concat "svn info")) 1))

(defun cf-ediff-prev-version ()
  (interactive)
  (shell-command-to-string (concat "svn info"))
  (shell-command (concat "rm -rf /tmp/subversion_prev_file"))
  (shell-command (concat "svn cat -r {\"" (cf-second-to-date (cf-version-read-working-revision)) "\"} " buffer-file-name " > /tmp/subversion_prev_file") )
  (if (get-buffer "subversion_prev_file")(kill-buffer "subversion_prev_file"))
  (find-file-noselect "/tmp/subversion_prev_file")
  (ediff-buffers (current-buffer) "subversion_prev_file")
)

(provide 'init-version)
