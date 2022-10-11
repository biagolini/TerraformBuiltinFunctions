# Aqui no locals vamos aplicar as funções e veremos os resultados nos outputs
locals {
  # Função lógica
  if = 40 <= 100 ? "Verdadeiro" : "Falso"

  # Numeric functions
  numericFunctions = {
    abs      = abs(-500)         # Absoluto
    ceil     = ceil(5.17)        # Inteiro acima
    floor    = floor(4.93)       # inteiro abaixo
    log      = log(16, 2)        # log(number, base)
    max      = max(12, 54, 3)    # Maior numero
    min      = min(12, 54, 3)    # Menor numero
    parseint = parseint("a", 16) # Converte valor apresentado na string na base indicada - no exemplo, "a" em hexadecimal representa o número 10 em decimal
    pow      = pow(3, 2)         # Potência
    signum   = signum(-50)       # Sinal do número -1 = negativo 0=zero/sem sinal +1 = positivo
  }

  # String functions
  stringFunctions = {
    chomp      = chomp("hello\r\n")                                      # Remove caracteres de nova linha no final de uma string
    endswith   = endswith("hello world", "world")                        # endswith(string, suffix)
    format     = format("Hello, %s!", "Carlos")                          # Substitui "%s" pela string
    formatlist = formatlist("Hello, %s!", ["Maria", "Jose"])             # Semelhante ao format, mas em vez de uma única string é usado para um lista
    indent     = " items: ${indent(2, "[\n foo,\n bar,\n]\n")}"          # Faça identação
    join       = join(", ", ["foo", "bar", "baz"])                       # Concatena elementos de uma lista
    lower      = lower("HELLO")                                          # Coloca uma string em caracteres minúsculos
    upper      = upper("hello")                                          # Coloca uma string em caracteres maiúsculos
    regex      = regex("(\\d\\d\\d\\d)-(\\d\\d)-(\\d\\d)", "2022-03-04") # Aplica expressões regulares em uma string e retorna o padrão que houve sobreposição - regex(pattern, string)
    regexall   = regexall("[a-z]+", "1234abcd5678efgh9")                 # Aplica expressões regulares em uma string e retorna uma lista onde houve sobreposição - regex(pattern, string)
    replace    = replace("1 + 2 + 3", "+", "-")                          # Substituição
    split      = split(",", "foo,bar,baz")                               # Separa uma string em elementos de uma lista dado um caractere definido
    startswith = startswith("hello world", "hello")                      # Teste lógico se um string inicia com uma dada sequencia de caractere
    strrev     = strrev("hello")                                         # Inverte a sequência de caracteres de uma string
    substr     = substr("hello world", 1, 4)                             # Extrai uma substring de um dado range
    title      = title("hello world")                                    # Converte a primeira letra de cada palavra em maiúscula
    trim       = trim("abcdeabcdeabc abcdeabcdeabc", "abc")              # Remove uma sequência de caracteres (se presentes) do inicio e fim de uma string 
    trimprefix = trimprefix("helloworld", "hello")                       # Remove uma sequência de caracteres do início de uma string, se a string não tiver esse início de caracter será retornado a mesma string sem modificações
    trimsuffix = trimsuffix("helloworld", "world")                       # Remove uma sequência de caracteres do sufixo (final) de uma string, se a string não tiver esse início de caracter será retornado a mesma string sem modificações
    trimspace  = trimspace(" hello\n\n")                                 # Remove espaço no início e final de uma string 
  }

  # Collection Functions
  collectionFunctions = {
    alltrue      = alltrue([true, false])                                  # Testa se todos os elementos são verdadeiros
    anytrue      = anytrue([true, false])                                  # Testa se ao menos um elemento é verdadeiro
    chunklist    = chunklist(["a", "b", "c", "d", "e"], 2)                 # Separa uma lista em sub-listas de um dado tamanho
    coalesce     = coalesce("a", "b")                                      # Retorna o primeiro não nulo
    coalescelist = coalescelist(["a", "b"], ["c", "d"])                    # Retorna o primeiro elemento não nulo de uma lista
    compact      = compact(["a", "", "b", "c"])                            # Dado uma lista, retorna essa lista excluindo-se elementos vazios
    concat       = concat(["a", ""], ["b", "c"])                           # Toma duas ou mais listas e combinas em uma única lista
    contains     = contains(["a", "b", "c"], "a")                          # Determina se um dado elemento está contido numa lista
    distinct     = distinct(["a", "b", "a", "c", "d", "b"])                # Retorna os elementos únicos numa lista
    element      = element(["a", "b", "c"], 1)                             # Retorna o elemento de uma dada opção
    flatten      = flatten([["a", "b"], ["c"], ["d"]])                     # Dado uma lista e coloca tudo numa única lista
    index        = index(["a", "b", "c", "b"], "b")                        # Retorna o índice do primeiro elemento que aparece numa lista
    keys         = keys({ a = 1, c = 2, d = 3 })                           # Pega um mapa e retorna uma lista com suas respectivas chaves
    length       = length(["a", "b"])                                      # Retorna tamanho de uma lista, mapa ou string
    tolist       = tolist(["a", "b", "c"])                                 # Construí uma tupla com valores de uma lista
    lookup       = lookup({ a = "abc", b = "def" }, "d", "Não encontrado") # Busca o elemento identificado por uma chave em um mapa, se encontrado retorna o valor do elemento, se não, retornar o valor especificado - OBS: loockup é uma palavra reservada, por isso não pode ser usada para nome de local
    tomap = tomap({                                                        # Converte entrada para um mapa - OBS: loockup é uma palavra reservada, por isso não pode ser usada para nome de local
      a = "b"
      c = "d"
    })
    matchkeys       = matchkeys(["A", "B", "C"], ["0", "1", "2"], ["1", "2", "3"]) # Dada a expressão matchkeys(X, Y, Z), pega os valores de Z e busca quais deles aparecem em Y. Pega as posições destes em Y e avalia quais valores de X estão nessas posições. Retorna para o usuário final os valores de X das devidas posições selecionadas.
    merge           = merge({ a = "b", c = "d" }, { e = "f", c = "z" })            # Pega n mapas e mescla tudo em um único mapa
    one             = one(["hello"])                                               # Recebe um valor de uma lista, conjunto ou tupla com valor zero ou 1 elemento. Se o elemento está vazio retorna null, se tiver elemento, retorna o valor do elemento. Se tiver dois elementos ou mais, vai retornar um erro
    range           = range(1, 8, 2)                                               # Retorna um range, dado um valor de início, fim e salto
    reverse         = reverse([1, 2, 3])                                           # Retorna a lista com ordem reversa
    setintersection = setintersection(["a", "b"], ["b", "c"], ["b", "d"])          # Retorna apenas os elementos comuns em todos os sets
    setproduct      = setproduct(["app1", "app2"], ["a", "b"])                     # Acha todas as cominações possíveis entre diferentes elementos de listas
    setsubtract     = setsubtract(["a", "b", "c"], ["a", "c"])                     # Encontra a diferença entre dois sets
    setunion        = setunion(["a", "b"], ["b", "c"], ["d"])                      # Encontra a união entre os sets
    slice           = slice(["a", "b", "c", "d"], 1, 3)                            # Extrai dados elementos de uma lista
    sort            = sort(["e", "d", "a", "x"])                                   # Ordena a lista em ordem lexicografica
    sum             = sum([10, 13, 6, 4.5])
    transpose       = transpose({ "a" = ["1", "2"], "b" = ["2", "3"] }) # Aplica uma lógica que inverte os sets. Ao usar o transpose você cria um novo mapa onde será discriminado em qual conjunto cada elemento estava presente
    values          = values({ a = 3, c = 2, d = 1 })                   # Retorna quais são os valores contidos dentro de um mapa
    zipmap          = zipmap(["a", "b"], [1, 2])                        # Construí um mapa dado uma lista de chaves
  }

  # Encoding Functions
  encodingFunctions = {
    base64decode     = base64decode("SGVsbG8gV29ybGQ=")                                 # Decodificar uma string base64
    base64encode     = base64encode("Hello World")                                      # Codifica uma string em base64
    base64gzip       = base64gzip("Hello World")                                        # Comprime uma string com gzip, e depois codifica em base64
    csvdecode        = csvdecode("a,b,c\n1,2,3\n4,5,6")                                 # Decodifica uma string CSV-formatted e produz uma lista de mapas que representa esse mapa
    jsondecode       = jsondecode("{\"hello\": \"world\"}")                             # Interpreta um JSON e retorna a representação do resultado da decodificação
    jsonencode       = jsonencode({ "hello" = "world" })                                # Codifica um dado valor para uma dada string usando JSON syntax.
    textdecodebase64 = textdecodebase64("SABlAGwAbABvACAAVwBvAHIAbABkAA==", "UTF-16LE") # Decodifica uma string usando um determinado código alfabético 
    textencodebase64 = textencodebase64("Hello World", "UTF-16LE")                      # Codifica uma string usando um determinado código alfabético 
    urlencode        = urlencode("Hello World!")                                        # Aplica codificação URL em uma string
    yamldecode       = yamldecode("hello: world")                                       # Converte entrada do padrão YAML para o padrão que o Terraform consegue interpretar
    yamlencode       = yamlencode({ "a" : "b", "c" : "d" })                             # Codifica uma string em um bloco YAML 1.2
  }

  # Filesystem Functions
  filesystemFunctions = {
    abspath    = abspath(path.root)                              # Retorna o path do seu SO para onde está rodando seu projeto
    dirname    = dirname("foo/bar/baz.txt")                      # Dado um path de arquivo de sistema, remove a porção final do path e retorna a string remanescente
    pathexpand = pathexpand("~/.ssh/id_rsa")                     # Pega um path que começa com ~, e substitui o simbolo pelo path que representa o diretório home do usuário local 
    basename   = basename("foo/bar/baz.txt")                     # Pega um path de um arquivo, e remove todo o caminho de diretorios e deixa só o nome do arquivo e sua extensão 
    file       = file("${path.module}/arquivos/teste.txt")       # Apresenta o conteúdo de um determinado arquivo
    fileexists = fileexists("${path.module}/arquivos/teste.txt") # Testa se um determinado arquivo existe
    fileset    = fileset(path.module, "arquivos/*.txt")          # Lista de arquivos com uma dada especificação 
    filebase64 = filebase64("${path.module}/arquivos/teste.txt") # Retorna a conversão em base64 do conteúdo de um arquivo
    templatefile = templatefile(
      "${path.module}/arquivos/template.tftpl",
    { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] }) # Pega um template e injeta dados neste template 
  }

  # Date and Time Functions
  datetimeFunctions = {
    formatdate = formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z") # Converte um timestamp em um diferente formato.
    timeadd    = timeadd("2017-11-22T00:00:00Z", "10m")                      # Adiciona um tempo extra em um timestamp
    timecmp    = timecmp("2017-11-22T01:00:00Z", "2017-11-22T00:00:00Z")     # Compara dois timestamp, timecmp(timestamp_a, timestamp_b) e retorna um valor de -1,0 ou 1, sendo que cada um representa respectivamente -1 = primeiro timstap é de uma data mais ao passado; 0 = os timestamps são iguais ; 1 = primeiro timstap é de uma data mais ao futuro;
    timestamp  = timestamp()                                                 # Retorna um timestap do momento em que a função for executado
  }

  # IP Network Functions
  hashAndCryptoFunctions = {
    base64sha256     = base64sha256("hello world")                           # Calcula o SHA256 de uma string e faz encode do SHA em Base64
    base64sha512     = base64sha512("hello world")                           # Calcula o SHA512 de uma string e faz encode do SHA em Base64
    bcrypt           = bcrypt("hello world")                                 # Calcula e apresenta o Hash usando Blowfish cipher
    base64sha256     = base64sha256("${path.module}/arquivos/teste.txt")     # Função usada para calcular o SHA256 do conteúdo de um arquivo
    base64sha512     = base64sha512("${path.module}/arquivos/teste.txt")     # Função usada para calcular o SHA512 do conteúdo de um arquivo
    filebase64sha256 = filebase64sha256("${path.module}/arquivos/teste.txt") # Variação do base64sha256 arquivo
    filebase64sha512 = filebase64sha512("${path.module}/arquivos/teste.txt") # Variação do base64sha512 arquivo
    filemd5          = filemd5("${path.module}/arquivos/teste.txt")          # Função usada para calcular o md5 do conteúdo de um arquivo
    filesha1         = filesha1("${path.module}/arquivos/teste.txt")         # Função usada para calcular o SHA1 do conteúdo de um arquivo
    filesha256       = filesha256("${path.module}/arquivos/teste.txt")       # Função usada para calcular o SHA256
    filesha512       = filesha512("${path.module}/arquivos/teste.txt")       # Função usada para calcular o SHA512 
    sha1             = sha1("hello world")                                   # Cálculo de Sha1 de uma dada string
    sha256           = sha256("hello world")                                 # Cálculo de Sha256 de uma dada string
    sha512           = sha512("hello world")                                 # Cálculo de Sha512 de uma dada string
    uuid             = uuid()                                                # Gera um identificador único
    uuidv5           = uuidv5("dns", "www.terraform.io")                     # Gera um identificador único baseado em RFC 4122 section 4.3
    rsadecrypt = rsadecrypt(
      file("${path.module}/arquivos/rsaTextoCifrado.txt"),
      file("${path.module}/arquivos/rsaPrivateKey.pem")
    ) # Descriptografa um texto cifrado criptografado por RSA, retornando o texto não criptografado correspondente. Para esse teste usei a ferramenta online para gerar os arquivos: https://travistidwell.com/jsencrypt/demo/
  }

  # IP Network Functions
  networkFunctions = {
    cidrhost    = cidrhost("10.12.112.0/20", 10)    # Dado um endereço de rede/mascara, calcula o n-esimo endereço IP de host completo dessa rede 
    cidrnetmask = cidrnetmask("172.16.0.0/24")      # Converte notação CIDR em um endereço de máscara de sub-rede.
    cidrsubnet  = cidrsubnet("10.1.2.3/8", 16, 300) # Pega um endereço de IP com CIDR, adicionar novos bits na máscara. Em seguida, pega um valor inserido por você e adiciona esse valor no lugar nos bits novos adicionados. Para facilitar a vizualização use o site https://cidr.xyz/
    # cidrsubnet(prefix, newbits, netnum)
    # prefix = endereço de rede antigo
    # newbits = quantos novos bits você quer adicionar, ex. prefix =/8 & newbits=16 = /24
    # netnum = inteiro binário usado para preencher os bits adicionais adicionados ao prefixo. Se antes era 255.0.0.0 (/8), e agora é 255.255.255.0 (/24), vai pegar o netnum ex.300 e inserir todos esses bits nos novos bits adicionado como no lugar do X apresentado no endereço: 255.XXX.XXX.0 
    cidrsubnets = cidrsubnets("10.1.0.0/8", 8, 6, 2, 2) # Calcula uma sequência de intervalos de endereços IP consecutivos em um prefixo CIDR específico.
  }

  # Type Conversion Functions
  conversionFunctions = {
    can               = can({ "key" = "value" }.key)                  # Avalia a expressão fornecida e retorna um valor booleano indicando se a expressão produziu um resultado sem erros. Nesse exemplo, você está passando um mapa, e está tentando acessar uma chave. Se essa chave existir vai retornar o valor correspondente. Logo, se existir então o resultado do can será o bolleano de verdadeiro.
    sensitive_content = nonsensitive(sensitive("Conteudo sensivel!")) # Se um conteúdo é marcado como sensitive(), o terraform protegerá o dado mudando o comportamento de acesso ao dado - ex. não pode ser impresso no output. O nonsensitive() pode ser usado para quebrar o sensitive e permitir acesso em determinas circunstâncias.
    tobool            = tobool("true")
    tolist            = tolist(["a", "b", "c"])                            # Converte seu argumento em uma lista.
    tomap             = tomap({ "a" = 1, "b" = 2 })                        # Converte seu argumento em um mapa.
    tonumber          = tonumber("1")                                      # Converte seu argumento em um número.
    toset             = toset(["a", "b", "c"])                             # Converte seu argumento em um conjunto.
    tostring          = tostring(null)                                     # Converte seu argumento em uma string.
    try               = try({ "key1" = "value1", "key2" = "value2" }.key2) # Avalia a expressão fornecida e retorna o resultado da primeira que não produz nenhum erro.
    /*
 TYPE é uma função especial disponível apenas no terraform console, para acessar o console use os comandos no bash:
 terraform console
 type("hello")
 type(local.conversionFunctions)
 exit
 */
  }
}
