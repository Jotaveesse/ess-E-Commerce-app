Scenario: Usuário, já logado no sistema, deseja mudar sua senha
    Given Eu estou na página de "Informações do Cliente"
    And Eu estou logado com o email "gmm7@cin.ufpe.br" e senha  "123456Gui"
    When Eu clico na opção "Alterar Senha"
    And Escrevo "123456Gui" em "Senha Atual"
    And Escrevo "98765Gui" em "Nova Senha"
    And Escrevo "98765Gui" em "Confirmar Senha"
    And Clico em "Confirmar"
    Then Eu recebo uma mensagem de Senha alterada com Sucesso

Scenario: Administrador deseja remover um usuário do sistema
    Given Eu estou na página de "Painel Admin"
    And Eu estou logado com a conta de administrador default de email  "admin@hotmail.com" e senha  "adminadmin"
    And Vejo uma tabela com os usuários do sistema
    And Eu vejo o usuário de "nome"  "Guilherme Maciel de Melo", "123.456.789-10" em "CPF", "gmm7@cin.ufpe.br" em "e-mail"
    When Eu clico no Botão "X" no usuário "Guilherme Maciel de Melo" And: Escrevo  "adminadmin" em "Senha"
    And Clico em "confirmar"
    Then Eu recebo uma mensagem de que o usuário foi excluído
    And Verifico que o usuário "Guilherme Maciel de Melo" não consta mais na tabela

Scenario: Cadastrar um novo Usuário
    Given Eu estou na página de "Cadastrar novo Cliente"
    When Escrevo "Guilherme Maciel de Melo" em "Nome"
    And Escrevo "gmm7@cin.ufpe.br" em "e-mail"
    And Escrevo "123456Gui" em "Senha"
    And Escrevo "123.456.789-10" em "CPF"
    And Escrevo "99999-9999" em "Telefone"
    And Escrevo "PE" em "estado"
    And Escrevo "Recife" em "Cidade"
    And Escrevo "345" em "numero"
    And Escrevo "Rua General Vargas" em "Endereço"
    And Escrevo "Casa" em "Complemento"
    And Clico em "Cadastrar"
    Then Eu recebo uma mensagem de cadastro realizado 


Scenario: Administrador quer promover um usuário a administrador 
    Given Eu estou na página de "Painel Admin"
    And Eu estou logado com a conta de administrador default de email  "admin@hotmail.com" e senha  "adminadmin"
    And Vejo uma tabela com os usuários do sistema
    And Eu vejo o usuário de "nome"  "Guilherme Maciel de Melo", "123.456.789-10" em "CPF", "gmm7@cin.ufpe.br" em "e-mail"
    When Eu clico no botão "Admin" no usuário "Guilherme Maciel de Melo"
    And Escrevo  "adminadmin" em "Senha"
    And Clico em "confirmar"
    Then Eu recebo uma mensagem de que o usuário virou administrador

Scenario: Erro ao Cadastrar um novo Usuário, senha com menos de 8 dígitos
    Given Eu estou na página de "Cadastrar novo Cliente"
    When Escrevo "Guilherme Maciel de Melo" em "Nome"
    And Escrevo "gmm7@cin.ufpe.br" em "e-mail"
    And Escrevo "1234Gui" em "Senha"
    And Escrevo "123.456.789-10" em "CPF"
    And Escrevo "99999-9999" em "Telefone"
    And Escrevo "PE" em "estado"
    And Escrevo "Recife" em "Cidade"
    And Escrevo "345" em "numero"
    And Escrevo "Rua General Vargas" em "Endereço"
    And Escrevo "Casa" em "Complemento"
    And Clico em "Cadastrar"
    Then Eu recebo uma mensagem de Erro do cadastro  

Scenario: Erro ao Administrador colocar sua senha ao querer promover um usuário a administrador
    Given Eu estou na página de "Painel Admin"
    And Eu estou logado com a conta de administrador default de email  "admin@hotmail.com" e senha  "adminadmin"
    And Vejo uma tabela com os usuários do sistema
    And Eu vejo o usuário de "nome"  "Guilherme Maciel de Melo", "123.456.789-10" em "CPF", "gmm7@cin.ufpe.br" em "e-mail"
    When Eu clico no botão "Admin" no usuário "Guilherme Maciel de Melo"
    And Escrevo  "admin" em "Senha"
    And Clico em "confirmar"
    Then Eu recebo uma mensagem de que a senha está incorreta
    And Eu continuo na página de escrever a senha

Scenario: Erro ao Cadastrar um novo Usuário, e-mail já utilizado
    Given Eu estou na página de "Cadastrar novo Cliente"
    And O sistema já possui "e-mail" "gmm7@cin.ufpe.br" já cadastrado
    When Escrevo "Guilherme Maciel de Melo" em "Nome"
    And Escrevo "gmm7@cin.ufpe.br" em "e-mail"
    And Escrevo "123456Gui" em "Senha"
    And Escrevo "123.456.789-10" em "CPF"
    And Escrevo "99999-9999" em "Telefone"
    And Escrevo "PE" em "estado"
    And Escrevo "Recife" em "Cidade"
    And Escrevo "345" em "numero"
    And Escrevo "Rua General Vargas" em "Endereço"
    And Escrevo "Casa" em "Complemento"
    And Clico em "Cadastrar"
    Then Eu recebo uma mensagem de Erro do cadastro, e-mail já utilizado

Scenario: Administrador default deseja remover outro administrador do sistema
    Given Eu estou na página de "Painel Admin"
    And Eu estou logado com a conta de administrador default de email  "admin@hotmail.com" e senha "adminadmin"
    And Vejo uma tabela com os usuários do sistema
    And Eu vejo o usuário de "nome"  "Guilherme Maciel de Melo", "123.456.789-10” em "CPF", "gmm7@cin.ufpe.br" em "e-mail"
    And Eu vejo que esse usuário já é um administrador
    When Eu clico no botão "X" no usuário "Guilherme Maciel de Melo"
    And Escrevo  "adminadmin" em "Senha"
    And Clico em "confirmar"
    Then Eu recebo uma mensagem de que o usuário foi removido do sisema
    And Eu permaneço na página de "Painel Admin"

Scenario: Erro ao Cadastrar um novo Usuário, CPF já utilizado
    Given Eu estou na página de "Cadastrar novo Cliente"
    And O sistema já possui "CPF" "123.456.789-10" já cadastrado
    When Escrevo "Guilherme Maciel de Melo" em "Nome"
    And Escrevo "gmm7@cin.ufpe.br" em "e-mail"
    And Escrevo "123456Gui" em "Senha"
    And Escrevo "123.456.789-10" em "CPF"
    And Escrevo "99999-9999" em "Telefone"
    And Escrevo "PE" em "estado"
    And Escrevo "Recife" em "Cidade"
    And Escrevo "345" em "numero"
    And Escrevo "Rua General Vargas" em "Endereço"
    And Escrevo "Casa" em "Complemento"
    And Clico em "Cadastrar"
    Then Eu recebo uma mensagem de Erro do cadastro, CPF já utilizado

Scenario: Erro Usuário, já logado no sistema tenta trocar sua senha, erra sua senha atual
    Given Eu estou na página de "Informações do Cliente"
    And Eu estou logado com o email "gmm7@cin.ufpe.br" e senha  "123456Gui"
    When Eu clico na opção "Alterar Senha"
    And Escrevo "3456Gui" em "Senha Atual"
    And Escrevo "98765Gui" em "Nova Senha"
    And Escrevo "98765Gui" em "Confirmar Senha"
    And Clico em "Confirmar"
    Then Eu recebo uma mensagem de erro, senha atual errada

Scenario: Cadastrar um novo Usuário
    Given Eu estou na página de "Cadastrar novo Cliente"
    When Escrevo "Gabriel Maciel de Melo" em "Nome"
    And Escrevo "gmm8@cin.ufpe.br" em "e-mail"
    And Escrevo "123456Gabi" em "Senha"
    And Escrevo "456.123.789-10" em "CPF"
    And Escrevo "88888-8888" em "Telefone"
    And Escrevo "PE" em "estado"
    And Escrevo "Caruaru" em "Cidade"
    And Escrevo "345" em "numero"
    And Escrevo "Avenida Ceara" em "Endereço"
    And Escrevo "Casa" em "Complemento"
    And Clico em "Cadastrar"
    Then Eu recebo uma mensagem de cadastro realizado 
