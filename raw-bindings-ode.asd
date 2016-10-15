;;;; raw-bindings-ode.asd

(asdf:defsystem #:raw-bindings-ode
  :description "Absolute minimal bindings of ODE"
  :author "Chris Bagley (Baggers) <techsnuffle@gmail.com>"
  :license "BSD 2 Clause"
  :defsystem-depends-on (:cffi/c2ffi)
  :depends-on (#:cffi #:cffi/c2ffi #:cffi-libffi)
  :serial t
  :components
  ((:file "package")
   (:file "c2ffi-transforms")
   (:module "spec"
            :components
            ((:cffi/c2ffi-file
              "ode.h"
              :package #:raw-bindings-ode
              :foreign-library-name "raw-bindings-ode::libode"
              :include-sources ("collision.h"
                                "collision_space.h"
                                "collision_trimesh.h"
                                "common.h"
                                "contact.h"
                                "error.h"
                                "mass.h"
                                "objects.h"
                                "ode.h"
                                "odeinit.h")
              :exclude-sources :all
              ;; :ffi-include-predicate "raw-bindings-ode.ffi::include?"
              :ffi-name-transformer "raw-bindings-ode.ffi::ffi-name-transformer"
              :ffi-export-predicate "raw-bindings-ode.ffi::ffi-export-predicate"

              :foreign-library-spec ((:unix (:or "libode.so" "libode.so.1" "libode.dylib"))
                                     (:windows "ode.dll")
                                     (t (:default "ode"))))))
   (:file "precision")))
