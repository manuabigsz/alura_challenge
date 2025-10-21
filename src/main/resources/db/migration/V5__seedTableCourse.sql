INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Lógica de Programação', 'logica-programacao', 'Curso introdutório de lógica de programação.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'programacao';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT '.NET', 'dotnet', 'Aprenda desenvolvimento com .NET e C#.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'programacao';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Automação', 'automacao', 'Automatize processos com ferramentas e scripts.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'programacao';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Produtividade', 'produtividade', 'Melhore sua produtividade com boas práticas de código.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'programacao';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'HTML', 'html', 'Aprenda HTML5 do básico ao avançado.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'front-end';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'CSS', 'css', 'Estilize páginas web com CSS moderno.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'front-end';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Svelte', 'svelte', 'Desenvolvimento front-end com Svelte.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'front-end';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'VueJS', 'vuejs', 'Desenvolva interfaces reativas com VueJS.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'front-end';


INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'SQL e Banco de Dados', 'sql-banco-dados', 'Fundamentos de SQL e modelagem de dados.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'data-science';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Engenharia de Dados', 'engenharia-dados', 'Construa pipelines de dados eficientes.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'data-science';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Análise de Dados', 'analise-dados', 'Analise dados com Python e ferramentas modernas.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'data-science';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'IA para Criativos', 'ia-criativos', 'Use IA para impulsionar sua criatividade.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'inteligencia-artificial';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'IA para Programação', 'ia-programacao', 'Aplicações de IA no desenvolvimento de software.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'inteligencia-artificial';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'IA para Negócios', 'ia-negocios', 'Como aplicar IA para gerar valor nos negócios.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'inteligencia-artificial';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Linux', 'linux', 'Domine o Linux e seus comandos essenciais.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'devops';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'FinOps', 'finops', 'Gerencie custos e recursos em nuvem com FinOps.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'devops';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Automação de Processos', 'automacao-processos', 'Automatize processos com ferramentas DevOps.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'devops';


INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'UI Design', 'ui-design', 'Crie interfaces modernas e atraentes.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'ux-design';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Design System', 'design-system', 'Construa sistemas de design consistentes.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'ux-design';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'UX Writing', 'ux-writing', 'Escreva textos que melhoram a experiência do usuário.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'ux-design';


INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Flutter', 'flutter', 'Desenvolvimento mobile multiplataforma com Flutter.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'mobile';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Android', 'android', 'Desenvolvimento nativo para Android.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'mobile';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'iOS', 'ios', 'Crie apps nativos para iOS.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'mobile';


INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Agilidade', 'agilidade', 'Domine metodologias ágeis.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'inovacao-gestao';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Liderança', 'lideranca', 'Desenvolva habilidades de liderança e gestão de equipes.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'inovacao-gestao';

INSERT INTO Course (name, code, description, instructor, categoryId)
SELECT 'Ensino e Aprendizagem', 'ensino-aprendizagem', 'Melhore processos de ensino e aprendizagem.', 'instructor@alura.com', c.id
FROM Category c WHERE c.code = 'inovacao-gestao';