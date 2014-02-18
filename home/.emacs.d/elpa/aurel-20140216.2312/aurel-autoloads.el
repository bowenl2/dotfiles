;;; aurel-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (aurel-maintainer-search aurel-package-search aurel-package-info)
;;;;;;  "aurel" "aurel.el" (21251 46289 408777 448000))
;;; Generated autoloads from aurel.el

(autoload 'aurel-package-info "aurel" "\
Display information about AUR package NAME-OR-ID.
NAME-OR-ID may be a string or a number.
The buffer for showing results is defined by `aurel-info-buffer-name'.
With prefix (if ARG is non-nil), show results in a new info buffer.

\(fn NAME-OR-ID &optional ARG)" t nil)

(autoload 'aurel-package-search "aurel" "\
Search for AUR packages matching a string STR.
The buffer for showing results is defined by `aurel-list-buffer-name'.
With prefix (if ARG is non-nil), show results in a new buffer.

\(fn STR &optional ARG)" t nil)

(autoload 'aurel-maintainer-search "aurel" "\
Search for AUR packages by maintainer NAME.
The buffer for showing results is defined by `aurel-list-buffer-name'.
With prefix (if ARG is non-nil), show results in a new buffer.

\(fn NAME &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("aurel-pkg.el") (21251 46289 417883 773000))

;;;***

(provide 'aurel-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; aurel-autoloads.el ends here
