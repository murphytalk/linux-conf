;;==========================================================================
;;File/buffer name convention: this-is-a-post.rst
;;==========================================================================
(defun my-blog-rst ()
  (interactive)
  (setq title (replace-regexp-in-string ".rst" "" (replace-regexp-in-string "-" " " (buffer-name))))
  (setq bar (make-string (length title) ?=))
  (insert bar)
  (newline)
  (insert title)
  (newline)
  (insert bar)
  (newline)
  (insert ":category: ")
  (newline)
  (insert ":tags: ")
  (newline)
  (insert ":date: ")
  (insert (format-time-string "%Y-%m-%d %H:%M:%S"))
  (newline)
  (newline))

(setq org-directory "~/work/org-mode")
(setq deft-directory org-directory)
