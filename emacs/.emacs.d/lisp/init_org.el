;; org-mode customization
(require 'org)
(package-initialize)

;; special settings for latex export of org
(load "latexport.el")

; integrate globally (with exceptions)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

; some display settings
(setq org-hide-leading-stars t)
(setq org-agenda-span 1)
(setq org-deadline-warning-days 7)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-agenda-time-leading-zero t)
(setq org-agenda-todo-list-sublevels nil)
(setq org-agenda-time-grid nil)
(setq org-agenda-window-setup 'current-window)
(setq org-agenda-prefix-format
      (quote ((agenda . " %-12c%?-12t% s")
              (timeline . "  % s")
              (todo . " %-12c")
              (tags . " %-12c")
              (search . " %-12c"))))
(setq org-agenda-tags-column -99)
(setq org-log-into-drawer t)
(setq org-modules (quote (org-habit org-info)))
(setq org-habit-show-habits-only-for-today nil)
(setq org-habit-following-days 0) ; hide habit graph
(setq org-habit-preceding-days 0) ; hide habit graph
(setq org-hide-emphasis-markers t)

; safety
(setq org-catch-invisible-edits 'error)

; dependencies
(setq org-enforce-todo-dependencies t)
(setq org-agenda-dim-blocked-tasks t)
(setq org-enforce-todo-checkbox-dependencies nil)

; capture
(setq org-default-notes-file "~/org/notes.org")
(setq org-capture-templates '(("n" "Note" entry (file "~/org/notes.org") "* %?")))

; refiling
(setq org-refile-targets '((org-agenda-files :maxlevel . 9)
                           ("~/org/ref.org" :maxlevel . 9)))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-completion-use-ido t)

; exporting, use tag `ignore` to exclude heading, but put content
(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))

; reset checkboxes in repeating tasks
(require 'org-checklist)

; nice bullet points
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

; org babel
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (ditaa . t)
   (ledger . t)
   (python . t)
   (sh . t)
   ))
(setq org-babel-sh-command "zsh")
(setq org-ditaa-jar-path "/usr/bin/ditaa")
