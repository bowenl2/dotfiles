;;; org-octopress-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (org-jekyll-insert-export-options-template org-jekyll-publish-to-html
;;;;;;  org-jekyll-export-to-html org-jekyll-export-as-html) "ox-jekyll"
;;;;;;  "ox-jekyll.el" (21251 55851 199177 190000))
;;; Generated autoloads from ox-jekyll.el

(autoload 'org-jekyll-export-as-html "ox-jekyll" "\
Export current buffer to a HTML buffer adding some YAML front matter.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)" t nil)

(autoload 'org-jekyll-export-to-html "ox-jekyll" "\
Export current buffer to a HTML file adding some YAML front matter.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY BODY-ONLY EXT-PLIST)" t nil)

(autoload 'org-jekyll-publish-to-html "ox-jekyll" "\
Publish an org file to HTML with YAML front matter.

FILENAME is the filename of the Org file to be published.  PLIST
is the property list for the given project.  PUB-DIR is the
publishing directory.

Return output file name.

\(fn PLIST FILENAME PUB-DIR)" nil nil)

(autoload 'org-jekyll-insert-export-options-template "ox-jekyll" "\
Insert a settings template for Jekyll exporter.

\(fn &optional TITLE DATE SETUPFILE CATEGORIES PUBLISHED LAYOUT)" t nil)

;;;***

;;;### (autoloads nil nil ("org-octopress-pkg.el" "org-octopress.el")
;;;;;;  (21251 55851 203015 707000))

;;;***

(provide 'org-octopress-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-octopress-autoloads.el ends here
