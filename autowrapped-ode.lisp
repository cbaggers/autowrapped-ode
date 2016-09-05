(in-package #:autowrapped-ode)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defparameter *d-transform-exclusions*
    '("dError"
      "dDebug"
      "dMessage"
      "dReal"
      "dTriIndex"
      "dVector3"
      "dReal"
      "dVector4"
      "dReal"
      "dMatrix3"
      "dReal"
      "dMatrix4"
      "dReal"
      "dMatrix6"
      "dReal"
      "dQuaternion"
      "dReal")))

(c-include
 '(autowrapped-ode spec "ode.h")
 :spec-path '(autowrapped-ode spec)
 :include-sources ("odeinit.h"
                   "collision.h"
                   "common.h"
                   "contact.h"
                   "error.h"
                   "mass.h"
                   "collision_space.h"
                   "collision_trimesh.h"
                   "objects.h")
 :exclude-sources ("/usr/local/lib/clang/([^/]*)/include/(?!stddef.h)"
                   "/usr/include/"
                   "/usr/include/arm-linux-gnueabihf"
                   "/usr/include/X11/")
 :symbol-regex
 (("^d[A-Z]" () (lambda (string matches regex)
                  (if (member string *d-transform-exclusions*
                              :test #'string=)
                      string
                      (progn
                        (format t "~%changing ~s to ~s"
                                string (subseq string 1))
                        (subseq string 1))))))
 ;;:release-p cl:t ;; this stops message in logs
 :no-accessors cl:t)
