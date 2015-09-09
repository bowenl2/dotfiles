;; Liam Bowen
;; .emacs

;; after macro
(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY.

This allows us to define configuration for features that aren't
always installed and only eval that configuration after the feature is loaded.

ELPA packages usually provide an -autoloads feature which we can
use to determine if the package is installed/loaded."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))


;; packages
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;; keybindings
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x g") 'magit-status)
(define-key text-mode-map (kbd "TAB") 'self-insert-command);

;; autocomplete with golang
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'go-autocomplete)
(require 'auto-complete-config)

;; whitespace and formatting
(setq-default show-trailing-whitespace t)
(set-default 'truncate-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)

;; automatically load buffers that change on disk
(global-auto-revert-mode t)

;; column numbers
(column-number-mode 1)

;; tramp
(setq tramp-default-method "sshx")

;; include .emacs.d automatically
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Backups
(setq auto-save-default nil) ; stop creating those #autosave# files
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; Stop killing emacs by accident
(setq confirm-kill-emacs 'yes-or-no-p)

;; windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)


;; enter
(add-hook 'c-mode-common-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))

;; Mode from filename
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))

;; parentheses
;; (setq-default show-paren-mode t) ; this highlights the current pair
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-show-count t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; web-mode
(require 'web-mode)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq frame-title-format
  '(:eval
    (if buffer-file-name
        (replace-regexp-in-string
         "\\\\" "/"
         (replace-regexp-in-string
          (regexp-quote (getenv "HOME")) "~"
          (convert-standard-filename buffer-file-name)))
      (buffer-name))))

;; fic
(require 'fic-mode)
(add-hook 'c-mode-common-hook 'turn-on-fic-mode)
(add-hook 'text-mode-hook 'turn-on-fic-mode)

;; multiple-cursors
(global-set-key (kbd "C-^") 'mc/edit-lines)

;; fiplr!
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(setq fiplr-root-markers '(".git" ".svn"))

;; figlet
(require 'figlet)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(put 'dired-find-alternate-file 'disabled nil)

;; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes (quote ("d9639ebed5f3709f47b53e4bb8eea98a11455ab9336039cf06e9695a0233d5fb" default)))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-comment-keywords "TODO")
 '(web-mode-enable-engine-detection t)
 '(web-mode-markup-indent-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; wombat theme
(load-theme 'wombat t)

(defun ssh-xterm-tmux ()
  ;; Resize things less ridiculously - this is a hack for XTERM/SSH/TMUX
  (global-set-key (kbd "M-[ d") 'shrink-window-horizontally)
  (global-set-key (kbd "M-[ c") 'enlarge-window-horizontally)
  (global-set-key (kbd "M-[ a") 'shrink-window)
  (global-set-key (kbd "M-[ b") 'enlarge-window))

(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)

;; org
(require 'org)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-html-doctype "html5")
(setq org-agenda-files (list "~/Dropbox/org/"))

(load "term/xterm")
;  (xterm-register-default-colors)

(projectile-global-mode)
