;;;; autowrapped-ode.asd

(asdf:defsystem #:autowrapped-ode
  :description "The most minimal bindings over ode"
  :author "Chris Bagley (Baggers <techsnuffle@gmail.com>"
  :license "BSD 2 Clause"
  :serial t
  :depends-on (:cl-autowrap)
  :components
  ((:module spec
            :pathname "spec"
            :components
            ((:static-file "collision.h")
             (:static-file "collision_space.h")
             (:static-file "collision_trimesh.h")
             (:static-file "common.h")
             (:static-file "contact.h")
             (:static-file "error.h")
             (:static-file "mass.h")
             (:static-file "objects.h")
             (:static-file "odeinit.h")
             (:static-file "ode.h")
             (:static-file "ode.arm-pc-linux-gnu.spec")
             (:static-file "ode.i386-unknown-freebsd.spec")
             (:static-file "ode.i686-apple-darwin9.spec")
             (:static-file "ode.i686-pc-linux-gnu.spec")
             (:static-file "ode.i686-pc-windows-msvc.spec")
             (:static-file "ode.x86_64-apple-darwin9.spec")
             (:static-file "ode.x86_64-pc-linux-gnu.spec")
             (:static-file "ode.x86_64-pc-windows-msvc.spec")
             (:static-file "ode.x86_64-unknown-freebsd.spec")))
   (:file "package")
   (:file "library")
   (:file "precision")
   ;; (:file "d-real") disabled until I can work out how to exlude dReal from being autowrapped
   (:file "autowrap")))
