(setq custom-file "~/.emacs.custom.el")
(load custom-file)

(menu-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'load-path ".emacs.local/simpc-mode")

(require 'simpc-mode)

(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



