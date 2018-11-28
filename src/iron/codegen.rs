extern crate cranelift_codegen;
extern crate cranelift_frontend;

use std::fs::File;
use std::io::prelude::*;

#[allow(unused_imports)] use self::cranelift_codegen::entity::EntityRef;
#[allow(unused_imports)] use self::cranelift_codegen::ir::types::*;
#[allow(unused_imports)] use self::cranelift_codegen::ir::{AbiParam, ExternalName, Function, InstBuilder, Signature};
#[allow(unused_imports)] use self::cranelift_codegen::isa::CallConv;
#[allow(unused_imports)] use self::cranelift_codegen::settings;
#[allow(unused_imports)] use self::cranelift_codegen::verifier::verify_function;
#[allow(unused_imports)] use self::cranelift_frontend::{FunctionBuilder, FunctionBuilderContext, Variable};

#[allow(dead_code)]
pub fn hello() {
  let mut sig = Signature::new(CallConv::SystemV);
    sig.returns.push(AbiParam::new(I32));
    sig.params.push(AbiParam::new(I32));
    let mut fn_builder_ctx = FunctionBuilderContext::new();
    let mut func = Function::with_name_signature(ExternalName::user(0, 0), sig);
    {
        let mut builder = FunctionBuilder::new(&mut func, &mut fn_builder_ctx);

        let block0 = builder.create_ebb();
        let block1 = builder.create_ebb();
        let block2 = builder.create_ebb();
        let x = Variable::new(0);
        let y = Variable::new(1);
        let z = Variable::new(2);
        builder.declare_var(x, I32);
        builder.declare_var(y, I32);
        builder.declare_var(z, I32);
        builder.append_ebb_params_for_function_params(block0);

        builder.switch_to_block(block0);
        builder.seal_block(block0);
        {
            let tmp = builder.ebb_params(block0)[0]; // the first function parameter
            builder.def_var(x, tmp);
        }
        {
            let tmp = builder.ins().iconst(I32, 2);
            builder.def_var(y, tmp);
        }
        {
            let arg1 = builder.use_var(x);
            let arg2 = builder.use_var(y);
            let tmp = builder.ins().iadd(arg1, arg2);
            builder.def_var(z, tmp);
        }
        builder.ins().jump(block1, &[]);

        builder.switch_to_block(block1);
        {
            let arg1 = builder.use_var(y);
            let arg2 = builder.use_var(z);
            let tmp = builder.ins().iadd(arg1, arg2);
            builder.def_var(z, tmp);
        }
        {
            let arg = builder.use_var(y);
            builder.ins().brnz(arg, block2, &[]);
        }
        {
            let arg1 = builder.use_var(z);
            let arg2 = builder.use_var(x);
            let tmp = builder.ins().isub(arg1, arg2);
            builder.def_var(z, tmp);
        }
        {
            let arg = builder.use_var(y);
            builder.ins().return_(&[arg]);
        }

        builder.switch_to_block(block2);
        builder.seal_block(block2);

        {
            let arg1 = builder.use_var(y);
            let arg2 = builder.use_var(x);
            let tmp = builder.ins().isub(arg1, arg2);
            builder.def_var(y, tmp);
        }
        builder.ins().jump(block1, &[]);
        builder.seal_block(block1);

        builder.finalize();
    }

    let flags = settings::Flags::new(settings::builder());
    let res = verify_function(&func, &flags);
    println!("{}", func.display(None));
    if let Err(errors) = res {
        panic!("{}", errors);
    }
}