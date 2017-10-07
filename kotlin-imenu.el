;;; package -- Summary:
;;; Commentary:
;;; An attempt of indexing kotlin files for imenu

;;; Code:
(defun kotlin-imenu-hook ()
  "Hook for kotlin-mode."
  (setq-local imenu-create-index-function 'kotlin-imenu))

(defun kotlin-imenu-expressions ()
  "Regexps for imenu."
  (list
   (list nil "\\(.[^companion]*\\)\\(companion .[^{]*\\)" 2)
   (list nil "\\(.[^constructor]*\\)\\(constructor.[^)]*\)\\)" 2)
   (list nil "\\(.[^fun]*\\) \\(fun .[^)|{|=]*\)\\)" 2)
   (list nil "\\(class .[^:|{|\(]*\\)" 1)
   (list nil "\\(interface .[^:|{|\(]*\\)" 1)
   ))

(defun kotlin-imenu ()
  "Create imenu index for kotlin-mode."
  (imenu--generic-function (kotlin-imenu-expressions)))

(add-hook 'kotlin-mode-hook 'kotlin-imenu-hook)

(provide 'kotlin-imenu)
;;; kotlin-imenu.el ends here
