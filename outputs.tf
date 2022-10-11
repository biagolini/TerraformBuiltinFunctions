// Veja todas funções em: https://www.terraform.io/language/functions
output "numericFunctions_out2" {
  value = local.numericFunctions.* 
}

/* OBS: Método alternativo para apresentar os resultados no console
output "numericFunctions_out1" {
  value = " abs=${local.numericFunctions.abs}\n ceil=${local.numericFunctions.ceil}\n floor=${local.numericFunctions.floor}\n  log=${local.numericFunctions.log}  \n max=${local.numericFunctions.max}\n min=${local.numericFunctions.min}\n parseint=${local.numericFunctions.parseint}"
}
*/

output "if" {
  value = local.if 
}

output "stringFunctions" {
  value = local.stringFunctions.* 
}

output "collectionFunctions" {
  value = local.collectionFunctions.*
}

output "encodingFunctions" {
  value = local.encodingFunctions.*
}

output "filesystemFunctions" {
  value = local.filesystemFunctions.* 
}

output "datetimeFunctions" {
  value = local.datetimeFunctions.*
}

output "hashAndCryptoFunctions" {
  value = local.hashAndCryptoFunctions.*
}

output "networkFunctions" {
  value = local.networkFunctions.*
}

output "conversionFunctions" {
  value = local.conversionFunctions.*
}