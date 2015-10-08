This package provides native code completion for the Go Programming
Language.
To enable, ad the following code into your .emacs:
(require 'go-complete)
(add-hook 'completion-at-point-functions 'go-complete-at-point)
