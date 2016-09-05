(in-package #:autowrapped-ode)

(cffi:define-foreign-library libode
  (:unix (:or "libode.so" "libode.so.1" "libode.dylib"))
  (:windows "ode.dll")
  (t (:default "ode")))

(cffi:use-foreign-library libode)
