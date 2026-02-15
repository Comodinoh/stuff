(setq custom-file "~/.emacs.custom.el")
(load custom-file)

(menu-bar-mode -1)
(tool-bar-mode -1)
(xclip-mode 1)
(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(require 'multiple-cursors)
(multiple-cursors-mode 1)

(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-13"))

(add-to-list 'load-path ".emacs.local/simpc-mode")

(require 'simpc-mode)

(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(require 'smex)
(smex-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)



