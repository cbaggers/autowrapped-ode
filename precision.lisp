(in-package #:autowrapped-ode)

;;----------------------------------------------------------------------
;; Precision

(eval-when (:compile-toplevel :load-toplevel :execute)

  ;; figure out if this library is single or double precision...
  (defconstant +ode-precision+
    (if (search "ODE_double_precision" (cffi:foreign-funcall "dGetConfiguration" :string))
        :double
        :single)))
