;;; apu-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "apu" "apu.el" (22029 59727 201101 445000))
;;; Generated autoloads from apu.el

(autoload 'apu-chars-next-match-method "apu" "\
Cycle among the methods of matching character names.

\(fn)" t nil)

(autoload 'apu-chars-matching-full-words "apu" "\
Show all Unicode chars whose names match a pattern you type.
Same as `apropos-char' with a non-nil value of
`apu-match-words-exactly-flag': match each entry of a word-list
pattern as a full word.

\(fn)" t nil)

(autoload 'apu-chars-matching-two-or-more-words "apu" "\
Show all Unicode chars whose names match a pattern you type.
Same as `apropos-char' with a nil value of
`apu-match-two-or-more-words-flag': match two or more entries of a
word-list pattern, as a full word.

\(fn)" t nil)

(autoload 'apu-chars-matching-words-as-substrings "apu" "\
Show all Unicode chars whose names match a pattern you type.
Same as `apropos-char' with a nil value of
`apu-match-words-exactly-flag': match each entry of a word-list
pattern as a substring.

\(fn)" t nil)

(autoload 'apu-char-name-at-point "apu" "\
Return the name of the Unicode character at point, or nil if none.
Non-nil POSITION means use the character at POSITION.

\(fn &optional POSITION MSGP)" t nil)

(autoload 'apu-char-codepoint-at-point "apu" "\
Return the codepoint of the Unicode char at point, or nil if none.
Non-nil POSITION means use the character at POSITION.

\(fn &optional POSITION MSGP)" t nil)

(autoload 'apu-copy-char-at-point-as-kill "apu" "\
Copy the character at point to the `kill-ring'.

\(fn &optional MSGP)" t nil)

(autoload 'apu-copy-char-at-point-to-second-sel "apu" "\
Copy the character at point to the secondary selection.
If you have library `second-sel.el' then also copy it to the
`secondary-selection-ring'.

\(fn &optional MSGP)" t nil)

(autoload 'apu-zoom-char-at-point "apu" "\
Show the Unicode char at point in a zoomed tooltip.
With a numerical prefix arg, show it that many times larger.
Non-nil POSITION means use the character at POSITION.

\(fn &optional HEIGHT POSITION)" t nil)

(defalias 'describe-chars-in-region 'apu-chars-in-region)

(autoload 'apu-chars-in-region "apu" "\
Describe the Unicode characters in the region.
By default, list each distinct char only once.  With a prefix arg,
list a given char once for each of its occurrences in the region.
The character descriptions are presented in `apu-mode'.

\(fn START END &optional INCLUDE-DUPS)" t nil)

(defalias 'apropos-unicode 'apropos-char)

(defalias 'apu-chars 'apropos-char)

(autoload 'apropos-char "apu" "\
Show all Unicode chars whose names match a pattern.
The pattern is as for command `apropos': a word, a list of words
 (separated by spaces), or a regexp (using some regexp special
 characters).  If it is a word, search for matches for that word as a
 substring.  If it is a list of words, search for matches for any two
 (or more) of those words.

The character descriptions are presented in `apu-mode'.

You can provide additional patterns, to narrow the set of displayed
characters to those that also match the additional patterns or to
those that do not match them.  `*' and `-' do this, respectively.

Non-nil option `apu-match-only-displayable-chars-flag' means match
only characters that are `char-displayable-p' in the buffer where
`apropos-char' is invoked.  This is the default.  A nil value means
match all Unicode characters.

Non-nil option `apu-match-words-exactly-flag' means each word in a
word-list pattern must match exactly, as a full word.  A nil
value (the default) means each word must match only as a substring.

Non-nil option `apu-match-two-or-more-words-flag' means only two or
more words of a word-list pattern must match (exactly, as full words).
A nil value (the default) means *each* word must match.  A non-nil
value gives the same behavior as the ordinary `apropos' commands.

For example, if `apu-match-two-or-more-words-flag' is non-nil then
instead of trying to match each of the words `greek', `small', and
`letter' in any order, the command tries to match only each pair of
these words (in both pair orders), so you get some results that match
only two of the three words.  This might not be what you want in most
cases.

You can use `C-c n' to refresh the matches using the next match type.
Instead of cycling among match types this way, you can change the
match type directly during refresh, as follows:

 C-c s	- Use substring matching
 C-c 2	- Use pairwise full-word matching (match two or more words)
 C-c w	- Use full-word matching for each list entry

See also these global commands, which use the different match
methods (without changing the option values):
`apu-chars-matching-words-as-substrings'
`apu-chars-matching-full-words' `apu-chars-matching-two-or-more-words'

Simple tips for matching some common Unicode character names:
* You can match chars that have a given base char, such as `e', by
  using a regexp ` (BASE-CHAR |$)'.  That matches BASE-CHAR after a
  `SPC' char and before a `SPC' char or at the end of the line.
* You can use `small letter' to match lowercase letters, and `capital
  letter' to match capital letters.  Just `small' matches lots of
  chars that are not letters.  Just `capital' matches chars that
  include capital letters that serve as math symbols and such.

\\{apu-mode-map}

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; apu-autoloads.el ends here
