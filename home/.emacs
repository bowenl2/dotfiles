;; Liam Bowen
;; .emacs

;; packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; whitespace and formatting
(setq-default show-trailing-whitespace t)
(set-default 'truncate-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)
(define-key text-mode-map (kbd "TAB") 'self-insert-command);

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

;; Modes and stuff
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("README\\.md" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.\\(p\\(?:k[bg]\\|ls\\)\\|sql\\)\\'" . plsql-mode))

;; plsql
(add-to-list 'load-path "~/.emacs.d/plsql/")
(require 'plsql)


;; parentheses
;; (setq-default show-paren-mode t) ; this highlights the current pair
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; ido-mode
(require 'ido)
(ido-mode t)

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
(setq fiplr-root-markers '(".git" ".svn" "app_builder"))

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
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(php-mode-force-pear t))
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

;; ,----
;; | XLS
;; `----
(defun xls-common ()
  (require 'php-mode)
  (add-hook 'php-mode-hook
            (lambda ()
              (require 'php-align)
              (php-align-setup)
              (setq fill-column 78))))

;; alyssa
(when (string= system-name "alyssa.amicillc.com")
  (xls-common)
  (ssh-xterm-tmux)
  (load-library "p4"))
