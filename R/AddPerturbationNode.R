## Introduces a perturbation node connecting periphery nodes without a target in 
## the prior knowledge network.
## 
## Panuwat Trairatphisan, 2020

AddPerturbationNode <- function(network) {
  
  sourceList <- sort(unique(network[,1]))
  targetList <- sort(unique(network[,3]))
  inputList <-  setdiff(sourceList,targetList)
  
  AddToNet <- data.frame(matrix(NA,length(inputList)*2,3))
  AddToNet[,1] <- "Perturbation"
  AddToNet[1:length(inputList),2] <- "1";
  AddToNet[1:length(inputList),3] <- inputList
  AddToNet[(length(inputList)+1):(length(inputList)*2),2] <- "-1";
  AddToNet[(length(inputList)+1):(length(inputList)*2),3] <- inputList
  colnames(AddToNet) <- colnames(network)
  network <- rbind(network,AddToNet)
  inputs <- data.frame("NaN"); colnames(inputs) <- "Perturbation"
  MappedPertNode <- list(inputs=inputs,network=network)
  
  return(MappedPertNode)
}
