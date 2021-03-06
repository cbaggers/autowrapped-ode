(in-package #:raw-bindings-ode.ffi)

(defvar *name-mappings* nil)

(defun ffi-name-transformer (name kind &key &allow-other-keys)
  (unless *name-mappings*
    (setf *name-mappings* (make-hash-table :test #'equal)))
  (check-type name string)
  (let* ((l-name (map 'string
                      (lambda (_) (if (char= _ #\_) #\- _))
                      (string-upcase name))))
    (destructuring-bind (&optional maps-to-kind maps-to)
        (gethash l-name *name-mappings*)
      (if (and maps-to (eq kind maps-to-kind))
          (assert (equal maps-to name))
          (setf (gethash (list kind l-name) *name-mappings*) name)))
    l-name))

(defun ffi-export-predicate (symbol &key &allow-other-keys)
  (not (find-symbol (symbol-name symbol) :cl-user)))

(defun include? (name source-location include-definitions exclude-definitions
                 include-sources exclude-sources)
  (break "WITNESS MEEEE!"))
