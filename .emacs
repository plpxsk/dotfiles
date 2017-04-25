;; ============================================================================
;; WHAT         .emacs init head file
;; HOW          has links to other files, see "contents"
;; AUTHOR       [AMA!] Paul Paczuski [pavopax.com]
;;
;; CONTENTS
;;  EMACS LOAD PATHS (need to be at top) and MODES
;;  EMACS@COMMON
;;	emacs behavior and look
;;	keyboard shortcuts
;;  EMACS: load ADDITIONAL FILE with custom functions and shortcuts
;;  EMACS@LAST
;;	COLOR-THEME-SOLARIZED
;;	ESS: EMACS SPEAKS STATISTICS
;;
;; NOTES
;;	can omit ".el" when loading .el files
;;      edit default font in customize - faces - basic face - default face
;; ============================================================================

;; ============================================================================
;; EMACS LOAD PATHS (need to be at top) and MODES
;; ============================================================================
;; confirm emacs quit
(setq confirm-kill-emacs 'yes-or-no-p)

;; PACKAGE MANAGEMENT
;; http://stackoverflow.com/questions/19142142/emacs-auto-complete-mode-not-working
;; required for ELPA packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; (setq package-archives
;;       '(
;; 	("gnu" . "http://elpa.gnu.org/packages/")
;; 	("marmalade" . "http://marmalade-repo.org/packages/")
;; 	("melpa" . "http://melpa.milkbox.net/packages/")
;; 	)
;;       )


;; IDO-MODE
;; enhanced behavior for opening files and switching buffers, etc
;; http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; don't ask to create new buffer with C-x b  ; choices: always, prompt, never
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".txt" ".sas" ".lst"))

;; use M-s to immediately search dirs
(setq ido-auto-merge-delay-time 3)

;; sas mode is uppercase.. and lisp is case sensitive !!! !! !!
(setq load-path (append load-path (list "~/.emacs.d/lisp")))
(setq load-path (append load-path (list "~/.emacs.d/elpa")))

(require 'auto-complete-config)
(ac-config-default)
;; (add-to-list 'ac-modes 'sas-mode)
(add-to-list 'ac-modes 'ess-mode)
;; (add-to-list 'ac-modes 'SAS-mode)
(add-to-list 'ac-modes 'markdown-mode)

;; delay autocomplete
(setq ac-delay 0.3)
;; delay appearance of menu; t=immediate
(setq ac-auto-show-menu 0.7)

(global-auto-complete-mode 0)
;; http://stackoverflow.com/questions/8095715/emacs-auto-complete-mode-at-startup

;; load autocomplete
;;(add-to-list 'ac-dictionary-directories "h:/.emacs.d/auto-complete/dict")
;; add keyboard cut to get TAB mode
;; this is actually emacs' auto-complete, so it is also for company-mode (?)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(add-hook 'after-init-hook 'global-company-mode)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; POLYMODE
(setq load-path (append '("~/.emacs.d/polymode/"  "~/.emacs.d/polymode/modes") load-path))

;; MARKDOWN

;; use this for markdown, after running `brew install markdown`
;; (custom-set-variables '(markdown-command "/usr/local/bin/markdown"))
(custom-set-variables '(markdown-command "/usr/local/bin/pandoc"))


(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))


;; from emacs manual - Emacs Menu's 'save for future' items go here
(setq custom-file "~/.emacs.d/init.el")
(load custom-file)

;; append to exec path
;; for, eg pandoc	$  which pandoc		$ /usr/local/bin/pandoc
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/Users/pawel/anaconda/bin"))) ;for flake8
;; for latex
;; (setq exec-path (append exec-path '("/usr/texbin")))
;;(setenv "PATH" (concat "/usr/texbin" ":" (getenv "PATH"))) 
(setenv "PATH" (concat "/Library/TeX/texbin/" ":" (getenv "PATH")))
(setenv "PATH" (concat "/Users/pawel/anaconda/bin" ":" (getenv "PATH"))) ;for flake8



;; use this for spell check, after running `brew install aspell --with-lang-en`
;;(setq-default ispell-program-name "aspell")
(setq-default ispell-program-name "/usr/local/bin/aspell")


;; KEY-CHORDS
;; pure magic :"like aliases in unix"
;; space-chord just adds function space-chord-define-global
;; http://emacswiki.org/emacs/key-chord.el
;; see its header for details
;; use C-h k to find the function name (the last part in key-chord-define-global)

;; DISABLING for performance reasons
;; (require 'key-chord)
;;(require 'space-chord)                
;; (key-chord-mode 1)
;; (key-chord-define-global "bb" 'ido-switch-buffer)
;; (key-chord-define-global "kk" 'ido-kill-buffer)

;;(space-chord-define-global "f" 'ido-find-file) 
;;(space-chord-define-global "o" 'other-window)


;; install package: `fill-column-indicator`
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;(global-fci-mode 0)



;; PYTHON:
;; (defun ipython ()
;;     (interactive)
;;     (term "/Users/pawel/anaconda/bin/ipython"))

;; use 2 spaces for python indent
;; (custom-set-variables
;;  '(python-guess-indent nil)
;;  '(python-indent 2))

(setq python-shell-interpreter "/Users/pawel/anaconda/bin/python")

;; use ELPY
;; https://github.com/jorgenschaefer/elpy

(elpy-enable)
(setq elpy-rpc-python-command "/Users/pawel/anaconda/bin/python")
;;(elpy-use-ipython)

;; don't need this?
;;(setq elpy-rpc-python-command "/Users/pawel/anaconda/bin/python")



;; MORE PYTHON MAGIC

;; (require 'python-mode)
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
; use IPython
;; (setq-default py-shell-name "python")
;;(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; (setq py-force-py-shell-name-p t)

;; ; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ; try to automagically figure out indentation
;; (setq py-smart-indentation t)



;; ============================================================================
;; EMACS@COMMON
;; ============================================================================

;; =======================
;; emacs behavior and look
;; =======================

;; initial frame position
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


;; use color fonts - seems to be on by default
;;(global-font-lock-mode t)

;; Show column number at bottom of screen
(column-number-mode 1)

;; Remove the toolbar
(tool-bar-mode -1)

;; remove scroll
(scroll-bar-mode -1)

;; use mouse wheel - on by default
;; (mouse-wheel-mode t)

;; remove menu bar ("file", "help", etc)
;; (menu-bar-mode -1)

;; disable system beep (eg, during C-g), and replace with visual
;;(setq visible-bell nil)

;; disable the bell/alarm completely
(setq ring-bell-function 'ignore)

;; show matching paren in color (in addition to highlight)
(show-paren-mode t)

;; Turn highlighting on (when marking region with C-SPC)
(transient-mark-mode t)

;; replace highlighted text with typed text
;; and enable C-d to delete highlighted text
(delete-selection-mode t)

;; Autosave every 500 typed characters
(setq auto-save-interval 500)

;; Autosave after 5 seconds of idle time
(setq auto-save-timeout 5)		;set low, in case freezes and have to kill

;; Scroll just one line when hitting bottom of window
(setq scroll-conservatively 10000)

;; C-v , M-v scroll to farthest point - doesnt work?
;; (setq scroll-error-top-bottom t)

;; allow C-v M-v when using search -doesnt work?
;; (setq isearch-allow-scroll t)

;; increase messages log size
(setq message-log-max 500)

;; move mouse when cursor near
(mouse-avoidance-mode 'cat-and-mouse)

;; line numbers
(global-linum-mode)

;; Highlight the current line
(global-hl-line-mode 1)

;; truncate long lines
;; (setq default-truncate-lines t)

;; make side by side buffer function the same as the main window
(setq truncate-partial-width-windows nil)
;; toggle with F12
(global-set-key (kbd "<f12>") 'toggle-truncate-lines)

;; confirm emacs quit
(setq confirm-kill-emacs 'yes-or-no-p)

;; "ctrl - left click" buffer menu increase number of items
(setq mouse-buffer-menu-maxlen 40)
(setq mouse-buffer-menu-mode-mult 50)

(put 'set-goal-column 'disabled nil)



;; put backup files in separate location
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist `(("." . "~/.backups")))
(setq backup-by-copying t)



;; set fill column
(setq-default fill-column 79)

;; slower mouse scroll (macOS trackpad)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))


;; =====================
;; keyboard shortcuts
;; =====================

;; redefine ctrl-z to undo. see link for other options about suspend
;; http://stackoverflow.com/questions/7243155/cant-seem-to-get-rid-of-ctrl-x-ctrl-z-key-binding-in-emacs-for-minimizing-windo
(global-set-key (kbd "C-z") 'undo)

;; easy to top, bottom
;; (global-set-key "\M-," 'beginning-of-buffer)
;; (global-set-key "\M-." 'end-of-buffer)

;; cycle through buffers
;; (global-set-key (kbd "<C-tab>") 'bury-buffer)

;; faster  C-x 1 || C-x 2
(global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'split-window-below)
(global-set-key [f4] 'split-window-right)

;; c-a to back to indent or BOL
(defun beginning-of-line-or-indentation ()
  "Move to beginning of line, or indentation."
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)

;; turn on autocomplete
(global-set-key (kbd "C-c a") 'auto-complete-mode)

;; recent files: see emacs wiki
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; by default, it is C-x C-r, but see recentf above
(global-set-key (kbd "C-x r f") 'find-file-read-only)


;; I hit this too often. default is C-x k
(global-set-key (kbd "C-x C-k") 'ido-kill-buffer)


;; hide other windows with macOS CMD-OPT-h
;; https://github.com/syl20bnr/spacemacs/issues/7464
;; https://github.com/syl20bnr/spacemacs/pull/7536/files
(global-set-key (kbd "M-s-h") 'ns-do-hide-others)
(global-set-key [142607065] 'ns-do-hide-others)

;; ============================================================================
;; EMACS: load ADDITIONAL FILE with custom functions and shortcuts
;; ============================================================================
(load "~/.pinit")





;; ============================================================================
;; EMACS@LAST
;; ============================================================================

;; COLOR-THEME-SOLARIZED
;; (1) TWO options:  bbatsov or below
;; https://github.com/bbatsov/solarized-emacs

;; had some trouble with using newer solarized recently...
;; (load-theme 'solarized t)
;; (set-frame-parameter nil 'background-mode 'light)
;; (setq frame-background-mode 'dark)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-solarized-20160219.924")

;; https://github.com/sellout/emacs-color-theme-solarized/issues/167
(customize-set-variable 'frame-background-mode 'dark)
(load-theme 'solarized t)

(defun lightit ()
  "Quickly switch to light theme."
  (interactive)
  (customize-set-variable 'frame-background-mode 'light)
  (load-theme 'solarized t)
  )



(defun darkit ()
  "Quickly switch to dark theme."
  (interactive)
  (customize-set-variable 'frame-background-mode 'dark)
  (load-theme 'solarized t)
  )


;; previous experiments with updating solarized:
;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (let ((mode (if (display-graphic-p frame) 'dark 'light)))
;;               (set-frame-parameter frame 'background-mode mode)
;;               (set-terminal-parameter frame 'background-mode mode))
;;             (enable-theme 'solarized)))

;;(setq load-path (append load-path (list "~/.emacs.d/elpa/color-theme-20080305.34")))
;; (color-theme-initialize)

;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-dark t)





;; ==============================
;; ESS: EMACS SPEAKS STATISTICS
;; ==============================
;; save time at startup by loading on-demand (obsolete with SSD's...)
(defun loader-ess ()
  "Load ess for syntax highlighting."
  (interactive)
  (load "~/.emacs.d/ess-15.09/lisp/ess-site")
  (require 'ess-site)
  )

(loader-ess)

;; create a new frame for each help instance
;; but all help buffers go into one frame 
(setq ess-help-own-frame t)
(setq ess-help-own-frame 'one)

;; evaluate code invisibly
;; pushing code to R sometimes significantly adds to runtime, and may be unstable
;; http://stackoverflow.com/questions/2770523/how-can-i-background-the-r-process-in-ess-emacs
(setq ess-eval-visibly-p 'nowait)

(provide '.emacs)

;;; .emacs ends here
(put 'dired-find-alternate-file 'disabled nil)


;; open some files at startup
(pop-to-buffer (find-file "~/code-temp/scratch.R"))
(pop-to-buffer (find-file "~/code-temp/scratch.py"))
(pop-to-buffer (find-file "~/icloud/CODE/CODESAVERS/sxratch.txt"))

(put 'erase-buffer 'disabled nil)
