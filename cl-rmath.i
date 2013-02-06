%module "cl-rmath"

/* Everything ends up in a single file, since the package definition
   does not contain the export list and reloading the library would
   give errors otherwise because of symbols exported previously. */

%insert("lisphead") %{
(in-package #:cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package '#:cl-rmath)
    (defpackage #:cl-rmath
      (:use #:cl)
      (:nicknames #:rmath)
      (:shadow #:fround))))

(in-package #:cl-rmath)

(cffi:define-foreign-library librmath
  (:unix "libRmath.so")
  (t (:default "libRmath")))

(cffi:use-foreign-library librmath)

%}

/* R_VERSION_STRING is ignored because SBCL's defconstant doesn't like
   the redefinition of string constants. */

%feature("export");
%ignore R_VERSION_STRING;
#define MATHLIB_STANDALONE
%include "Rmath.h";
