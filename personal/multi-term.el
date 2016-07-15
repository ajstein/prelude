;;; multi-term.el --- My useful, but limted, keybindings.
;;
;; Copyright (c) 2016 Al S
;;
;; Author: Al S
;; URL: https://github.com/xee5ch/prelude.git
;; Version: 0.0.1
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Customizations for term and multi-term usage.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(require 'multi-term)

(defun term-send-C-x ()
  "Type C-x in term-mode."
  (interactive "*")
  (term-send-raw-string "\C-x"))

(defvar term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")
  "The key list that need to unbind.")

(setq term-bind-key-alist '(("C-c C-c"       . term-interrupt-subjob)
                            ("C-c C-z"       . term-stop-subjob)
                            ("C-c C-x"       . term-send-C-x)
                            ("C-c C-j"       . term-line-mode)
                            ("C-c C-k"       . term-char-mode)
                            ("C-a"           . term-send-home)
                            ("C-e"           . term-send-end)
                            ("C-c C-e"       . term-send-esc)
                            ("A-M-["         . multi-term-prev)
                            ("A-M-]"         . multi-term-next)
                            ("C-y"           . term-paste)
                            ("C-m"           . term-send-raw)
                            ("C-p"           . previous-line)
                            ("C-n"           . next-line)
                            ("C-s"           . isearch-forward)
                            ("C-r"           . isearch-backward)
                            ("M-f"           . term-send-forward-word)
                            ("M-b"           . term-send-backward-word)
                            ("M-o"           . term-send-backspace)
                            ("M-p"           . term-send-up)
                            ("M-n"           . term-send-down)
                            ("M-M"           . term-send-forward-kill-word)
                            ("M-N"           . term-send-backward-kill-word)
                            ("M-r"           . term-send-reverse-search-history)
                            ("M-,"           . term-send-input)
                            ("M-."           . comint-dynamic-complete)))

;;; Useful recommended code from:
;;; http://emacsredux.com/blog/2013/09/25/removing-key-bindings-from-minor-mode-keymaps/
(defun my-term-mode-hook ()
  (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)
    (define-key newmap (kbd "C-a") nil)
    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist))
  )

(add-hook 'term-mode-hook 'my-term-mode-hook)
;;; multi-term.el ends here
