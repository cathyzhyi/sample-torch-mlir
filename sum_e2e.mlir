DEBUG: Initial PyTorch object graph IR:
builtin.module  {
  builtin.func private @__torch__.TestModule.forward(%arg0: !torch.nn.Module<"__torch__.TestModule">, %arg1: !torch.tensor {torch.type_bound = !torch.vtensor<[2,3,?],f32>}) -> !torch.tensor {
    %none_0 = torch.constant.none
    %1 = torch.aten.sum %arg1, %none_0 : !torch.tensor, !torch.none -> !torch.tensor
    return %1 : !torch.tensor
  }
  torch.class_type @__torch__.TestModule  {
    torch.attr private "training" : !torch.bool
    torch.attr private "_is_full_backward_hook" : !torch.optional<!torch.bool>
    torch.method "forward", @__torch__.TestModule.forward
  }
  %true = torch.constant.bool true
  %none = torch.constant.none
  %0 = torch.nn_module  {
    torch.slot "training", %true : !torch.bool
    torch.slot "_is_full_backward_hook", %none : !torch.none
  } : !torch.nn.Module<"__torch__.TestModule">
}

DEBUG: Running Torch object graph lowering pipeline 'torchscript-to-npcomp-backend-pipeline'
error: unsupported by backend lowering: `torch.operator` op
note: see current operation: %2 = "torch.operator"(%1, %0) {name = "aten.sum"} : (!torch.tensor<[2,3,?],f32>, !torch.none) -> !torch.tensor
note: this is likely due to a missing op that needs to be generated by torch_ods_gen.py
Traceback (most recent call last):
  File "frontends/pytorch/examples/torchscript_sum_e2e_iree.py", line 44, in <module>
    compiled = backend.compile(frontend_lowering.lower_object_graph(mb.module))
  File "/home/dan/mlir-npcomp/build/python_packages/npcomp_core/npcomp/compiler/pytorch/backend/frontend_lowering.py", line 59, in lower_object_graph
    pm.run(imported_module)
RuntimeError: Failure while executing pass pipeline.
