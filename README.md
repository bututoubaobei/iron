<p align="center"><img src="./assets/fe.svg" height="128px" width="128px" /></p>
<h1 align="center">The Iron Programming Language</h1>

<p align="center">
  <a href="https://travis-ci.org/ironlang/iron" target="_blank">
    <img src="https://travis-ci.org/ironlang/iron.svg?branch=master" alt="Build Status" />
  </a>
</p>

> Iron is a programming language built with an emphasis on speed, safety, and usability. It is a personal project that is not production-ready by any means.

## Design

### Grammar
### Lexer
### Parser

### Code Generation

I was initially planning to use LLVM for native code generation but I have since made the decision to use [Cranelift](https://github.com/CraneStation/cranelift). The two projects are similar at a high level, but the Cranelift authors elaborate on their technical differences [here](https://cranelift.readthedocs.io/en/latest/compare-llvm.html).

From a developer perspective, I did this largely to adhere to Rust project conventions — all you need to build and run this project is Cargo. Cranelift also has a much smaller overhead in general.

## Contributing

You should be able to clone this repository and run the project with `cargo`. You will need Rust and LLVM installed and available on your `PATH`. Code changes are welcome in the form of pull requests.
