# Running this Makefile is only necessary when Rmath.h changes.

RMATH_DIRECTORY=/usr/include/
LISP_FILENAME=cl-rmath.lisp

all: $(LISP_FILENAME)

$(LISP_FILENAME): cl-rmath.i $(RMATH_DIRECTORY)/Rmath.h
	swig2.0 -cffi -I$(RMATH_DIRECTORY) $<

.PHONY: clean

clean:
	rm $(LISP_FILENAME)
