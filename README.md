<p align="center"><img src="https://svgshare.com/i/7Qc.svg" height="128px" width="128px" /></p>
<h3 align="center">The Iron Programming Language</h3>

<p align="center">
  <a href="https://travis-ci.org/ironlang/iron" target="_blank">
    <img src="https://travis-ci.org/ironlang/iron.svg?branch=master" alt="Build Status" />
  </a>
</p>

> Iron is a programming language that draws inspiration from [Rust](https://www.rust-lang.org/en-US/), [Swift](https://swift.org), and [TypeScript](https://www.typescriptlang.org). It is a personal project that aims to help developers build scalable systems in a safe, expressive manner.

### Design Philosophies

* Iron syntax should be expressive and easily approachable.
* The language should embrace and encourage functional programming paradigms.
* Documentation and testing should be first-class features.

### Getting Started

You should be able to clone this repository and run the project with `cargo`. You will need Rust and LLVM installed and available on your `PATH`.

### Example

Below is a pretty quick overview of the Iron language syntax. For more examples, check the `test` directory.

``` iron
// Importing some standard modules.
import { io } from "@iron/standard";

/// # Documentation Comments
/// Documentation comments are comments that use Markdown to provide advanced
/// formatting features. With a single command, you can generate beautiful
/// documentation that uses these comments.
///
/// NOTE: You don't have to include param/return types; those are included.
///
/// # Examples
///
/// ```
/// let hello_world: String = greeting("world"); // Returns `Hello world!`
/// ```
function greeting(name: String) -> String {
  return "Hello ${ name }!";
}

function main {
  io.print_line("Functions without parameters don't require parentheses.");
  io.print_line("All functions, however, require the `function` keyword.");

  // Retrieve the user's name.
  let name: String = io.prompt("What is your name?");
  io.print_line(greeting(name));
}
```

### Contributing

While this is currently more of a personal learning project, I welcome feedback and improvements through Issues and Pull Requests, respectively. All development is done on the `dev` branch; `master` reflects the latest stable release.
