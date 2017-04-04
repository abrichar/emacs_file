;; 42 stuff
(set-language-environment "UTF-8")
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                                64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
(setq config_files "~/.emacs.d")
(setq load-path (append (list nil config_files) load-path))
(setenv "MAIL" "abrichar@student.42.fr")
(load "list.el")
(load "string.el")
(load "comments.el")
(load "header.el")

; ajout perso.

; Supprime tous les espaces en fin de ligne 
; http://www.splode.com/users/friedman...re/emacs-lisp/ 
(autoload 'nuke-trailing-whitespace "whitespace" nil t)

; Activer la coloration syntaxique 
(global-font-lock-mode t)

;; Colorise en Rouge les espace 
(setq show-trailing-whitespace t)
(setq-default show-trailing-whitespace t)

; Affiche la parenthese & Accolade parrente 
(require 'paren)
(show-paren-mode)

;; Si Makefile vide, creer une makefile                                                                                                      
(add-hook 'find-file-hook
          (lambda()
            (if (and
                 (string-match "\\Makefile$" (buffer-file-name))
                 (= (buffer-size) 0))
                (create-makefile))))
 
;; Si header vide, creer un header protege                                                                                                   
(add-hook 'find-file-hook
          (lambda()
            (if (and
                 (string-match "\\.h$" (buffer-file-name))
                 (= (buffer-size) 0))
                (insert-protect-header
                 (goto-line 13)))))

;; Evite de taper 'yes' 'no' pour la sauvegarde
(fset 'yes-or-no-p 'y-or-n-p)

;; Autorise la souris
(unless window-system
(require 'mouse)
(xterm-mouse-mode t)
(global-set-key [mouse-4] '(lambda ()
(interactive)
(scroll-down 1)))
(global-set-key [mouse-5] '(lambda ()
(interactive)
(scroll-up 1)))
(defun track-mouse (e))
(setq mouse-sel-mode t)
)
