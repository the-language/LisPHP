;;  LisPHP : Lisp -> PHP
;;  Copyright (C) 2017-2018  Zaoqi

;;  This program is free software: you can redistribute it and/or modify
;;  it under the terms of the GNU Affero General Public License as published
;;  by the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.

;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU Affero General Public License for more details.

;;  You should have received a copy of the GNU Affero General Public License
;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
(define (string-append* xs) (apply string-append xs))

(define (*displayln x) (string-append "echo "x))

(define (*boolean? x) (string-append "is_bool("x")"))
(define *true "true")
(define *false "false")
(define (*numeric? x) (string-append "is_numeric("x")"))
(define (*int? x) (string-append "is_int("x")"))
(define (*float? x) (string-append "is_float("x")"))
(define (**number x)
  (if (integer? x)
      (number->string (inexact->exact x))
      (number->string (exact->inexact x))))
(define (*string? x) (string-append "is_string("x")"))
(define (**string x)
  (string-append "\""(string-append* (map **string%char (string->list x)))"\""))
(define (**string%char c)
  (cond
    [(eq? c #\\) "\\\\"]
    [(eq? c #\newline) "\\n"]
    [(eq? c #\") "\\\""]
    [(eq? c #\$) "\\$"]
    [else (string c)]))

(define (%*app xs)
  (string-append* (add-between xs ",")))
(define (*apply f xs) (string-append f"("(%*app xs)")"))


(define (*vector? x) (string-append "is_array("x")"))
(define (*object? x) (string-append "is_object("x")"))
(define (*vector* xs) (string-append "array("(%*app xs)")"))
  
