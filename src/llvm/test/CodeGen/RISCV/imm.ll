; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV32I
; RUN: llc -mtriple=riscv64 -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV64I

; Materializing constants

; TODO: It would be preferable if anyext constant returns were sign rather
; than zero extended. See PR39092. For now, mark returns as explicitly signext
; (this matches what Clang would generate for equivalent C/C++ anyway).

define signext i32 @zero() nounwind {
; RV32I-LABEL: zero:
; RV32I:       # %bb.0:
; RV32I-NEXT:    mv a0, zero
; RV32I-NEXT:    ret
;
; RV64I-LABEL: zero:
; RV64I:       # %bb.0:
; RV64I-NEXT:    mv a0, zero
; RV64I-NEXT:    ret
  ret i32 0
}

define signext i32 @pos_small() nounwind {
; RV32I-LABEL: pos_small:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a0, zero, 2047
; RV32I-NEXT:    ret
;
; RV64I-LABEL: pos_small:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, 2047
; RV64I-NEXT:    ret
  ret i32 2047
}

define signext i32 @neg_small() nounwind {
; RV32I-LABEL: neg_small:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a0, zero, -2048
; RV32I-NEXT:    ret
;
; RV64I-LABEL: neg_small:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, -2048
; RV64I-NEXT:    ret
  ret i32 -2048
}

define signext i32 @pos_i32() nounwind {
; RV32I-LABEL: pos_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 423811
; RV32I-NEXT:    addi a0, a0, -1297
; RV32I-NEXT:    ret
;
; RV64I-LABEL: pos_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 423811
; RV64I-NEXT:    addiw a0, a0, -1297
; RV64I-NEXT:    ret
  ret i32 1735928559
}

define signext i32 @neg_i32() nounwind {
; RV32I-LABEL: neg_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 912092
; RV32I-NEXT:    addi a0, a0, -273
; RV32I-NEXT:    ret
;
; RV64I-LABEL: neg_i32:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 912092
; RV64I-NEXT:    addiw a0, a0, -273
; RV64I-NEXT:    ret
  ret i32 -559038737
}

define signext i32 @pos_i32_hi20_only() nounwind {
; RV32I-LABEL: pos_i32_hi20_only:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 16
; RV32I-NEXT:    ret
;
; RV64I-LABEL: pos_i32_hi20_only:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 16
; RV64I-NEXT:    ret
  ret i32 65536
}

define signext i32 @neg_i32_hi20_only() nounwind {
; RV32I-LABEL: neg_i32_hi20_only:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 1048560
; RV32I-NEXT:    ret
;
; RV64I-LABEL: neg_i32_hi20_only:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 1048560
; RV64I-NEXT:    ret
  ret i32 -65536
}

define i64 @imm64_1() nounwind {
; RV32I-LABEL: imm64_1:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 524288
; RV32I-NEXT:    mv a1, zero
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_1:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, 1
; RV64I-NEXT:    slli a0, a0, 31
; RV64I-NEXT:    ret
  ret i64 2147483648
}

; TODO: This and similar constants with all 0s in the upper bits and all 1s in
; the lower bits could be lowered to addi a0, zero, -1 followed by a logical
; right shift.
define i64 @imm64_2() nounwind {
; RV32I-LABEL: imm64_2:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a0, zero, -1
; RV32I-NEXT:    mv a1, zero
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_2:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, 1
; RV64I-NEXT:    slli a0, a0, 32
; RV64I-NEXT:    addi a0, a0, -1
; RV64I-NEXT:    ret
  ret i64 4294967295
}

define i64 @imm64_3() nounwind {
; RV32I-LABEL: imm64_3:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a1, zero, 1
; RV32I-NEXT:    mv a0, zero
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_3:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, 1
; RV64I-NEXT:    slli a0, a0, 32
; RV64I-NEXT:    ret
  ret i64 4294967296
}

define i64 @imm64_4() nounwind {
; RV32I-LABEL: imm64_4:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 524288
; RV32I-NEXT:    mv a0, zero
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_4:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, -1
; RV64I-NEXT:    slli a0, a0, 63
; RV64I-NEXT:    ret
  ret i64 9223372036854775808
}

define i64 @imm64_5() nounwind {
; RV32I-LABEL: imm64_5:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 524288
; RV32I-NEXT:    mv a0, zero
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_5:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, -1
; RV64I-NEXT:    slli a0, a0, 63
; RV64I-NEXT:    ret
  ret i64 -9223372036854775808
}

define i64 @imm64_6() nounwind {
; RV32I-LABEL: imm64_6:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 74565
; RV32I-NEXT:    addi a1, a0, 1656
; RV32I-NEXT:    mv a0, zero
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_6:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 9321
; RV64I-NEXT:    addiw a0, a0, -1329
; RV64I-NEXT:    slli a0, a0, 35
; RV64I-NEXT:    ret
  ret i64 1311768464867721216
}

define i64 @imm64_7() nounwind {
; RV32I-LABEL: imm64_7:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 45056
; RV32I-NEXT:    addi a0, a0, 15
; RV32I-NEXT:    lui a1, 458752
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_7:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, 7
; RV64I-NEXT:    slli a0, a0, 36
; RV64I-NEXT:    addi a0, a0, 11
; RV64I-NEXT:    slli a0, a0, 24
; RV64I-NEXT:    addi a0, a0, 15
; RV64I-NEXT:    ret
  ret i64 8070450532432478223
}

; TODO: it can be preferable to put constants that are expensive to materialise
; into the constant pool, especially for -Os.
define i64 @imm64_8() nounwind {
; RV32I-LABEL: imm64_8:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a0, 633806
; RV32I-NEXT:    addi a0, a0, -272
; RV32I-NEXT:    lui a1, 74565
; RV32I-NEXT:    addi a1, a1, 1656
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_8:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a0, 583
; RV64I-NEXT:    addiw a0, a0, -1875
; RV64I-NEXT:    slli a0, a0, 14
; RV64I-NEXT:    addi a0, a0, -947
; RV64I-NEXT:    slli a0, a0, 12
; RV64I-NEXT:    addi a0, a0, 1511
; RV64I-NEXT:    slli a0, a0, 13
; RV64I-NEXT:    addi a0, a0, -272
; RV64I-NEXT:    ret
  ret i64 1311768467463790320
}

define i64 @imm64_9() nounwind {
; RV32I-LABEL: imm64_9:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a0, zero, -1
; RV32I-NEXT:    mv a1, a0
; RV32I-NEXT:    ret
;
; RV64I-LABEL: imm64_9:
; RV64I:       # %bb.0:
; RV64I-NEXT:    addi a0, zero, -1
; RV64I-NEXT:    ret
  ret i64 -1
}
