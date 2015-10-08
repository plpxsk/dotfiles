;; WHAT         supplementary Emacs functions
;; AUTHOR       [AMA!] Paul Paczuski [pavopax.com]  


(defun flyit ()
  "Quickly flyspell."
  (interactive)
  (flyspell-mode)
  (flyspell-buffer)
  )

;; ?? not working
(defun pdf-it ()
  "turn on pandoc and make pdf"
  (interactive)
  (pandoc-mode)
  (pandoc-convert-to-pdf)
  )
  


(defun insert-comblk ()
  "insert comment block."
       (interactive)
       (insert "## ============================================================================\n")
       (insert "## \n")
       (insert "## ============================================================================\n")
       (forward-line -2)
       (forward-char 3)			;NICE!!!!!!
       )
(global-set-key (kbd "C-c b") 'insert-comblk)




(defun header-text ()
  "initialize header for a text file"
       (interactive)
       (insert "# Readme for this dir       -*- mode: markdown -*-\n")
       (insert "Pawel Paczuski [pavopax.com]   [AMA!] 	\n")
       (insert "\n")
       (insert "Quick Start\n")
       (insert "===============================================================================\n")
       (insert "next/working on: in TODO.md\n")
       (insert "\n")
       (insert "Contents\n")
       (insert "===============================================================================\n")
       (insert "\n")
       (insert "Header1\n")
       (insert "===============================================================================\n")
       (insert "\n")
       (goto-line 1)
       (forward-char 2)
       )

;; alias it for frequent use
(defalias 'hh 'header-text)



;; (defun header-unix ()
;;   "initialize header for a unix file"
;;   (interactive)
;;   (insert "#!/bin/bash \n")
;;   (insert "# \n")
;;   (insert "# description: \n")
;;   (insert "#	 \n")
;;   (insert "# \n")
;;   (insert "# usage:  \n")
;;   (insert "#  \n")
;;   (insert "# requirements: \n")
;;   (insert "#  \n")
;;   (insert "# author: @pavopax \n")
;;   (insert "# \n")
;;   (goto-line 4)
;;   (forward-char 2)
;;   )


