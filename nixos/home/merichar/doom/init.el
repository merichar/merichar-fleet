;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       vertico

       :ui
       doom
       doom-dashboard
       doom-quit
       (emoji +unicode)
       hl-todo
       modeline
       ophints
       (popup +defaults)
       treemacs
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces

       :editor
       file-templates
       fold
       (format +onsave)
       snippets

       :emacs
       dired
       electric
       undo
       vc

       :checkers
       syntax

       :tools
       docker
       editorconfig
       (eval +overlay)
       llm
       lookup
       magit
       tree-sitter

       :os
       (:if IS-MAC macos)

       :lang
       emacs-lisp
       json
       (javascript +tree-sitter)
       latex
       markdown
       (nix +tree-sitter)
       org
       python
       (ruby +rails)
       sh
       yaml

       :config
       (default +bindings +smartparens))
