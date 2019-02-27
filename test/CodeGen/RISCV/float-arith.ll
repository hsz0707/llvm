; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+f -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32IF %s
; RUN: llc -mtriple=riscv64 -mattr=+f -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV64IF %s

; These tests are each targeted at a particular RISC-V FPU instruction. Most
; other files in this folder exercise LLVM IR instructions that don't directly
; match a RISC-V instruction.

define float @fadd_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fadd_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fadd.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fadd_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fadd.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = fadd float %a, %b
  ret float %1
}

define float @fsub_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fsub_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fsub.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fsub_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fsub.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = fsub float %a, %b
  ret float %1
}

define float @fmul_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fmul_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fmul.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fmul_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fmul.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = fmul float %a, %b
  ret float %1
}

define float @fdiv_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fdiv_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fdiv.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fdiv_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fdiv.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = fdiv float %a, %b
  ret float %1
}

declare float @llvm.sqrt.f32(float)

define float @fsqrt_s(float %a) nounwind {
; RV32IF-LABEL: fsqrt_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a0
; RV32IF-NEXT:    fsqrt.s ft0, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fsqrt_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a0
; RV64IF-NEXT:    fsqrt.s ft0, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = call float @llvm.sqrt.f32(float %a)
  ret float %1
}

declare float @llvm.copysign.f32(float, float)

define float @fsgnj_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fsgnj_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fsgnj.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fsgnj_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fsgnj.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = call float @llvm.copysign.f32(float %a, float %b)
  ret float %1
}

; This function performs extra work to ensure that
; DAGCombiner::visitBITCAST doesn't replace the fneg with an xor.
define i32 @fneg_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fneg_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a0
; RV32IF-NEXT:    fadd.s ft0, ft0, ft0
; RV32IF-NEXT:    fneg.s ft1, ft0
; RV32IF-NEXT:    feq.s a0, ft0, ft1
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fneg_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a0
; RV64IF-NEXT:    fadd.s ft0, ft0, ft0
; RV64IF-NEXT:    fneg.s ft1, ft0
; RV64IF-NEXT:    feq.s a0, ft0, ft1
; RV64IF-NEXT:    ret
  %1 = fadd float %a, %a
  %2 = fneg float %1
  %3 = fcmp oeq float %1, %2
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; This function performs extra work to ensure that
; DAGCombiner::visitBITCAST doesn't replace the fneg with an xor.
define float @fsgnjn_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fsgnjn_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fadd.s ft0, ft1, ft0
; RV32IF-NEXT:    fsgnjn.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fsgnjn_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fadd.s ft0, ft1, ft0
; RV64IF-NEXT:    fsgnjn.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = fadd float %a, %b
  %2 = fneg float %1
  %3 = call float @llvm.copysign.f32(float %a, float %2)
  ret float %3
}

declare float @llvm.fabs.f32(float)

; This function performs extra work to ensure that
; DAGCombiner::visitBITCAST doesn't replace the fabs with an and.
define float @fabs_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fabs_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fadd.s ft0, ft1, ft0
; RV32IF-NEXT:    fabs.s ft1, ft0
; RV32IF-NEXT:    fadd.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fabs_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fadd.s ft0, ft1, ft0
; RV64IF-NEXT:    fabs.s ft1, ft0
; RV64IF-NEXT:    fadd.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = fadd float %a, %b
  %2 = call float @llvm.fabs.f32(float %1)
  %3 = fadd float %2, %1
  ret float %3
}

declare float @llvm.minnum.f32(float, float)

define float @fmin_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fmin_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fmin.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fmin_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fmin.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = call float @llvm.minnum.f32(float %a, float %b)
  ret float %1
}

declare float @llvm.maxnum.f32(float, float)

define float @fmax_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fmax_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fmax.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fmax_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fmax.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = call float @llvm.maxnum.f32(float %a, float %b)
  ret float %1
}

define i32 @feq_s(float %a, float %b) nounwind {
; RV32IF-LABEL: feq_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    feq.s a0, ft1, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: feq_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    feq.s a0, ft1, ft0
; RV64IF-NEXT:    ret
  %1 = fcmp oeq float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @flt_s(float %a, float %b) nounwind {
; RV32IF-LABEL: flt_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    flt.s a0, ft1, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: flt_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    flt.s a0, ft1, ft0
; RV64IF-NEXT:    ret
  %1 = fcmp olt float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

define i32 @fle_s(float %a, float %b) nounwind {
; RV32IF-LABEL: fle_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fle.s a0, ft1, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fle_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fle.s a0, ft1, ft0
; RV64IF-NEXT:    ret
  %1 = fcmp ole float %a, %b
  %2 = zext i1 %1 to i32
  ret i32 %2
}

declare float @llvm.fma.f32(float, float, float)

define float @fmadd_s(float %a, float %b, float %c) nounwind {
; RV32IF-LABEL: fmadd_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a2
; RV32IF-NEXT:    fmv.w.x ft1, a1
; RV32IF-NEXT:    fmv.w.x ft2, a0
; RV32IF-NEXT:    fmadd.s ft0, ft2, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fmadd_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a2
; RV64IF-NEXT:    fmv.w.x ft1, a1
; RV64IF-NEXT:    fmv.w.x ft2, a0
; RV64IF-NEXT:    fmadd.s ft0, ft2, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = call float @llvm.fma.f32(float %a, float %b, float %c)
  ret float %1
}

define float @fmsub_s(float %a, float %b, float %c) nounwind {
; RV32IF-LABEL: fmsub_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a2
; RV32IF-NEXT:    lui a2, %hi(.LCPI15_0)
; RV32IF-NEXT:    addi a2, a2, %lo(.LCPI15_0)
; RV32IF-NEXT:    flw ft1, 0(a2)
; RV32IF-NEXT:    fadd.s ft0, ft0, ft1
; RV32IF-NEXT:    fmv.w.x ft1, a1
; RV32IF-NEXT:    fmv.w.x ft2, a0
; RV32IF-NEXT:    fmsub.s ft0, ft2, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fmsub_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a2
; RV64IF-NEXT:    lui a2, %hi(.LCPI15_0)
; RV64IF-NEXT:    addi a2, a2, %lo(.LCPI15_0)
; RV64IF-NEXT:    flw ft1, 0(a2)
; RV64IF-NEXT:    fadd.s ft0, ft0, ft1
; RV64IF-NEXT:    fmv.w.x ft1, a1
; RV64IF-NEXT:    fmv.w.x ft2, a0
; RV64IF-NEXT:    fmsub.s ft0, ft2, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %c_ = fadd float 0.0, %c ; avoid negation using xor
  %negc = fsub float -0.0, %c_
  %1 = call float @llvm.fma.f32(float %a, float %b, float %negc)
  ret float %1
}

define float @fnmadd_s(float %a, float %b, float %c) nounwind {
; RV32IF-LABEL: fnmadd_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a2
; RV32IF-NEXT:    lui a2, %hi(.LCPI16_0)
; RV32IF-NEXT:    addi a2, a2, %lo(.LCPI16_0)
; RV32IF-NEXT:    flw ft1, 0(a2)
; RV32IF-NEXT:    fadd.s ft0, ft0, ft1
; RV32IF-NEXT:    fmv.w.x ft2, a0
; RV32IF-NEXT:    fadd.s ft1, ft2, ft1
; RV32IF-NEXT:    fmv.w.x ft2, a1
; RV32IF-NEXT:    fnmadd.s ft0, ft1, ft2, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fnmadd_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a2
; RV64IF-NEXT:    lui a2, %hi(.LCPI16_0)
; RV64IF-NEXT:    addi a2, a2, %lo(.LCPI16_0)
; RV64IF-NEXT:    flw ft1, 0(a2)
; RV64IF-NEXT:    fadd.s ft0, ft0, ft1
; RV64IF-NEXT:    fmv.w.x ft2, a0
; RV64IF-NEXT:    fadd.s ft1, ft2, ft1
; RV64IF-NEXT:    fmv.w.x ft2, a1
; RV64IF-NEXT:    fnmadd.s ft0, ft1, ft2, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %a_ = fadd float 0.0, %a
  %c_ = fadd float 0.0, %c
  %nega = fsub float -0.0, %a_
  %negc = fsub float -0.0, %c_
  %1 = call float @llvm.fma.f32(float %nega, float %b, float %negc)
  ret float %1
}

define float @fnmsub_s(float %a, float %b, float %c) nounwind {
; RV32IF-LABEL: fnmsub_s:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    fmv.w.x ft0, a0
; RV32IF-NEXT:    lui a0, %hi(.LCPI17_0)
; RV32IF-NEXT:    addi a0, a0, %lo(.LCPI17_0)
; RV32IF-NEXT:    flw ft1, 0(a0)
; RV32IF-NEXT:    fadd.s ft0, ft0, ft1
; RV32IF-NEXT:    fmv.w.x ft1, a2
; RV32IF-NEXT:    fmv.w.x ft2, a1
; RV32IF-NEXT:    fnmsub.s ft0, ft0, ft2, ft1
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64IF-LABEL: fnmsub_s:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a0
; RV64IF-NEXT:    lui a0, %hi(.LCPI17_0)
; RV64IF-NEXT:    addi a0, a0, %lo(.LCPI17_0)
; RV64IF-NEXT:    flw ft1, 0(a0)
; RV64IF-NEXT:    fadd.s ft0, ft0, ft1
; RV64IF-NEXT:    fmv.w.x ft1, a2
; RV64IF-NEXT:    fmv.w.x ft2, a1
; RV64IF-NEXT:    fnmsub.s ft0, ft0, ft2, ft1
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %a_ = fadd float 0.0, %a
  %nega = fsub float -0.0, %a_
  %1 = call float @llvm.fma.f32(float %nega, float %b, float %c)
  ret float %1
}
