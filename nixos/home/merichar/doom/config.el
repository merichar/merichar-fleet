;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Meg Richards"
      user-mail-address "merichar@merichar.org"
      doom-theme 'modus-vivendi
      display-line-numbers-type t
      org-directory "~/org/"
      mouse-autoselect-window t)

(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

;; These project-local values are deliberately trusted. Preserve Doom's own
;; defaults by adding them rather than replacing safe-local-variable-values.
(dolist (entry
         '((eval with-eval-after-load 'flycheck
            (setf (flycheck-checker-get 'yaml-yamllint 'working-directory)
                  (lambda (_checker)
                    (and buffer-file-name
                         (locate-dominating-file buffer-file-name ".yamllint")))))
           (flycheck-checker . yaml-yamllint)
           (lsp-yaml-custom-tags . ["!secret" "!include" "!lambda" "!extend"])))
  (add-to-list 'safe-local-variable-values entry))
