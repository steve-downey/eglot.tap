(defcustom exordium-eglot-mode-enable t
  "Enable eglot lsp mode."
  :group 'exordium
  :type 'boolean)

(require 'init-prefs)
(setq exordium-lsp-mode-enable t)
(setq exordium-eglot-mode-enable nil)

(defcustom exordium-eglot-clangd-executable ["clangd-19" "clangd-18" "clangd-17" "clangd-16" "clangd-15" "clangd"]
  "List of executable names to search for to run clangd      .
Default is to choose the first that is found via `executable-find'."
  :group 'exordium
  :risky t
  :type 'exordium-string-vector)
