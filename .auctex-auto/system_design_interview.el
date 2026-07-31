;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "system_design_interview"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("report" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("listings" "") ("amsthm" "") ("amsmath" "") ("tcolorbox" "") ("calligra" "") ("siunitx" "") ("url" "") ("float" "") ("caption" "labelformat=empty") ("varwidth" "") ("tikz" "") ("graphicx" "") ("parskip" "")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "report"
    "rep10"
    "listings"
    "amsthm"
    "amsmath"
    "tcolorbox"
    "calligra"
    "siunitx"
    "url"
    "float"
    "caption"
    "varwidth"
    "tikz"
    "graphicx"
    "parskip")
   (TeX-add-symbols
    "oldsection"
    "oldsubsection"
    "oldsubsubsection"
    "oldparagraph"
    "oldsubparagraph")
   (LaTeX-add-labels
    "tab:label")
   (LaTeX-add-environments
    '("defbox" 1))
   (LaTeX-add-array-newcolumntypes
    "M"))
 :latex)

