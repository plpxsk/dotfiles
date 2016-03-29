;; ============================================================================
;; WHAT         .emacs init head file
;; HOW          has links to other files, see "contents"
;; AUTHOR       [AMA!] Pawel Paczuski [pavopax.com]
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
(package-initialize)

(setq package-archives
      '(
	("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")
	)
      )


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
;;(setq load-path (append load-path (list "~/.emacs.d/elpa/popup-20151222.1339/")))


;;(setq load-path (append load-path (list )))
;; (setq load-path
;;       (append load-path (list "~/.emacs.d/elpa/auto-complete-20160107.8/"))
;;       )



(require 'auto-complete-config)
(ac-config-default)
;; (add-to-list 'ac-modes 'sas-mode)
;; (add-to-list 'ac-modes 'ess-mode)
;; (add-to-list 'ac-modes 'SAS-mode)
(add-to-list 'ac-modes 'markdown-mode)

;; delay autocomplete
(setq ac-delay 0.2)
;; delay appearance of menu; t=immediate
(setq ac-auto-show-menu 0.7)



;;(global-auto-complete-mode t)
;; http://stackoverflow.com/questions/8095715/emacs-auto-complete-mode-at-startup

;; load autocomplete
;;(add-to-list 'ac-dictionary-directories "h:/.emacs.d/auto-complete/dict")
;; add keyboard cut
;; (define-key ac-mode-map (kbd "C-TAB") 'auto-complete)


;; web-mode
;;(setq load-path (append load-path (list "~/.emacs.d/elpa/web-mode-20160212.538/")))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; RMD, md as markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode))






;; from emacs manual - Emacs Menu's 'save for future' items go here
(setq custom-file "~/.emacs.d/init.el")
(load custom-file)

;; append to exec path
;; for, eg pandoc	$  which pandoc		$ /usr/local/bin/pandoc
(setq exec-path (append exec-path '("/usr/local/bin")))
;; for latex
;; (setq exec-path (append exec-path '("/usr/texbin")))
;;(setenv "PATH" (concat "/usr/texbin" ":" (getenv "PATH"))) 
(setenv "PATH" (concat "/Library/TeX/texbin/" ":" (getenv "PATH")))




;; use this for spell check, after running `brew install aspell --with-lang-en`
;;(setq-default ispell-program-name "aspell")
(setq-default ispell-program-name "/usr/local/bin/aspell")

;; use this for markdown, after running `brew install markdown`
(custom-set-variables '(markdown-command "/usr/local/bin/markdown"))



;; key-chords; pure magic
;; "like aliases in unix"
;; space-chord just adds function space-chord-define-global
;; http://emacswiki.org/emacs/key-chord.el
;; see its header for details
;; use C-h k to find the function name (the last part in key-chord-define-global)
(require 'key-chord)
;;(require 'space-chord)                
(key-chord-mode 1)
(key-chord-define-global "dg" 'keyboard-quit)
(key-chord-define-global "dg" 'minibuffer-keyboard-quit)
(key-chord-define-global "hj" 'undo) 

;;(key-chord-define-global "sf" 'isearch-forward)
;;(key-chord-define-global "fb" 'isearch-backward)
 
(key-chord-define-global "bb" 'ido-switch-buffer)
(key-chord-define-global "xb" 'list-buffers)
(key-chord-define-global "kk" 'ido-kill-buffer)
;;(space-chord-define-global "f" 'ido-find-file)
(key-chord-define-global "ZZ" 'ido-find-file)
(key-chord-define-global "SS" 'save-buffer)
 
;;(space-chord-define-global "o" 'other-window)







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
	(width . 88) (height . 57)
	)
)


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
(setq mouse-buffer-menu-mode-mult 50)

(put 'set-goal-column 'disabled nil)



;; put backup files in separate location
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist `(("." . "~/.backups")))
(setq backup-by-copying t)



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
(load-theme 'solarized t)


(defun lightit ()
  "Quickly switch to light theme."
  (interactive)
  (set-frame-parameter nil 'background-mode 'light)
  ;; (set-terminal-parameter frame 'background-mode light)
  (enable-theme 'solarized)
  )



(defun darkit ()
  "Quickly switch to dark theme."
  (interactive)
  (set-frame-parameter nil 'background-mode 'dark)
  ;; (set-terminal-parameter frame 'background-mode light)
  (enable-theme 'solarized)
  )


(darkit)

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

(global-set-key (kbd "C-c s") 'loader-ess)

(loader-ess)

;; evaluate code invisibly
;; pushing code to R sometimes significantly adds to runtime, and may be unstable
;; http://stackoverflow.com/questions/2770523/how-can-i-background-the-r-process-in-ess-emacs
(setq ess-eval-visibly-p 'nowait)

(provide '.emacs)

;;; .emacs ends here
(put 'dired-find-alternate-file 'disabled nil)


;; open some files at startup
(pop-to-buffer (find-file "~/.emacs.d/sxratch.txt"))

