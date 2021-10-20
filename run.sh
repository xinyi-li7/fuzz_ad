#!/bin/bash
#CC=/home/xinyi/llvm/llvm10/bin/clang
CXX=/home/xinyi/llvm/llvm10/bin/clang++
OPT=/home/xinyi/llvm/llvm10/bin/opt
export enzymePath=/home/xinyi/Enzyme/

${CXX} first.cpp -S -emit-llvm -o IR.ll -O2 -fno-vectorize -fno-slp-vectorize -fno-unroll-loops
${OPT} IR.ll -load=${enzymePath}enzyme/build/Enzyme/LLVMEnzyme-10.so -enzyme -o output.ll -S
${CXX} output.ll -o a.exe
./a.exe