;;; hotcrp-review-mode.el --- Major mode for HotCRP review files -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;;; This mode provides syntax highlighting and basic features for working with HotCRP review files.
;;;
;;; Code:

(require 'prog-mode)
(require 'markdown-mode)

(defvar hotcrp-review-mode-hook nil)

(defvar hotcrp-review-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; Comment syntax for `==-== ` lines (not real Emacs comments, just coloring)
    st)
  "Syntax table for `hotcrp-review-mode'.")

;; Font-lock definitions
(defconst hotcrp-review-font-lock-keywords
  (let ((base markdown-mode-font-lock-keywords))
    (append
     ;; High-priority HotCRP rules
     '(("^==\\+== .*$" (0 'font-lock-type-face t))
       ("^==\\*== .*$" (0 'font-lock-keyword-face t))
       ("^==\-== .*$" (0 'font-lock-comment-face t)))
     base)))

;;;###autoload
(define-derived-mode hotcrp-review-mode prog-mode "HotCRP Review"
  "Major mode for editing HotCRP review files."
  :syntax-table hotcrp-review-mode-syntax-table
  (setq font-lock-defaults '((hotcrp-review-font-lock-keywords)))
  (setq-local comment-start "==-== ")
  (setq-local comment-start-skip "^==-==[ ]*")
  (setq-local comment-use-syntax nil))

(provide 'hotcrp-review-mode)
;;; hotcrp-review-mode.el ends here
