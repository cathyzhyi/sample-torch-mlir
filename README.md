# Torch to execution status
Op | python func | lowering status
------------- | ------------- | -------------
tanh | torch.tanh | complete
relu | torch.relu | complete
sigmoid | torch.sigmoid | complete
mul | torch.mul | complete
add | torch.add | complete
sum | torch.sum | complete
argmax | torch.argmax | in-progress
concat | torch.cat | complete
transpose | torch.transpose | complete
argmin | torch.argmin | torch_ods_gen
gather | torch.gather | complete
layernorm | torch.layernorm | in-progress
broadcast | torch.broadcast_to | torch_ods_gen
