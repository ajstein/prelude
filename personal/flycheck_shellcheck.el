(when (file-exists-p "/usr/bin/shellcheck")
    (when (require 'flycheck nil 'noerror)
    (flycheck-define-checker sh-shellcheck
      "A shell script syntax and style checker using Shellcheck."
      :command ("shellcheck" "-f" "checkstyle"
                "-s" (eval (symbol-name sh-shell))
                source)
      :modes sh-mode
      :error-parser flycheck-parse-checkstyle)))
