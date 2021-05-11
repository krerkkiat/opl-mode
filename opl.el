;;; lang/opl.el --- OPL major mode -*- coding: utf-8; lexical-binding: t; -*-
;;;
;;; This is a modification of an example at http://ergoemacs.org/emacs/elisp_syntax_coloring.html

(setq opl-keywords
      (let* (
             ;; define serveral category of keywords
             (x-keywords '("using" "include" "execute" "main" "constraints" "subject" "assert" "with" "key" "minimize" "maximize"))
             (x-types '("int" "float" "boolean" "int+" "float+" "string" "range" "constraint" "setof" "tuple" "struct"))
             (x-modifiers '("ordered" "sorted" "reversed"))
             (x-constraints '("if" "forall"))
             (x-literals '("infinity" "maxint"))
             (x-binary-expression '("div" "mod" "in" "inter" "union" "diff" "symdiff"))
             (x-aggregate-expression '("sum" "min" "max" "prod" "or" "and" "union" "inter"))
             (x-piecewise-expression '("piecewise"))

             ;; generate regex string for each category of keywords
             (x-keywords-regexp (regexp-opt x-keywords 'words))
             (x-types-regexp (regexp-opt x-types 'words))
             (x-modifiers-regexp (regexp-opt x-modifiers 'words))
             (x-constraints-regexp (regexp-opt x-constraints 'words))
             (x-literals-regexp (regexp-opt x-literals 'words))
             (x-binary-expression-regexp (regexp-opt x-binary-expression 'words))
             (x-aggregate-expression-regexp (regexp-opt x-aggregate-expression 'words))
             (x-piecewise-expression-regexp (regexp-opt x-piecewise-expression 'words)))

        `(
          (,x-keywords-regexp . font-lock-type-face)
          (,x-types-regexp . font-lock-type-face)
          (,x-modifiers-regexp . font-lock-type-face)
          (,x-constraints-regexp . font-lock-type-face)
          (,x-literals-regexp . font-lock-type-face)
          (,x-binary-expression-regexp . font-lock-type-face)
          (,x-aggregate-expression-regexp . font-lock-type-face)
          (,x-piecewise-expression-regexp . font-lock-type-face)
        )))

;;;###autoload
(define-derived-mode opl-mode c-mode "opl mode" "Major mode for editing OPL"

  ;; code for syntax hightlighting
  (setq font-lock-defaults '((opl-keywords))))

(provide 'opl-mode)
