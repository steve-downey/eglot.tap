;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))


(use-package eglot
  :if exordium-eglot-mode-enable
  :ensure t
  :init
  :commands eglot
  :hook
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure)
   ;; (markdown-mode . eglot-ensure)
   ;; (org-mode . eglot-ensure)
   (python-mode . eglot-ensure)
   (c-ts-mode . eglot-ensure)
   (c++-ts-mode . eglot-ensure)
   (python-ts-mode . eglot-ensure))
  :config
  (setq eglot-clangd-executable
        (seq-find #'executable-find exordium-eglot-clangd-executable))
  (setq clangd-args '(
                      "-j=4"
                      "--background-index"
                      "--clang-tidy"
                      "--all-scopes-completion"
                      "--completion-style=detailed"
                      "--header-insertion=iwyu"
                      "--header-insertion-decorators=0"
                      "--malloc-trim"
                      "--cross-file-rename"
                      "--pch-storage=memory"))
  (setq exec-clangd (push eglot-clangd-executable clangd-args))
  (add-to-list 'eglot-server-programs
               '((c++-mode c-mode c++-ts-mode c-c++-mode c-modemode) . ("clangd-19"
                                                                         "-j=4"
                                                                         "--background-index"
                                                                         "--clang-tidy"
                                                                         "--all-scopes-completion"
                                                                         "--completion-style=detailed"
                                                                         "--header-insertion=iwyu"
                                                                         "--header-insertion-decorators=0"
                                                                         "--malloc-trim"
                                                                         "--cross-file-rename"
                                                                         "--pch-storage=memory")))
  (setq eldoc-echo-area-use-multiline-p nil
        eglot-extend-to-xref t
        eldoc-idle-delay 0.1
        eglot-autoshutdown t))
