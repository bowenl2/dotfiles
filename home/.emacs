;; Bugfix for Arjen theme in new emacs versions
(defun plist-to-alist (the-plist)
  (defun get-tuple-from-plist (the-plist)
    (when the-plist
      (cons (car the-plist) (cadr the-plist))))

  (let ((alist '()))
    (while the-plist
      (add-to-list 'alist (get-tuple-from-plist the-plist))
      (setq the-plist (cddr the-plist)))
  alist))

;; Line / column numbers
(require 'linum)
(global-linum-mode)
(column-number-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(linum-format "%4d  ")
 '(php-mode-force-pear t))

;; Backups
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; Include all subdirectories of .emacs.d automatically
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; p4
(load-library "p4")

;; Tabs
(define-key text-mode-map (kbd "TAB") 'self-insert-command);
    
;; php-mode
(require 'php-mode)
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-align)
            (php-align-setup)
	    (setq fill-column 78)
	    (set (make-local-variable 'compile-command)
                 (concat "`pwd | sed 's|\\(.*/amici_php\\).*|\\1|'`/scripts/phpunit --stop-on-failure --verbose --syntax " buffer-file-name))))
(add-hook 'c-mode-common-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))

(add-to-list 'compilation-error-regexp-alist '("^\\(\/.*?\\):\\([0-9]+\\)$" 1 2))
(add-to-list 'compilation-error-regexp-alist '("PHP Fatal error: .+?\\(\/.*\\) on line \\([0-9]+\\)$" 1 2))

;; parentheses
(setq show-paren-mode t)
(require 'highlight-parentheses)
(highlight-parentheses-mode)

;; ido-mode
(require 'ido)
(ido-mode t)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; color-theme
(require 'color-theme)
(setq color-theme-is-global t)
(setq theme-default 'color-theme-arjen)
(color-theme-arjen)

;; projectile
(require 'projectile)

;; Display unambiguous names below and full path above
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

;; packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-^") 'mc/edit-lines)

;; fic
(require 'fic-mode)
(add-hook 'php-mode-hook 'turn-on-fic-mode)

;; sqlplus
(require 'sqlplus)

;; fiplr!
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(setq fiplr-root-markers '(".git" ".svn" "app_builder"))

;; figlet
(require 'figlet)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
