(require 'package)

;; add the melpa repository for fetching packages
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; initialize the package manager
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (vue-mode elixir-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; remove the annoying electronic beep when hitting scroll end, or other warnings
(setq ring-bell-function 'ignore)

;; show the line column
(setq column-number-mode t)

;; change the color of highlighted/selected regions
(set-face-attribute 'region nil :background "#d9d9d9")

;; use smex for M-x commands autocompletion 
(require 'smex)
(smex-initialize)
;; bind the M-x key to smex
(global-set-key (kbd "M-x") 'smex)

;; use ido auto completions for the command line buffer, ie. when browsing the filesystem
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; hide the toolbar
(tool-bar-mode -1)
;; hide the menubar
(menu-bar-mode -1)
;; hide the scrollbars
(toggle-scroll-bar -1)

;; default to full-screen on opening
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; undo keyboard binding
(global-set-key (kbd "C-z") 'undo)
;; buffer display keyboard binding
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; easy switch to previous window binding
(global-set-key (kbd "C-,") (lambda ()
                                (interactive)
                                (other-window -1)))
;; easy switch to next window binding
(global-set-key (kbd "C-.") (lambda ()
                                (interactive)
                                (other-window 1)))

;; bindings to move the cursor to beginning and end of a word
(global-set-key (kbd "C-<left>") 'left-word)
(global-set-key (kbd "C-<right>") 'right-word)

;; shenanigans for support eex elixir blocks
(require 'mmm-defaults)

(setq mmm-global-mode 'auto
      mmm-submode-decoration-level 0
      mmm-parse-when-idle t)


(add-to-list 'auto-mode-alist '("\\.html.eex\\'" . mhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html.leex\\'" . mhtml-mode))

(mmm-add-classes
 '((eex-elixir
    :submode elixir-mode
    :face mmm-declaration-submode-face
    :front "<%[#=%] " ;; regex to find the opening tag
    :back " %>"))) ;; regex to find the closing tag

(mmm-add-mode-ext-class 'mhtml-mode nil 'eex-elixir)

;; set automatic desktop save sessions and load on opening
(desktop-save-mode 1)

;; prevent ido from switching to other directories when creating/searching files
(setq ido-auto-merge-work-directories-length -1)


;; do auto buffer reverts when files are changed on disk and the buffer has no unsaved changes,
;; useful for git when changing branches to re-update all buffers that are open
(global-auto-revert-mode)
