(in-package #:autowrapped-ode)

;;----------------------------------------------------------------------
;; Precision

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; figure out if this library is single or double precision...
  (when (eq (search "ODE_double_precision" (cffi:foreign-funcall "dGetConfiguration" :string))
            :double)
    (error "The autowrapped-ode bindings currently only support the
single precision floating point version of the ODE library.

Sorry for the inconvenience")))
