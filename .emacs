;; Default .Emacs
;; Paul Paczuski / pavopax.com


;; ============================================================================
;; Up-front matter
;; ============================================================================
;; confirm emacs quit
(setq confirm-kill-emacs 'yes-or-no-p)

;; from emacs manual - Emacs Menu's 'save for future' items go here
;; instead of polluting the present file
(setq custom-file "~/.emacs.d/init.el")
(load custom-file)

;; package management
;; http://stackoverflow.com/questions/19142142/emacs-auto-complete-mode-not-working
;; required for ELPA packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)


;; ============================================================================
;; Paths + Modes
;; ============================================================================
;; exec-path-from-shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; https://www.emacswiki.org/emacs/ExecPath
;; (setq exec-path (append exec-path '("/usr/local/bin")))


;; use this for spell check, after running `brew install aspell --with-lang-en`
(setq-default ispell-program-name "/usr/local/bin/aspell")

;; sas mode is uppercase.. and lisp is case sensitive !!! !! !!
(setq load-path (append load-path (list "~/.emacs.d/lisp")))
(setq load-path (append load-path (list "~/.emacs.d/elpa")))
(setq load-path (append load-path (list "~/.emacs.d/pipenv/pipenv")))

;; M-x package-install RET auto-complete RET
(require 'auto-complete-config)


(ac-config-default)
;; (add-to-list 'ac-modes 'sas-mode)
;; (add-to-list 'ac-modes 'ess-mode)
;; (add-to-list 'ac-modes 'SAS-mode)
;; (add-to-list 'ac-modes 'markdown-mode)
;; (add-to-list 'ac-modes 'r-mode)
;; (add-to-list 'ac-modes 'ess-s-mode)

;; http://stackoverflow.com/questions/8095715/emacs-auto-complete-mode-at-startup
(global-auto-complete-mode 0)

;; use tab for completion instead of return
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)
(define-key ac-completing-map [tab] 'ac-complete)
(define-key ac-completing-map [return] nil)

;; delay autocomplete
(setq ac-delay 0.3)
;; delay appearance of menu; t=immediate
(setq ac-auto-show-menu 0.7)

;; load autocomplete
;;(add-to-list 'ac-dictionary-directories "h:/.emacs.d/auto-complete/dict")
;; add keyboard cut to get TAB mode
;; this is actually emacs' auto-complete, so it is also for company-mode (?)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(add-hook 'after-init-hook 'global-company-mode)

;; web-mode
;; M-x package-install RET web-mode RED
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; MARKDOWN
;; `brew install markdown`
(custom-set-variables '(markdown-command "/usr/local/bin/pandoc"))
;; POLYMODE
;; https://github.com/vspinu/polymode
(setq load-path (append
'("~/.emacs.d/polymode/" "~/.emacs.d/polymode/modes") load-path))

(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; Turn off click-follows-link in Markdown mode.
(defun disable-goto-addr ()
  (setq-local mouse-1-click-follows-link nil)
  ; turn middle clicks into the default action, normally pasting the primary
  ; selection.
  (define-key markdown-mode-mouse-map [mouse-2] nil)
)
(add-hook 'markdown-mode-hook 'disable-goto-addr)


;; PYTHON

;; use ELPY, install: https://github.com/jorgenschaefer/elpy
;; (I installed jedi instead of rope)
(elpy-enable)
;;(setq elpy-rpc-backend "jedi")

;; in "Virtual Envs" menu, show me conda envs
(setenv "WORKON_HOME" "~/miniconda3/envs")


;; DO NOT use, will overwrite virtual envs (conda)
;; (setq python-shell-interpreter "/Users/paczuskp/miniconda3/bin/python")

;; quite distracting when enabled at all times
;; M-x flycheck-mode
;; (global-flycheck-mode)



;; yasnippet!
;; append to default so dont lose it

(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/snippets")))

(yas-global-mode 1)

;; ============================================================================
;; Navigation + Keyboard
;; ============================================================================
;; IDO-MODE
;; enhanced behavior for opening files and switching buffers, etc
;; http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; don't ask to create new buffer with C-x b  ; choices: always, prompt, never
(setq ido-create-new-buffer 'never)
(setq ido-file-extensions-order '(".txt" ".sas" ".lst"))

;; use M-s to immediately search dirs
(setq ido-auto-merge-delay-time 3)

;; KEY-CHORDS
;; space-chord just adds function space-chord-define-global
;; DISABLING for performance reasons
;; http://emacswiki.org/emacs/key-chord.el
;; (require 'key-chord)
;; (require 'space-chord)
;; (key-chord-mode 1)
;; (key-chord-define-global "bb" 'ido-switch-buffer)
;; (key-chord-define-global "kk" 'ido-kill-buffer)
;; (space-chord-define-global "f" 'ido-find-file)

;; redefine ctrl-z to undo. see link for other options about suspend
;; http://stackoverflow.com/questions/7243155/cant-seem-to-get-rid-of-ctrl-x-ctrl-z-key-binding-in-emacs-for-minimizing-windo
(global-set-key (kbd "C-z") 'undo)

;; easy to top, bottom
;; (global-set-key "\M-," 'beginning-of-buffer)
;; (global-set-key "\M-." 'end-of-buffer)

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

;; git, other VC

;; working: kill  window after push
;; (defun my-kill-vc-hook ()
;;   (kill-buffer ediff-buffer-A)
;;   (kill-buffer ediff-buffer-B)
;;   (kill-buffer ediff-buffer-C))

;; (add-hook 'vc-push 'keyboard-quit)

;; https://magit.vc/manual/magit/Getting-Started.html#Getting-Started
;; (global-set-key (kbd "C-x g") 'magit-status)
;; (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
;; use magit instead of built-in VC
;; (setq vc-handled-backends nil)




;; ============================================================================
;; Look + Behavior
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

;; M-x RET package-install RET fill-column-indicator
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)


;; put backup files in separate location
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist `(("." . "~/.backups")))
(setq backup-by-copying t)

;; set fill column
(setq-default fill-column 79)

;; SOLARIZED
;; https://github.com/bbatsov/solarized-emacs
(load-theme 'solarized-dark)

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

;; ESS Emacs Speaks Statistics
;; cd ~/.emacs.d; git clone https://github.com/emacs-ess/ESS.git
(add-to-list 'load-path "~/.emacs.d/ESS/lisp/")
(require 'ess-site)
(put 'dired-find-alternate-file 'disabled nil)

(setq ess-ask-for-ess-directory nil)

(setq ess-help-own-frame nil)
(setq ess-help-own-frame 'one)

;; don't auto scroll to bottom inn ess process buffers
(setq comint-scroll-to-bottom-on-input nil)
(setq comint-scroll-to-bottom-on-output nil)
;; (setq comint-move-point-for-output nil)



;; remap <- key
;; (setq ess-smart-S-assign-key (kbd "M--"))
;; (ess-toggle-S-assign nil)
;; (ess-toggle-S-assign nil)

(global-set-key (kbd "M--")  (lambda () (interactive) (insert " <- ")))
(ess-toggle-underscore nil)

;; evaluate code invisibly
;; pushing code to R sometimes significantly adds to runtime, and may be unstable
;; http://stackerflow.com/questions/2770523/how-can-i-background-the-r-process-in-ess-emacs
(setq ess-eval-visibly-p 'no)


(load "~/.emacs.d/.emacs_local")




;; load some files
(pop-to-buffer (find-file"~/icloud/CODE/CODESAVERS/R-codesaver.R"))
(pop-to-buffer (find-file"~/icloud/CODE/CODESAVERS/python-codesaver.py"))
(pop-to-buffer (find-file"~/icloud/CODE/CODESAVERS/sxratch.txt"))
