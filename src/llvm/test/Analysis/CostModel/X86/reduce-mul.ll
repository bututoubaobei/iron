; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s -cost-model -costmodel-reduxcost=true -mtriple=x86_64-apple-darwin -analyze -mattr=+sse2 | FileCheck %s --check-prefixes=CHECK,SSE,SSE2
; RUN: opt < %s -cost-model -costmodel-reduxcost=true -mtriple=x86_64-apple-darwin -analyze -mattr=+ssse3 | FileCheck %s --check-prefixes=CHECK,SSE,SSSE3
; RUN: opt < %s -cost-model -costmodel-reduxcost=true -mtriple=x86_64-apple-darwin -analyze -mattr=+sse4.2 | FileCheck %s --check-prefixes=CHECK,SSE,SSE42
; RUN: opt < %s -cost-model -costmodel-reduxcost=true -mtriple=x86_64-apple-darwin -analyze -mattr=+avx | FileCheck %s --check-prefixes=CHECK,AVX,AVX1
; RUN: opt < %s -cost-model -costmodel-reduxcost=true -mtriple=x86_64-apple-darwin -analyze -mattr=+avx2 | FileCheck %s --check-prefixes=CHECK,AVX,AVX2
; RUN: opt < %s -cost-model -costmodel-reduxcost=true -mtriple=x86_64-apple-darwin -analyze -mattr=+avx512f | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512F
; RUN: opt < %s -cost-model -costmodel-reduxcost=true -mtriple=x86_64-apple-darwin -analyze -mattr=+avx512f,+avx512bw | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512BW
; RUN: opt < %s -cost-model -costmodel-reduxcost=true -mtriple=x86_64-apple-darwin -analyze -mattr=+avx512f,+avx512dq | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512DQ

define i32 @reduce_i64(i32 %arg) {
; SSE-LABEL: 'reduce_i64'
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %V1 = call i64 @llvm.experimental.vector.reduce.mul.i64.v1i64(<1 x i64> undef)
; SSE-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64> undef)
; SSE-NEXT:  Cost Model: Found an estimated cost of 27 for instruction: %V4 = call i64 @llvm.experimental.vector.reduce.mul.i64.v4i64(<4 x i64> undef)
; SSE-NEXT:  Cost Model: Found an estimated cost of 59 for instruction: %V8 = call i64 @llvm.experimental.vector.reduce.mul.i64.v8i64(<8 x i64> undef)
; SSE-NEXT:  Cost Model: Found an estimated cost of 123 for instruction: %V16 = call i64 @llvm.experimental.vector.reduce.mul.i64.v16i64(<16 x i64> undef)
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX1-LABEL: 'reduce_i64'
; AVX1-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %V1 = call i64 @llvm.experimental.vector.reduce.mul.i64.v1i64(<1 x i64> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 44 for instruction: %V4 = call i64 @llvm.experimental.vector.reduce.mul.i64.v4i64(<4 x i64> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 80 for instruction: %V8 = call i64 @llvm.experimental.vector.reduce.mul.i64.v8i64(<8 x i64> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 152 for instruction: %V16 = call i64 @llvm.experimental.vector.reduce.mul.i64.v16i64(<16 x i64> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX2-LABEL: 'reduce_i64'
; AVX2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %V1 = call i64 @llvm.experimental.vector.reduce.mul.i64.v1i64(<1 x i64> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 22 for instruction: %V4 = call i64 @llvm.experimental.vector.reduce.mul.i64.v4i64(<4 x i64> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 38 for instruction: %V8 = call i64 @llvm.experimental.vector.reduce.mul.i64.v8i64(<8 x i64> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 70 for instruction: %V16 = call i64 @llvm.experimental.vector.reduce.mul.i64.v16i64(<16 x i64> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'reduce_i64'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %V1 = call i64 @llvm.experimental.vector.reduce.mul.i64.v1i64(<1 x i64> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 22 for instruction: %V4 = call i64 @llvm.experimental.vector.reduce.mul.i64.v4i64(<4 x i64> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 35 for instruction: %V8 = call i64 @llvm.experimental.vector.reduce.mul.i64.v8i64(<8 x i64> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 51 for instruction: %V16 = call i64 @llvm.experimental.vector.reduce.mul.i64.v16i64(<16 x i64> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512BW-LABEL: 'reduce_i64'
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %V1 = call i64 @llvm.experimental.vector.reduce.mul.i64.v1i64(<1 x i64> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 22 for instruction: %V4 = call i64 @llvm.experimental.vector.reduce.mul.i64.v4i64(<4 x i64> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 35 for instruction: %V8 = call i64 @llvm.experimental.vector.reduce.mul.i64.v8i64(<8 x i64> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 51 for instruction: %V16 = call i64 @llvm.experimental.vector.reduce.mul.i64.v16i64(<16 x i64> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'reduce_i64'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: %V1 = call i64 @llvm.experimental.vector.reduce.mul.i64.v1i64(<1 x i64> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2 = call i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4 = call i64 @llvm.experimental.vector.reduce.mul.i64.v4i64(<4 x i64> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i64 @llvm.experimental.vector.reduce.mul.i64.v8i64(<8 x i64> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V16 = call i64 @llvm.experimental.vector.reduce.mul.i64.v16i64(<16 x i64> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V1  = call i64 @llvm.experimental.vector.reduce.mul.i64.v1i64(<1 x i64> undef)
  %V2  = call i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64> undef)
  %V4  = call i64 @llvm.experimental.vector.reduce.mul.i64.v4i64(<4 x i64> undef)
  %V8  = call i64 @llvm.experimental.vector.reduce.mul.i64.v8i64(<8 x i64> undef)
  %V16 = call i64 @llvm.experimental.vector.reduce.mul.i64.v16i64(<16 x i64> undef)
  ret i32 undef
}

define i32 @reduce_i32(i32 %arg) {
; SSE2-LABEL: 'reduce_i32'
; SSE2-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 18 for instruction: %V4 = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 30 for instruction: %V8 = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 54 for instruction: %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 102 for instruction: %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSSE3-LABEL: 'reduce_i32'
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 18 for instruction: %V4 = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 30 for instruction: %V8 = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 54 for instruction: %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 102 for instruction: %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE42-LABEL: 'reduce_i32'
; SSE42-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: %V4 = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 22 for instruction: %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 38 for instruction: %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX1-LABEL: 'reduce_i32'
; AVX1-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: %V4 = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8 = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 40 for instruction: %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 56 for instruction: %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX2-LABEL: 'reduce_i32'
; AVX2-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: %V4 = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 17 for instruction: %V8 = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 21 for instruction: %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 29 for instruction: %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'reduce_i32'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4 = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 26 for instruction: %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512BW-LABEL: 'reduce_i32'
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 11 for instruction: %V2 = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4 = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 26 for instruction: %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'reduce_i32'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %V2 = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4 = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 26 for instruction: %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V2  = call i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32> undef)
  %V4  = call i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32> undef)
  %V8  = call i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32> undef)
  %V16 = call i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32> undef)
  %V32 = call i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32> undef)
  ret i32 undef
}

define i32 @reduce_i16(i32 %arg) {
; SSE2-LABEL: 'reduce_i16'
; SSE2-NEXT:  Cost Model: Found an estimated cost of 18 for instruction: %V4 = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 26 for instruction: %V8 = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 28 for instruction: %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 40 for instruction: %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSSE3-LABEL: 'reduce_i16'
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 18 for instruction: %V4 = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 20 for instruction: %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 28 for instruction: %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE42-LABEL: 'reduce_i16'
; SSE42-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: %V4 = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 20 for instruction: %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 28 for instruction: %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX1-LABEL: 'reduce_i16'
; AVX1-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: %V4 = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 72 for instruction: %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 88 for instruction: %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX2-LABEL: 'reduce_i16'
; AVX2-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: %V4 = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 36 for instruction: %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 38 for instruction: %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 42 for instruction: %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'reduce_i16'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4 = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 36 for instruction: %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 38 for instruction: %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 42 for instruction: %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512BW-LABEL: 'reduce_i16'
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4 = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 42 for instruction: %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 44 for instruction: %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'reduce_i16'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %V4 = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 36 for instruction: %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 38 for instruction: %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 42 for instruction: %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V4  = call i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16> undef)
  %V8  = call i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16> undef)
  %V16 = call i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16> undef)
  %V32 = call i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16> undef)
  %V64 = call i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16> undef)
  ret i32 undef
}

define i32 @reduce_i8(i32 %arg) {
; SSE2-LABEL: 'reduce_i8'
; SSE2-NEXT:  Cost Model: Found an estimated cost of 26 for instruction: %V8 = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 104 for instruction: %V16 = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 128 for instruction: %V32 = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 176 for instruction: %V64 = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 272 for instruction: %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
; SSE2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSSE3-LABEL: 'reduce_i8'
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 68 for instruction: %V16 = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 92 for instruction: %V32 = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 140 for instruction: %V64 = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 236 for instruction: %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
; SSSE3-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; SSE42-LABEL: 'reduce_i8'
; SSE42-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 68 for instruction: %V16 = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 92 for instruction: %V32 = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 140 for instruction: %V64 = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 236 for instruction: %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
; SSE42-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX1-LABEL: 'reduce_i8'
; AVX1-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 68 for instruction: %V16 = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 202 for instruction: %V32 = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 254 for instruction: %V64 = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 358 for instruction: %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
; AVX1-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX2-LABEL: 'reduce_i8'
; AVX2-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %V16 = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 137 for instruction: %V32 = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 171 for instruction: %V64 = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 239 for instruction: %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
; AVX2-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'reduce_i8'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 40 for instruction: %V16 = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 117 for instruction: %V32 = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 143 for instruction: %V64 = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 195 for instruction: %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512BW-LABEL: 'reduce_i8'
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 36 for instruction: %V16 = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 67 for instruction: %V32 = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 178 for instruction: %V64 = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 200 for instruction: %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
; AVX512BW-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'reduce_i8'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 14 for instruction: %V8 = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 40 for instruction: %V16 = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 117 for instruction: %V32 = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 143 for instruction: %V64 = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 195 for instruction: %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %V8   = call i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8> undef)
  %V16  = call i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8> undef)
  %V32  = call i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8> undef)
  %V64  = call i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8> undef)
  %V128 = call i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8> undef)
  ret i32 undef
}

declare i64 @llvm.experimental.vector.reduce.mul.i64.v1i64(<1 x i64>)
declare i64 @llvm.experimental.vector.reduce.mul.i64.v2i64(<2 x i64>)
declare i64 @llvm.experimental.vector.reduce.mul.i64.v4i64(<4 x i64>)
declare i64 @llvm.experimental.vector.reduce.mul.i64.v8i64(<8 x i64>)
declare i64 @llvm.experimental.vector.reduce.mul.i64.v16i64(<16 x i64>)

declare i32 @llvm.experimental.vector.reduce.mul.i32.v2i32(<2 x i32>)
declare i32 @llvm.experimental.vector.reduce.mul.i32.v4i32(<4 x i32>)
declare i32 @llvm.experimental.vector.reduce.mul.i32.v8i32(<8 x i32>)
declare i32 @llvm.experimental.vector.reduce.mul.i32.v16i32(<16 x i32>)
declare i32 @llvm.experimental.vector.reduce.mul.i32.v32i32(<32 x i32>)

declare i16 @llvm.experimental.vector.reduce.mul.i16.v4i16(<4 x i16>)
declare i16 @llvm.experimental.vector.reduce.mul.i16.v8i16(<8 x i16>)
declare i16 @llvm.experimental.vector.reduce.mul.i16.v16i16(<16 x i16>)
declare i16 @llvm.experimental.vector.reduce.mul.i16.v32i16(<32 x i16>)
declare i16 @llvm.experimental.vector.reduce.mul.i16.v64i16(<64 x i16>)

declare i8 @llvm.experimental.vector.reduce.mul.i8.v8i8(<8 x i8>)
declare i8 @llvm.experimental.vector.reduce.mul.i8.v16i8(<16 x i8>)
declare i8 @llvm.experimental.vector.reduce.mul.i8.v32i8(<32 x i8>)
declare i8 @llvm.experimental.vector.reduce.mul.i8.v64i8(<64 x i8>)
declare i8 @llvm.experimental.vector.reduce.mul.i8.v128i8(<128 x i8>)
