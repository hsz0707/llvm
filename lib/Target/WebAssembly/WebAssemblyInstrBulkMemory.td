// WebAssemblyInstrBulkMemory.td - bulk memory codegen support --*- tablegen -*-
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// WebAssembly bulk memory codegen constructs.
///
//===----------------------------------------------------------------------===//

// Instruction requiring HasBulkMemory and the bulk memory prefix byte
multiclass BULK_I<dag oops_r, dag iops_r, dag oops_s, dag iops_s,
                  list<dag> pattern_r, string asmstr_r = "",
                  string asmstr_s = "", bits<32> simdop = -1> {
  defm "" : I<oops_r, iops_r, oops_s, iops_s, pattern_r, asmstr_r, asmstr_s,
              !or(0xfc00, !and(0xff, simdop))>,
            Requires<[HasBulkMemory]>;
}

// Bespoke types and nodes for bulk memory ops
def wasm_memcpy_t : SDTypeProfile<0, 5,
  [SDTCisInt<0>, SDTCisInt<1>, SDTCisPtrTy<2>, SDTCisPtrTy<3>, SDTCisInt<4>]
>;
def wasm_memcpy : SDNode<"WebAssemblyISD::MEMORY_COPY", wasm_memcpy_t,
                         [SDNPHasChain, SDNPMayLoad, SDNPMayStore]>;

//===----------------------------------------------------------------------===//
// memory.init
//===----------------------------------------------------------------------===//

let mayStore = 1 in
defm MEMORY_INIT :
  BULK_I<(outs),
         (ins i32imm_op:$seg, i32imm_op:$idx, I32:$dest,
              I32:$offset, I32:$size),
         (outs), (ins i32imm_op:$seg, i32imm_op:$idx),
         [(int_wasm_memory_init (i32 imm:$seg), (i32 imm:$idx), I32:$dest,
            I32:$offset, I32:$size
          )],
         "memory.init\t$seg, $idx, $dest, $offset, $size",
         "memory.init\t$seg, $idx", 0x08>;

//===----------------------------------------------------------------------===//
// data.drop
//===----------------------------------------------------------------------===//

defm DATA_DROP :
  BULK_I<(outs), (ins i32imm_op:$seg), (outs), (ins i32imm_op:$seg),
         [(int_wasm_data_drop (i32 imm:$seg))],
         "data.drop\t$seg", "data.drop\t$seg", 0x09>;

//===----------------------------------------------------------------------===//
// memory.copy
//===----------------------------------------------------------------------===//

let mayLoad = 1, mayStore = 1 in
defm MEMORY_COPY :
  BULK_I<(outs), (ins i32imm_op:$src_idx, i32imm_op:$dst_idx,
                      I32:$dst, I32:$src, I32:$len),
         (outs), (ins i32imm_op:$src_idx, i32imm_op:$dst_idx),
         [(wasm_memcpy (i32 imm:$src_idx), (i32 imm:$dst_idx),
           I32:$dst, I32:$src, I32:$len
         )],
         "memory.copy\t$src_idx, $dst_idx, $dst, $src, $len",
         "memory.copy\t$src_idx, $dst_idx", 0x0a>;
