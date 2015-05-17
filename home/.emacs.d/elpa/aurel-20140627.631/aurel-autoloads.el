;;; aurel-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (aurel-installed-packages aurel-maintainer-search
;;;;;;  aurel-package-search aurel-package-info) "aurel" "aurel.el"
;;;;;;  (21849 1197 185057 0))
;;; Generated autoloads from aurel.el

(autoload 'aurel-package-info "aurel" "\
Display information about AUR package NAME-OR-ID.
NAME-OR-ID may be a string or a number.
The buffer for showing results is defined by `aurel-info-buffer-name'.
With prefix (if ARG is non-nil), show results in a new info buffer.

\(fn NAME-OR-ID &optional ARG)" t nil)

(autoload 'aurel-package-search "aurel" "\
Search for AUR packages matching STRING.

STRING can be a string of multiple words separated by spaces.  To
search for a string containing spaces, quote it with double
quotes.  For example, the following search is allowed:

  \"python library\" plot

The buffer for showing results is defined by
`aurel-list-buffer-name'.  With prefix (if ARG is non-nil), show
results in a new buffer.

\(fn STRING &optional ARG)" t nil)

(autoload 'aurel-maintainer-search "aurel" "\
Search for AUR packages by maintainer NAME.
The buffer for showing results is defined by `aurel-list-buffer-name'.
With prefix (if ARG is non-nil), show results in a new buffer.

\(fn NAME &optional ARG)" t nil)

(autoload 'aurel-installed-packages "aurel" "\
Display information about AUR packages installed in the system.
The buffer for showing results is defined by `aurel-list-buffer-name'.
With prefix (if ARG is non-nil), show results in a new buffer.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("aurel-pkg.el") (21849 1197 196679 510000))

;;;***

(provide 'aurel-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; aurel-autoloads.el ends here
