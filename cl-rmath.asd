;;;; cl-rmath.asd

(asdf:defsystem #:cl-rmath
  :description "A Common Lisp wrapper for the Rmath library."
  :version "0.0.1"
  :author "Tamas K. Papp"
  :license "Boost Software License - Version 1.0"
  :serial t
  :depends-on (#:cffi)
  :components ((:file "cl-rmath")))
