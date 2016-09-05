(in-package #:autowrapped-ode)

;;----------------------------------------------------------------------
;; dReal - The type of this depends on the precission of the ODE
;;         library we have loaded


(eval-when (:compile-toplevel :load-toplevel :execute)
  (ecase +ode-precision+
    (:double (cffi:defctype d-real :double))
    (:single (cffi:defctype d-real :float))))
