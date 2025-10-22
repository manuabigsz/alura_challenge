# Teste Alura

Teste Alura

## Requisitos

- Java 18 ou superior
- Spring Boot
- Spring Data JPA
- MySQL
- Migrações de banco de dados manuais com [Flyway](https://www.baeldung.com/database-migrations-with-flyway)
- HTML, CSS e JavaScript
- JSP

## Instruções

1. Faça o upload do template inicial do projeto no seu repositório GitHub e mantenha-o público (seus commits serão avaliados).
2. Importe o projeto na IDE de sua escolha.
3. O código deve ser todo escrito em inglês, mesmo que os requisitos estejam em português.

## Desafio

O projeto base já contém a configuração das tecnologias requeridas. Algumas funcionalidades relacionadas à entidade `Category` e `User` estão implementadas e podem servir como guia para a resolução das questões.

### Questão 1 - Cadastro de Cursos ✅✅✅

Na Alura, grande parte das funcionalidades gira em torno dos cursos. Sua primeira tarefa é listar e implementar o cadastro de cursos, obedecendo às regras definidas abaixo.

#### Atributos

- Nome
- Código (entre 4 e 10 caracteres)
- Instrutor
- Categoria
- Descrição
- Status (`ACTIVE`, `INACTIVE`)
- Data de inativação

#### Regras

- O código do curso deve ser único, textual, sem espaços, números ou caracteres especiais, podendo ser separado por hífen (ex.: `spring-boot-avancado`).
- Os novos cursos devem ser automaticamente definidos como `ACTIVE`.
- O campo "data de inativação" só deve ser preenchido quando o curso for inativado.

> [!TIP]
> Há um ponto de partida no `CourseController` com a rota `admin/course/new`.

# O que foi feito:
- Criada entidade Course e demais
- Refatoração da rota para retornar cursos
- Criado frontend para listar e cadastrar cursos

### Questão 2 - Inativação de Cursos ✅✅✅

Cursos podem ser inativados por diversos motivos, como atualizações ou descontinuação. Você será responsável por implementar essa funcionalidade, seguindo as regras a seguir.

#### Regras

- Acesse a rota `/course/{code}/inactive` para inativar o curso com o código fornecido.
- Ao inativar, o campo "status" deve ser alterado para `INACTIVE` e o campo "data de inativação" deve ser registrado com a data e hora atuais.

# O que foi feito:
- Métodos para ativar e inativar cursos
- Ajuste lista de cursos - switch para ação

### Questão 3 - Front-end página de Login ✅✅✅

Com as categorias e os cursos criados, o próximo passo é fazer com que a página de login receba essas informações dinâmica e a estilização de acordo com o Figma disponibilizado.

- [Figma](https://www.figma.com/design/LNOkJ6pnamwQfoWtOlRCPm/Login?node-id=1-303)

> [!TIP]
> Já existe um ponto de partida no `LoginController`.

# O que foi feito:
- Seeders para Cursos e Categorias, afim de facilitar o desenvolvimento
- Refatoração do LoginCotroller para "puxar" os dados, trazendo apenas cursos ativos
- Ajuste no frontend para exibir essas categorias e cursos de acordo com seus atributos, como cor.

### Bônus (não obrigatório para as questões 4, 5, 6)

### Questão 4 - Edição de Categorias e Cursos ✅✅✅

Com a criação das Categorias e Cursos, podemos criar a edição para ambos.
- Podemos deixar na opção de edição desativar e ativar Cursos.

# O que foi feito:
- Ajuste nos setters das Entidades.
- Refatoração no controller, no create, e adição da rota de edição
- Alteração do newForm, para tornar-se um único formulário que possibilite edição/cadastro de novos cursos/categorias

### Questão 5 - Matrícula de Alunos via API ✅✅✅

Com os cursos criados, o próximo passo é permitir que os alunos se matriculem nos cursos disponíveis.

#### Atributos

- Usuário
- Curso
- Data de matrícula

#### Regras

- Um usuário não pode se matricular mais de uma vez no mesmo curso.
- Só é permitido matrícula em cursos ativos.

> [!TIP]
> Já existe um ponto de partida no `RegistrationController`.

# O que foi feito:
- Criada entidade Registration (matrícula)
- Implementado lógica para o endpoint POST /registration/new
- Validações implementadas:
    - Usuário deve existir e ser estudante
    - Curso deve existir e estar ativo
    - Não permite matrícula duplicada

Requisição exemplo para a rota:
```bash
curl -X POST http://localhost:8080/registration/new   -H "Content-Type: application/json"   -d '{
    "courseCode": "dotnet",
    "studentEmail": "maria.souza@email.com"
}'
```

### Questão 6 - Relatório de Cursos Mais Acessados via API ✅✅✅

Agora que temos usuários e matrículas, queremos gerar um relatório para identificar os cursos mais acessados. Implemente a lógica na rota `/registration/report` para listar os cursos com mais matrículas, ordenados pelo número de inscrições.

> [!IMPORTANT]
> A Alura possui um grande volume de dados. Portanto, priorize o uso de SQL nativo na construção do relatório e evite o [anti-pattern N+1](https://semantix.ai/o-que-e-o-problema-n1/).

# O que foi feito:
- Implementado endpoint GET /registration/report
- Query SQL nativa otimizada (evita problema N+1)
- Retorna cursos ordenados por número de matrículas
Requisição exemplo para a rota:
```bash
curl http://localhost:8080/registration/report
```

## Considerações Finais

- A avaliação será baseada na implementação dos requisitos e na forma como você aplica conceitos de lógica e orientação a objetos.
- Caso tenha dúvidas durante o desenvolvimento, faça anotações no código e implemente o que considerar mais adequado.
- Testes são altamente valorizados, e candidatos que implementarem testes automatizados ganharão pontos extras.
- Códigos muito semelhantes aos de outros candidatos podem resultar na anulação do teste.
- O uso de ferramentas de IA é permitido, mas o código gerado deve ser revisado. Caso avance para a próxima etapa, a entrevista técnica será baseada no código que você produziu.

> [!TIP]
> Para uma melhor organização dos commits, considere seguir as [convenções de commits](https://www.conventionalcommits.org/pt-br/v1.0.0/). Isso ajuda a manter um histórico claro e compreensível do projeto.
