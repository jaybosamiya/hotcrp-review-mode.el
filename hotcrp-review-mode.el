;;; hotcrp-review-mode.el --- Major mode for HotCRP review files -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;;; This mode provides syntax highlighting and basic features for working with HotCRP review files.
;;;
;;; Code:

(require 'prog-mode)

(defvar hotcrp-review-mode-hook nil)

(defvar-keymap hotcrp-review-mode-map
  :doc "Keymap for hotcrp-review-mode."
  "M-q" #'fill-paragraph)

(defvar hotcrp-review-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; Comment syntax for `==-== ` lines (not real Emacs comments, just coloring)
    st)
  "Syntax table for `hotcrp-review-mode'.")

;; Font-lock definitions
(defconst hotcrp-review-font-lock-keywords
  (list
   ;; HotCRP-specific markup
   '("^==\\+== .*$" . (0 'font-lock-type-face t))
   '("^==\\*== .*$" . (0 'font-lock-keyword-face t))
   '("^==\\-== .*$" . (0 'font-lock-comment-face t))

   ;; Headings
   '("^\\(#+\\)\\s-+\\(.*\\)$" . ((1 'font-lock-function-name-face) (2 'font-lock-function-name-face)))

   ;; Blockquote
   '("^>\\s-?.*$" . 'font-lock-preprocessor-face)

   ;; Lists
   '("^\\s-*\\([-+*]\\)\\s-+" . (1 'font-lock-function-name-face))

   ;; Links
   '("\\[\\([^]]+\\)\\](\\([^)\n]+\\))"
     (1 'font-lock-variable-name-face)
     (2 'font-lock-string-face))

   ;; LaTeX-style math ($equation$)
   '("\\$\\([^$]+?\\)\\$" . (1 'font-lock-constant-face))

   ;; Inline code (`code`)
   '("`\\([^`]+?\\)`" . (1 'font-lock-constant-face))

   ;; Bold (**bold** or __bold__)
   '("\\(^\\|[[:space:]]\\)\\(?:\\*\\*\\|__\\)\\([^[:space:]].*?[^[:space:]]\\)\\(?:\\*\\*\\|__\\)\\($\\|[[:space:]]\\)"
     2 'bold)

   ;; Italic (*italic* or _italic_)
   '("\\(^\\|[[:space:]]\\)\\(?:\\*\\|_\\)\\([^[:space:]].*?[^[:space:]]\\)\\(?:\\*\\|_\\)\\($\\|[[:space:]]\\)"
     2 'italic)))

;;;###autoload
(define-derived-mode hotcrp-review-mode prog-mode "HotCRP Review"
  "Major mode for editing HotCRP review files."
  :syntax-table hotcrp-review-mode-syntax-table
  :keymap hotcrp-review-mode-map
  (setq font-lock-defaults '((hotcrp-review-font-lock-keywords)))
  (setq-local comment-start "==-== ")
  (setq-local comment-start-skip "^==-==[ ]*")
  (setq-local comment-use-syntax nil))

(provide 'hotcrp-review-mode)
;;; hotcrp-review-mode.el ends here
