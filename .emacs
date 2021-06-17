;; -*- mode: emacs-lisp -*-
;; LIGHTWEIGHT default .emacs
;; should work on any box - just make sure last line is commented out (see bottom)
;; Paul Paczuski / https://github.com/pavopax/dotfiles

;; ============================================================================
;; Up-front matter
;; ============================================================================
;; confirm emacs quit
(setq confirm-kill-emacs 'yes-or-no-p)

;; must load this in .emacs (?)
;; from emacs manual - Emacs Menu's 'save for future' items go here
;; instead of polluting the present file
(setq custom-file (concat user-emacs-directory "init.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; package management
;; https://github.com/melpa/melpa

;; NEXT TIME:
;; use `use-package`?
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;; list and install packages
;; https://realpython.com/emacs-the-best-python-editor/
;; also install
(defvar myPackages
  '(exec-path-from-shell
    flycheck
    py-autopep8
    magit
    expand-region
    solarized-theme
    elpy
    markdown-mode
    poly-R
    )
  )

;; manually installed into ~/.emacs.d/
;; ess

;; ;; installing manually for now
;; (mapc #'(lambda (package)
;; 	  (unless (package-installed-p package)
;; 	    (package-install package)))
;;       myPackages)

;; M-x package install RET exec-path-from-shell RET
;; https://github.com/purcell/exec-path-from-shell
;; needed to find `R` location for ESS, etc

;; FROM *Messages* on startup:
;; You appear to be setting environment variables ("PATH") in your .bashrc or
;; .zshrc: those files are only read by interactive shells, so you should
;; instead set environment variables in startup files like .profile,
;; .bash_profile or .zshenv.  Refer to your shell’s man page for more info.
;; Customize ‘exec-path-from-shell-arguments’ to remove "-i" when done, or
;; disable ‘exec-path-from-shell-check-startup-files’ to disable this message.

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; ============================================================================
;; 1) Look + Behavior
;; ============================================================================
;; Remove the toolbar
(tool-bar-mode -1)

;; remove scroll
(scroll-bar-mode -1)

(setq initial-frame-alist
      '(
	(top . 0) (left . 0)
	(width . 110) (height . 65)
	)
)

(setq default-frame-alist '( (left . 0) (top . 0) (height . 65) (width . 100) ))

;;(set-face-attribute 'default nil :height 100)

;; change title bar display to show buffer name and file location
(setq frame-title-format "%b - %+ %f")
;; or file name if available, otherwise buffer name
;; (setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; Show column number at bottom of screen
(column-number-mode 1)

;; disable the bell/alarm completely
(setq ring-bell-function 'ignore)

;; disable system beep (eg, during C-g), and replace with visual
(setq visible-bell 1)

;; Turn highlighting on (when marking region with C-SPC)
;; default on?
;; (transient-mark-mode t)

;; replace highlighted text with typed text
;; and enable C-d to delete highlighted text
(delete-selection-mode t)

;; Autosave every 500 typed characters
(setq auto-save-interval 500)

;; Autosave after 5 seconds of idle time
(setq auto-save-timeout 5)		;set low, in case freezes and have to kill

;; increase messages log size
(setq message-log-max 500)

;; line numbers
;; (global-linum-mode)

;; Highlight the current line
(global-hl-line-mode 1)

;; truncate long lines
;; (setq default-truncate-lines t)

;; make side by side buffer function the same as the main window
;; (setq truncate-partial-width-windows nil)
;; toggle with F12
(global-set-key (kbd "<f12>") 'toggle-truncate-lines)

;; show matching paren in color (in addition to highlight)
(show-paren-mode t)

;; "ctrl - left click" buffer menu increase number of items
(setq mouse-buffer-menu-maxlen 40)
(setq mouse-buffer-menu-mode-mult 50)

(put 'set-goal-column 'disabled nil)


;; put backup files in separate location
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist `(("." . "~/.backups")))
(setq backup-by-copying t)
;; see tramp-auto-save-directory below

;; set fill column
(setq-default fill-column 79)
;; requires emacs version 27+
(global-display-fill-column-indicator-mode)



;; speed up tramp
;; https://emacs.stackexchange.com/a/37855/11872
(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
                    vc-ignore-dir-regexp
                    tramp-file-name-regexp))
(setq tramp-verbose 1)

;; this apparently speeds up tramp
(setq tramp-auto-save-directory "~/.backups/tramp/")



;; ============================================================================
;; 2) Navigation + Keyboard
;; ============================================================================

;; IDO-MODE
;; enhanced behavior for opening files and switching buffers, etc
;; http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; use `a` to open files
(put 'dired-find-alternate-file 'disabled nil)

;; don't ask to create new buffer with C-x b  ; choices: always, prompt, never
(setq ido-create-new-buffer 'prompt)
(setq ido-file-extensions-order '(".txt" ".Rmd" ".sas" ".lst"))

;; use M-s to immediately search dirs
(setq ido-auto-merge-delay-time 3)

;; redefine ctrl-z to undo. see link for other options about suspend
;; http://stackoverflow.com/questions/7243155/cant-seem-to-get-rid-of-ctrl-x-ctrl-z-key-binding-in-emacs-for-minimizing-windo
(global-set-key (kbd "C-z") 'undo)

;; quickly jump between windows
;; https://emacs.stackexchange.com/a/3471
(defun prev-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)


;; faster  C-x 1 || C-x 2
;; (global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'split-window-below)
(global-set-key [f3] 'split-window-right)


(defun switch-to-scratch ()
  "Pop to *scratch* buffer"
  (interactive)
  (switch-to-buffer '"*scratch*"))

(global-set-key [f9] 'switch-to-scratch)

;; cmd-b to switch buffers
(global-set-key (kbd "s-b") 'ido-switch-buffer)

;; cmd-o to open files with ido instead of GUI (default)
(global-set-key (kbd "s-o") 'ido-find-file)


;; default is F11
(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)
;; errors:
;;(global-set-key [268632070] 'toggle-frame-fullscreen)
;;(global-set-key (kbd "C-s-268632070") 'toggle-frame-fullscreen)


;; c-a to back to indent or BOL
(defun beginning-of-line-or-indentation ()
  "Move to beginning of line, or indentation."
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)

;; recent files: see emacs wiki
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; by default, it is C-x C-r, but see recentf above
(global-set-key (kbd "C-x r f") 'find-file-read-only)

;; hide other windows with macOS CMD-OPT-h
;; https://github.com/syl20bnr/spacemacs/issues/7464
;; https://github.com/syl20bnr/spacemacs/pull/7536/files
(global-set-key (kbd "M-s-h") 'ns-do-hide-others)
(global-set-key [142607065] 'ns-do-hide-others)


;; Turn off click-follows-link in Markdown mode.
(defun disable-goto-addr ()
  (setq-local mouse-1-click-follows-link nil)
  ; turn middle clicks into the default action, normally pasting the primary
  ; selection.
  (define-key markdown-mode-mouse-map [mouse-2] nil)
)
(add-hook 'markdown-mode-hook 'disable-goto-addr)

;; enable yasnippet minor mode in Rmd/md/polymode markdown)
;; create/use snippets:
;; http://joaotavora.github.io/yasnippet/snippet-development.html
;; M-x yas-new-snippet
;; then save with C-c C-c
;; M-x yas-visit-snippet-file, key binding: C-c & C-v
(add-hook 'markdown-mode-hook 'yas-minor-mode)


;; Update: yasnippet doesn't switch the mode inside the R chunk to evaluate it
;; via ESS. So go back to custom function with the following code
(defun polymode-insert-new-chunk ()
  "Insert R code chunk when in polymode"
  (interactive)
  (insert "\n```{r}\n")
  (save-excursion
    (newline)
    (insert "```\n")
    (previous-line)))

;; add keyboard shortcut
;; KEEP the following snippet as a template for future
;; (add-hook 'poly-markdown-mode-hook
;;           (lambda () (define-key polymode-mode-map (kbd "M-n M-i") 'polymode-insert-new-chunk)))
;; The above works. following DO NOT work:
;; (add-hook 'polymode-mode '(define-key polymode-mode-map (kbd "M-i") 'polymode-insert-new-chunk))
;; (add-hook 'poly-markdown-mode-hook
;;           (lambda () (local-set-key (kbd "M-n M-i") 'polymode-insert-new-chunk)))
;; (add-hook 'markdown-mode-hook
;;           (lambda () (local-set-key (kbd "M-n M-i") 'polymode-insert-new-chunk)))
;; use this:
(add-hook 'poly-markdown-mode-hook
          (lambda () (define-key polymode-mode-map (kbd "M-n M-i") 'polymode-insert-new-chunk)))

;; https://github.com/magnars/expand-region.el
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; use this for spell check, after running `brew install aspell`
(setq-default ispell-program-name "/usr/local/bin/aspell")


;; prevent weird menu bar crashes
;; https://github.com/polymode/poly-R/issues/15#issuecomment-622308273
(define-key global-map [menu-bar file revert-buffer] nil)

;; ============================================================================
;; 3) More functions
;; ============================================================================

;; also see https://emacs.stackexchange.com/a/47432/11872
(defun bee-shell ()
  "Load command-line R on BEE server"
  (interactive)
    (shell)
    (rename-buffer "RR-bee")
    (comint-send-string "RR-bee" "ssh bee\n")
    (comint-send-string "RR-bee" "R-3.6.1\n")
    (ess-remote "*shell*" "R")
    )

(defun pred1-shell ()
  "Step 1 to load command-line R on pRED HPC server"
  (interactive)
  ;; force to run shell and ssh from local directory/machine, not any connected
  ;; remote/tramp directory https://emacs.stackexchange.com/a/64581/11872
  (let ((default-directory "~/"))
    (shell))
  (rename-buffer "RR-pred")
  (comint-send-string "RR-pred" "ssh pred\n")
  )

(defun pred2-r-load ()
  "Step 2 to load command-line R on pRED HPC server"
  (interactive)
  (comint-send-string "RR-pred" "ml R/4.0.1-foss-2018b\n")
  ;; run via interactive job of 6 hours (default is 2)
  ;; added Thu May  7 11:49:41 EDT 2020
  (comint-send-string "RR-pred" "interactive -t 360 -c 2 -m 24G\n")
  (comint-send-string "RR-pred" "R\n")
  ;; uncomment?. this seems to mess with M-p command cycling...
  ;; (ess-remote "RR-pred" "R")
  )

(defun pred ()
  "Load remote R shell on pRED"
  (interactive)
  (pred1-shell)
  ;; need to wait a bit between these steps
  (sleep-for 5)
  (pred2-r-load)
  )


(defun rescomp1-shell ()
  "Load command-line R.1 on rescomp"
  (interactive)
  (shell)
  (rename-buffer "RR-rescomp")
  (comint-send-string "RR-rescomp" "ssh rosalind.gene.com\n")
  ;; (comint-send-string "RR-rescomp" "module load apps/R/3.5.1-Bioc-3.7-prd/prd\n")
  ;; (comint-send-string "RR-rescomp" "R\n")
  ;; (ess-remote "*shell*" "R")
  )


(defun rescomp2-r-load()
  "Load R in rescomp shell"
  (interactive)
  (comint-send-string "RR-rescomp" "module load R\n")
  ;; run interactive job
  ;; added Thu May  7 11:49:41 EDT 2020
  (comint-send-string "RR-rescomp" "interactive\n")
  (comint-send-string "RR-rescomp" "R\n")
  (ess-remote "*shell*" "R")
  )

(defun rmd-init ()
  "Initialize R markdown notebook with default header."
       (interactive)
       (insert "---\n")
       (insert "title: ''\n")
       (insert "output: github_document\n")
       (insert "---")
       (forward-line -3)
       (forward-char 12)
       )

(defun flyit ()
  "Quickly flyspell."
  (interactive)
  (flyspell-mode)
  (flyspell-buffer)
  )

(defun insert-comblk ()
  "Insert comment block."
       (interactive)
       (insert "## ============================================================================\n")
       (insert "## \n")
       (insert "## ============================================================================")
       (forward-line -1)
       (forward-char 3)			;NICE!!!!!!
       )
(global-set-key (kbd "C-c b") 'insert-comblk)


;; ============================================================================
;; 4) Theme
;; ============================================================================

;; M-x package-install zenburn-them
;; https://github.com/bbatsov/zenburn-emacs
;; (load-theme 'zenburn t)

;; M-x package-install solarized-theme
;; https://github.com/bbatsov/solarized-emacs
;; first, load options, then load theme

(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-dark t)

(defun lightit ()
  "Quickly switch to light theme."
  (interactive)
  (load-theme 'solarized-light t)
  )

(defun darkit ()
  "Quickly switch to dark theme."
  (interactive)
  (load-theme 'solarized-dark t)
  )


;; ============================================================================
;; 5) ESS
;; ============================================================================



;; IMPORTANT:
;; Install this version manually. this version seems to work best with pRED HPC
;; Remotes
;; http://ess.r-project.org/Manual/ess.html#Installation
(add-to-list 'load-path "~/.emacs.d/ESS-ESSRv1.5/lisp")
(require 'ess-site)

(eval-after-load "ess-mode"
  '(define-key ess-mode-map (kbd "<S-return>") 'ess-eval-region-or-line-and-step))

;; use M-- as assignment operator
;; https://github.com/emacs-ess/ESS/issues/809#issuecomment-469214062

;; currently get error for this:
;; Polymode error (pm--mode-setup ’ess-r-mode): Symbol’s function definition is void: ess-add-MM-keys
;;(eval-after-load "ess-mode" '(ess-add-MM-keys))

;; default in `ess-r-flymake.el` via `C-h v ess-r-flymake-linters`
;; customize BELOW
;; (setq ess-r-flymake-linters
;;       '(
;; 	"closed_curly_linter = NULL"
;; 	"commas_linter = NULL"
;; 	"commented_code_linter = NULL"
;; 	"infix_spaces_linter = NULL"
;; 	"line_length_linter = NULL"
;; 	"object_length_linter = NULL"
;; 	"object_name_linter = NULL"
;; 	"object_usage_linter = NULL"
;; 	"open_curly_linter = NULL"
;; 	"pipe_continuation_linter = NULL"
;; 	"single_quotes_linter = NULL"
;; 	"spaces_inside_linter = NULL"
;; 	"spaces_left_parentheses_linter = NULL"
;; 	"trailing_blank_lines_linter = NULL"
;; 	"trailing_whitespace_linter = NULL"
;; 	)
;;       )

;; copy-paste from above list
(setq ess-r-flymake-linters
      '(
	"infix_spaces_linter = NULL"
	)
      )

;; 2021 March
;; https://github.com/emacs-ess/ESS/issues/490#issuecomment-538682487
(setq ess-use-flymake nil)

(setq ess-ask-for-ess-directory nil)


(setq ess-help-own-frame 'one)

;; evaluate code invisibly
;; pushing code to R sometimes significantly adds to runtime, and may be unstable
;; https://stackoverflow.com/q/2770523/3217870
(setq ess-eval-visibly 'nil)



;; ESS OLD BELOW

;; don't auto scroll to bottom inn ess process buffers
;; (setq comint-scroll-to-bottom-on-input nil)
;; (setq comint-scroll-to-bottom-on-output nil)
;; (setq comint-move-point-for-output nil)

;;(global-set-key (kbd "M--")  (lambda () (interactive) (insert " <- ")))
;; (ess-toggle-underscore nil)

;;(setq ess-r--lintr-file '("~/.lintr"))

;; ============================================================================
;; 6) Python Elpy
;; ============================================================================

;; pyvenv needs WORKON_HOME but emacs doesn't find it, so set it here
;; https://github.com/jorgenschaefer/pyvenv
;; https://emacs.stackexchange.com/a/20093/11872
(setenv "WORKON_HOME" "/Users/paczuskp/Envs")

;; this changes EMACS' python mode, which is then used by elpy as "interactive
;; python" (see elpy-config)
;; put it before elpy (?)
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

;; alternative interpreter for pHPC remote server
;; run with `M-x run-python`, see run-hpc-python below
(defun set-hpc-py-interpreter ()
  "Set python interpreter for working on remote pHPC"
  (interactive)
  ;; this variable requires a shell script
  ;; https://adamoudad.github.io/posts/emacs/docker-python-shell-emacs/
  (setq python-shell-interpreter "~/.tramp-emacs-python-shell.sh")
  )

(defun run-hpc-python ()
  "Set python env then start remote python"
  (interactive)
  (set-hpc-py-interpreter)
  (run-python)
  )

;; https://realpython.com/emacs-the-best-python-editor/
;; install package `elpy`
(elpy-enable)

(setq elpy-rpc-python-command "/usr/local/opt/python@3.8/bin/python3")

;; install flycheck above
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)


;; installed manually
;; https://github.com/technomancy/find-file-in-project
(add-to-list 'load-path "~/.emacs.d/find-file-in-project/")
(require 'find-file-in-project)

;; ============================================================================
;; Last
;; ============================================================================
(pop-to-buffer (find-file"~/Desktop/GD/code/R-codesaver.R"))
(pop-to-buffer (find-file"~/Desktop/GD/code/python-codesaver.py"))
(pop-to-buffer (find-file"~/Desktop/GD/code/sxratch.md"))

